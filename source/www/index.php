<?php
/**
* @package   source
* @subpackage 
* @author    source
* @copyright 2023 source
* @link      
* @license    All rights reserved
*/

require ('../application.init.php');
require (JELIX_LIB_CORE_PATH.'request/jClassicRequest.class.php');

checkAppOpened();

jApp::loadConfig('index/config.ini.php');

jApp::setCoord(new jCoordinator());
jApp::coord()->process(new jClassicRequest());



