<?php

/**
 * OrangeHRM is a comprehensive Human Resource Management (HRM) System that captures
 * all the essential functionalities required for any enterprise.
 * Copyright (C) 2006 OrangeHRM Inc., http://www.orangehrm.com
 *
 * OrangeHRM is free software; you can redistribute it and/or modify it under the terms of
 * the GNU General Public License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * OrangeHRM is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program;
 * if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301, USA
 */
/**
 * Actions class for Default module
 *
 *-------------------------------------------------------------------------------------------------------
 *  Author    - Roshan Wijesena
 *  On (Date) - 27 July 2011
 *  Comments  - Description on module action what is happen in the code 
 *  Version   - Version 1.0
 * -------------------------------------------------------------------------------------------------------
**/

include ('../../lib/common/LocaleUtil.php');
class defaultActions extends sfActions {

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeIndex(sfWebRequest $request) {
        //$this->forward('default', 'module');

        if ($request->getParameter('ln')) {

            $userDao = new userDao();

            $userId = $_SESSION['user'];

            $getUserbyID = $userDao->readUser($userId);

            $getUserbyID->setUser_prefered_language($request->getParameter('ln'));

            try {
                 $userDao->saveUser($getUserbyID);
            } catch (sfStopException $sf) {
                
            } catch (Doctrine_Connection_Exception $e) {

                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());

                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('pim/personalDetail');
            } catch (Exception $e) {

                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('pim/personalDetail');
            }
            $_SESSION['language'] = $request->getParameter('ln');
            $this->getUser()->setCulture($request->getParameter('ln'));

            //echo "<script>document.write(window.history.previous.href);</script>";

            die;
        }

        header("Location: ../../../../index.php?lnc=yes"); //die;
        ob_flush();
        die();
    }

    public function executeError404(sfWebRequest $request) {
        die("404");
    }

    /**
     * Warning page for restricted area - requires login
     */
    public function executeSecure() {

    }

    /**
     * Error page
     */
    public function executeError() {

    }
    public function executeAccessDenied() {

    }


    public function executeLanugaeTranslator(sfWebRequest $request) {



        $sysConf=new sysConf();

        $serviceStatus=$sysConf->getLangTransStatus();

        if($serviceStatus=="ON"){
        

        $client = new soapclient($sysConf->getLangTransUrl());

        $inputName = $request->getParameter('inputName');
        $currentLang=$request->getParameter('currentLan');
        $sourceLanguage = $request->getParameter('sourceLanguage');
        // $targetLanguage=$request->getParameter('targetLanguage');
        $gender = "U";
        
        $sinhala = $client->transliterate(array('InputName' => $inputName, 'SourceLanguage' => $sourceLanguage, 'TargetLanguage' => 1, 'Gender' => $gender));
        $tamil = $client->transliterate(array('InputName' => $inputName, 'SourceLanguage' => $sourceLanguage, 'TargetLanguage' => 2, 'Gender' => $gender));
        $english=$client->transliterate(array('InputName' => $inputName, 'SourceLanguage' => $sourceLanguage, 'TargetLanguage' => 3, 'Gender' => $gender));

        if($currentLang=="E"){
            echo json_encode(array('sinhala' => $sinhala->return, 'tamil' => $tamil->return));
        }elseif($currentLang=="S"){
            echo json_encode(array('english' => $english->return, 'tamil' => $tamil->return));
        }else
            echo json_encode(array('sinhala' => $sinhala->return, 'english' => $english->return));
        die;
        }else{
            
        die;
        }
    }

    public function executeButtonSecurityCommon(sfWebRequest $request) {

      
        //$currentValidMenuId=$_SESSION['validCurrnetMenuID'];
        $currentValidMenuId=$_SESSION['currentMenuID'];
            
            $userDao = new userDao();
            
           
            $getButtonsecurity = $userDao->getButtonSecurity($currentValidMenuId);



            echo json_encode(array('save' => $getButtonsecurity[0][mnucapability]['sm_mnucapa_save'], 'add' => $getButtonsecurity[0][mnucapability]['sm_mnucapa_add'],'edit'=>$getButtonsecurity[0][mnucapability]['sm_mnucapa_edit'],'deleteb'=>$getButtonsecurity[0][mnucapability]['sm_mnucapa_delete']));

            die;

   
       
    }
    public function executeLoadonHoverImage(sfWebRequest $request){
        
    }
    public function executePermissionDenind(sfWebRequest $request){

    }
    public function executeTransLateText(sfWebRequest $request){
        
        $text=$request->getParameter('text');
        $string=$this->getContext()->getI18N()->__($text, $args, 'messages');
        echo json_encode($string);
            
        die;
        
    }
}
