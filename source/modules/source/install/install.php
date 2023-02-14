<?php
/**
* @package   source
* @subpackage source
* @author    source
* @copyright 2023 source
* @link      
* @license    All rights reserved
*/


class sourceModuleInstaller extends \Jelix\Installer\Module\Installer {

    function install(\Jelix\Installer\Module\API\InstallHelpers $helpers) {
        //$helpers->database()->execSQLScript('sql/install');

        /*
        jAcl2DbManager::createRight('my.right', 'source~acl.my.right', 'right.group.id');
        jAcl2DbManager::addRight('admins', 'my.right'); // for admin group
        */
    }
}
