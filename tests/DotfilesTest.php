<?php
namespace TJM\Dotfiles\Tests;
use TJM\Dotfiles\Dotfiles;
use PHPUnit\Framework\TestCase;
require_once(__DIR__ . '/../src/Dotfiles.php');

class DotfilesTest extends TestCase{
	const DIR = __DIR__ . '/tmp';
	public function setUp(): void{
		mkdir(self::DIR);
	}
	public function tearDown(): void{
		shell_exec("rm -rf " . self::DIR);
	}
	public function testFilePlacement(){
		$dotfiles = new Dotfiles(array(
			'homeDir'=> self::DIR,
			'interactive'=> false,
			'verbose'=> false,
		));
		$dotfiles->placeAllFiles();
		$existingPaths = explode("\n", trim(shell_exec("find " . self::DIR . " -type l -or -type f")));
		foreach(array(
			'.atom',
			'.bash_profile',
			'.bashrc',
			'.config/fish/config.fish',
			'.config/fish/functions',
			'.dotfiles',
			'.editorconfig',
			'.gitconfig',
			'.gvimrc',
			'.screenrc',
			'.vim',
			'.vimrc',
			'.zshenv',
			'.zshrc',
		) as $testPath){
			$testPath = self::DIR . '/' . $testPath;
			$this->assertContains($testPath, $existingPaths, "File {$testPath} should have been created.");
			$key = array_search($testPath, $existingPaths);
			if($key !== false){
				unset($existingPaths[$key]);
			}
		}
		$this->assertEmpty($existingPaths, 'There should be no extra files found in destination folder, ' . count($existingPaths) . ' found: ' . json_encode($existingPaths));
	}
}
