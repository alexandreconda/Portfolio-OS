<?php
/**
* @package   source
* @subpackage core
* @author    source
* @copyright 2023 source
* @link      
* @license    All rights reserved
*/

class defaultCtrl extends jController {
    /**
    *
    */
    function index() {
        $rep = $this->getResponse('html');
        
        $rep->title = 'Portfolio OS';
        $rep->bodyTpl = 'core~main';
        $rep->body->assignZone('MAIN', 'page');
        
        return $rep;
    }
}

