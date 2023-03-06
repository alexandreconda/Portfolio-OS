<?php
/**
* @package   source
* @subpackage core
* @author    source
* @copyright 2023 source
* @link      
* @license    All rights reserved
*/

class fenetreCtrl extends jController {
    /**
    *
    */
    function index() {
        $rep = $this->getResponse('html');
        
        return $rep;
    }
    
    function ouvrirFenetre() {
        $rep = $this->getResponse('htmlfragment');
        $fid = $this->intParam('id_fichier');
        
        $db = jDb::getConnection();
        $query = $db->query("
            SELECT nom, repertoire, contenu, ids_enfants, img
            FROM core.fichier
            WHERE id = $fid
        ");
        while ($record = $query->fetch()) {
            $fichier = array('nom' => $record->nom, 'repertoire' => $record->repertoire, 'contenu' => $record->contenu, 'ids_enfants' => $record->ids_enfants, 'img' => $record->img);
        }

        $rep->tplname = 'core~fenetre';
        $rep->tpl->assign('titre', $fichier['nom']);
        $rep->tpl->assign('icone', $fichier['img']);
        $rep->tpl->assignZone('contenu', 'core~fichier', array('id_fichier' => $fid));

        return $rep;
    }
    
    
}

