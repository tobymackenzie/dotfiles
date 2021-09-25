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
		$existingPaths = explode("\n", shell_exec("find {$dir} -type l -or -type f"));
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
			'.zshrc',
		) as $testPath){
			$this->assertContains($dir . '/' . $testPath, $existingPaths, "File {$testPath} should have been created.");
		}
		shell_exec("rm -rf {$dir}");
	}
}
