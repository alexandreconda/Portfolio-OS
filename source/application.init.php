<?php
/**
* @package   source
* @subpackage
* @author    source
* @copyright 2023 source
* @link      
* @license    All rights reserved
*/
$vendorDir = realpath(__DIR__.'/../vendor/').'/';
require($vendorDir.'autoload.php');

jApp::initPaths(
    __DIR__.'/',
    __DIR__.'/www/',
    __DIR__.'/var/',
    __DIR__.'/var/log/',
    __DIR__.'/var/config/'
);
jApp::setTempBasePath(__DIR__.'/temp/');

require($vendorDir.'jelix_app_path.php');

// Declares here paths of directories containings plugins and modules,
// that are not already declared into composer.json files of Composer packages
jApp::declareModulesDir(array(
    __DIR__.'/modules/'
));
jApp::declarePluginsDir(array(
    __DIR__.'/plugins'
));

