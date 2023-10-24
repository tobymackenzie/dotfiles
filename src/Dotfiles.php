<?php
namespace TJM\Dotfiles;

class Dotfiles{
	//--base dotfiles directory
	public $baseDir = "~/.dotfiles";

	//--stdin handle to get user input
	public $dateStamp;

	//--home dir, since '~' seems to not work
	public $homeDir;

	//--whether to check with user if they want to replace existing files
	public $interactive = true;

	//--do we want to act if user always says yes to replace files
	public $replacementCheckOverride = false;

	//--real dotfiles directory
	public $realDir;

	//--date for stamping existing versions of files to be replaced
	public $stdin;

	//--whether to echo info about actions
	public $verbose = true;

	public function __construct($opts = Array()){
		if(isset($opts['baseDir'])){
			$this->baseDir = $opts['baseDir'];
		}

		$this->realDir = (isset($opts['realDir']))
			? $opts['realDir']
			: realpath(__DIR__ . '/..')
		;
		if(isset($opts['dateStamp'])){
			$this->dateStamp = $opts['dateStamp'];
		}else{
			$now = new \DateTime();
			$this->dateStamp = $now->format('Ymd-His');
		}

		$this->homeDir = (isset($opts['homeDir']))
			? $opts['homeDir']
			: getenv("HOME")
		;

		if(isset($opts['interactive'])){
			$this->interactive = $opts['interactive'];
		}

		if(isset($opts['replacementCheckOverride'])){
			$this->replacementCheckOverride = $opts['replacementCheckOverride'];
		}elseif(!$this->interactive){
			$this->replacementCheckOverride = true;
		}

		$this->stdin = (isset($opts['stdin']))
			? $opts['stdin']
			: fopen ("php://stdin","r")
		;

		if(isset($opts['verbose'])){
			$this->verbose = $opts['verbose'];
		}
	}

	public function getBaseDir(){
		return $this->baseDir;
	}

	/*=====
	==file placement
	=====*/

	/*
	Method: placeAllFiles
	Place all files for all 'dotfiles.json' in all folders in the project.
	*/
	public function placeAllFiles($dir = null){
		if($dir === null){
			$dir = $this->baseDir;
		}

		$this->placeBaseDirSymlink($dir);

		$files = $this->getAllDotfilesJsons($dir);
		foreach($files as $file){
			if($file){
				$this->placeFilesForDotfilesJson($file);
			}
		}
	}

	/*
	Method: placeBaseDir
	Place symlink for baseDir from realDir
	*/
	public function placeBaseDirSymlink($baseDir = null, $realDir = null){
		if($baseDir === null){
			$baseDir = $this->baseDir;
		}
		if($realDir === null){
			$realDir = $this->realDir;
		}
		if($baseDir !== $realDir){
			$this->placeSymlink($realDir, $baseDir);
		}
	}

	/*
	Method: placeFilesForDotfilesJson
	Given a dotfiles.json, will place all files it says to
	*/
	public function placeFilesForDotfilesJson($file){
		$opts = json_decode(file_get_contents($file), true);
		$dir = dirname($file);
		if(isset($opts['symlinks'])){
			foreach($opts['symlinks'] as $symlink){
				$this->placeSymlinkForOptions($symlink, $dir);
			}
		}
	}

	/*
	Method: placeSymlink
	*/
	public function placeSymlink($source, $target){
		if(file_exists($source)){
			$fullTarget = $this->replaceTildeWithHomePath($target);
			$oldFileTarget = $target . ".pre-{$this->dateStamp}";
			$fullOldFileTarget = $this->replaceTildeWithHomePath($oldFileTarget);
			if(is_link($fullTarget) && readlink($fullTarget) === $source){
				$placeFile = false;
			}elseif(!file_exists($fullTarget)){
				if(is_link($fullTarget)){
					if($this->verbose){
						echo "removing invalid symlink at {$fullTarget}\n";
					}
					unlink($fullTarget);
				}
				$placeFile = true;
			}elseif($this->doesUserWantsToReplaceFile($fullTarget, $fullOldFileTarget)){
				$placeFile = true;
				if($this->verbose){
					echo "Moving {$target} to {$oldFileTarget}\n";
				}
				rename($fullTarget, $fullOldFileTarget);
			}else{
				$placeFile = false;
			}
			if($placeFile){
				$dir = dirname($fullTarget);
				if(!file_exists($dir)){
					if($this->verbose){
						echo "creating parent folder for '{$fullTarget}'\n";
					}
					shell_exec("mkdir -p {$dir}");
				}
				if($this->verbose){
					echo "writing symlink for '{$fullTarget}'\n";
				}
				symlink($source, $fullTarget);
			}
		}
	}

	/*
	Method: placeSymlinkForOptions
	Place symlinks for given options
	Arguments:
		opts(Array)
			source(String): path to existing file to symlink
			target(String): path location symlink will go
	*/
	public function placeSymlinkForOptions($opts = Array(), $dir = null){
		if($dir === null){
			$dir = $this->baseDir;
		}
		$source = $dir . DIRECTORY_SEPARATOR . $opts['source'];
		$target = "~" . DIRECTORY_SEPARATOR . $opts['target'];
		$this->placeSymlink($source, $target);
	}

	/*=====
	==helpers
	=====*/
	/*
	Method: doesUserWantsToReplaceFile
	Check if user wants to replace file with response to question on stdin.
	Arguments:
		$target(String): path to dotfile target
		$oldFileTarget(String): path existing file will be moved to
	Return: Boolean
		Whether user enters 'Y' or 'y' in response to question
	*/
	public function doesUserWantsToReplaceFile($target = '?', $oldFileTarget = '?'){
		if(!$this->replacementCheckOverride){
			echo  "Would you like to replace the file {$target} with the dotfile version?  The existing file will be moved to {$oldFileTarget}. [yNa]\n";
			$response = strtolower(trim(fgets($this->stdin)));
			if($response === 'a'){
				$this->replacementCheckOverride = true;
				return true;
			}else{
				return $response === 'y';
			}
		}else{
			return true;
		}
	}

	/*
	Method: getAllDotfilesJsons
	*/
	public function getAllDotfilesJsons($dir = null){
		if($dir === null){
			$dir = $this->realDir;
		}
		if(substr($dir, 0, 1) === '~'){
			$dir = $this->replaceTildeWithHomePath($dir);
		}
		$dir = realpath($dir);
		$findCommand = "find {$dir} -name 'dotfiles.json'";
		return explode("\n", shell_exec($findCommand));
	}

	/*
	Method: replaceTildeWithHomePath
	PHP seems unable to resolve the tilde in paths.  This utility method replaces the tilde with what should be the full home path.
	*/
	public function replaceTildeWithHomePath($path){
		return preg_replace("/^~/", $this->homeDir, $path);
	}
}
