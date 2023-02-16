<?php
/**
* @package   source
* @subpackage core
* @author    source
* @copyright 2023 source
* @link      
* @license    All rights reserved
*/

class windowCtrl extends jController {
    /**
    *
    */
    function index() {
        $rep = $this->getResponse('html');
        
        return $rep;
    }
    
    function ouvrirFenetre() {
        $rep = $this->getResponse('html');
        $titre = $this->param('titre');

        $rep->bodyTpl = 'core~fenetre';
        
        $rep->body->assign('titre', $titre);
        
        return $rep;
    }
    
    
}

