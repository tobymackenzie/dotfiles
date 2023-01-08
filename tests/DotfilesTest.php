<?php
namespace TJM\Dotfiles\Tests;
use TJM\Dotfiles\Dotfiles;
use PHPUnit\Framework\TestCase;
require_once(__DIR__ . '/../src/Dotfiles.php');

class DotfilesTest extends TestCase{
	public function testFilePlacement(){
		$dir = __DIR__ . '/tmp';
		mkdir($dir);
		$dotfiles = new Dotfiles(array(
			'homeDir'=> $dir,
			'interactive'=> false,
			'verbose'=> false,
		));
		$dotfiles->placeAllFiles();
		$existingPaths = explode("\n", trim(shell_exec("find {$dir} -type l -or -type f")));
		foreach(array(
			'.atom',
			'.bash_profile',
			'.bashrc',
			'.config/fish/config.fish',
			'.config/fish/functions',
			'.dotfiles',
			'.gitconfig',
			'.gvimrc',
			'.screenrc',
			'.vim',
			'.vimrc',
			'.zshenv',
			'.zshrc',
		) as $testPath){
			$testPath = $dir . '/' . $testPath;
			$this->assertContains($testPath, $existingPaths, "File {$testPath} should have been created.");
			$key = array_search($testPath, $existingPaths);
			if($key !== false){
				unset($existingPaths[$key]);
			}
		}
		$this->assertEmpty($existingPaths, 'There should be no extra files found in destination folder, ' . count($existingPaths) . ' found: ' . json_encode($existingPaths));
		shell_exec("rm -rf {$dir}");
	}
}
