<?php
/**
* @package   source
* @subpackage 
* @author    source
* @copyright 2023 source
* @link      
* @license    All rights reserved
*/


require_once (JELIX_LIB_CORE_PATH.'response/jResponseHtml.class.php');

class myHtmlResponse extends jResponseHtml {

    function __construct() {
        parent::__construct();
        $this->addJSLink("jelix/jquery/jquery.min.js");
        $this->addJSLink("jelix/jquery-ui/jquery-ui.min.js");

        $chemin = jApp::urlBasePath().'themes/'.jApp::config()->theme.'/';
        $this->addCssLink($chemin.'design.css');
    }

    protected function doAfterActions() {
        // Include all process in common for all actions, like the settings of the
        // main template, the settings of the response etc..
        
        $this->body->assignIfNone('MAIN','<p>no content</p>');
    }
}
