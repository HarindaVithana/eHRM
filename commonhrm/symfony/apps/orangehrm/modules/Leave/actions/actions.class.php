<?php

/**
 * Leave actions.
 *
 * @package    orangehrm
 * @subpackage Leave
 * @author     JBL
 * @version    SVN: $Id: actions.class.php 12479 2008-10-31 10:54:40Z fabien $
 */
//require_once '../../lib/common/LocaleUtil.php';
include ('../../lib/common/LocaleUtil.php');

class LeaveActions extends sfActions {

    public function executeAjaxADateConvert(sfWebRequest $request) {

        $date = $request->getParameter('date');
        $this->value1 = LocaleUtil::getInstance()->convertToStandardDateFormat(($date));
        echo json_encode(array("date" => $this->value1));
        die;
    }

    public function executeAjaxADateConvertSet(sfWebRequest $request) {

        $date = $request->getParameter('date');
        $this->value1 = LocaleUtil::getInstance()->formatDate($date);
        echo json_encode(array("date" => $this->value1));
        die;
    }

    public function executeLoadGrid(sfWebRequest $request) {
        $this->culture = $this->getUser()->getCulture();
        $secDao = new LeaveDao();
        $empId = $request->getParameter('empid');

        $this->emplist = $secDao->getEmployee($empId);
        $arr = Array();
    }

    public function executeDates(sfWebRequest $request) {

        $SDate = $request->getParameter('SDate');
        $EDate = $request->getParameter('EDate');
        $this->SDate = strtotime($SDate);
        $this->EDate = strtotime($EDate);
        echo json_encode(array("sdate" => $this->SDate, "edate" => $this->EDate));
        die;
    }

    public function executeFormatDates(sfWebRequest $request) {

        $date = $request->getParameter('date');
        $day = getdate($date);
        $langDay = $this->getContext()->getI18N()->__($day['weekday'], $args, 'messages');
        $this->Date = $day['year'] . "-" . $day['mon'] . "-" . $day['mday'] . " : " . $langDay;

        echo json_encode($this->Date);
        die;
    }

    public function executeDocumentType(sfWebRequest $request) {

        try {
            $this->Culture = $this->getUser()->getCulture();
            $this->isAdmin = $_SESSION['isAdmin'];
            $leaveDao = new LeaveDao();

            $this->sorter = new ListSorter('DocumentType', 'Leave', $this->getUser(), array('b.leave_type_id', ListSorter::ASCENDING));
            $this->sorter->setSort(array($request->getParameter('sort'), $request->getParameter('order')));

            if ($request->getParameter('mode') == 'search') {
                if (($request->getParameter('searchMode') == 'all') && (trim($request->getParameter('searchValue')) != '')) {
                    $this->setMessage('NOTICE', array('Select the field to search'));
                    $this->redirect('Leave/DocumentType');
                }
                $this->var = 1;
            }

            $this->searchMode = ($request->getParameter('searchMode') == null) ? 'all' : $request->getParameter('searchMode');
            $this->searchValue = ($request->getParameter('searchValue') == null) ? '' : $request->getParameter('searchValue');

            $this->sort = ($request->getParameter('sort') == '') ? 'b.leave_type_name' : $request->getParameter('sort');
            $this->order = ($request->getParameter('order') == '') ? 'ASC' : $request->getParameter('order');
            $res = $leaveDao->searchDocumentType($this->searchMode, $this->searchValue, $this->Culture, $this->sort, $this->order, $request->getParameter('page'));
            $this->knwdoctype = $res['data'];
            $this->pglay = $res['pglay'];
            $this->pglay->setTemplate('<a href="{%url}">{%page}</a>');
            $this->pglay->setSelectedTemplate('{%page}');
        } catch (Exception $e) {
            $errMsg = new CommonException($e->getMessage(), $e->getCode());
            $this->setMessage('WARNING', $errMsg->display());
            $this->redirect('default/error');
        }
    }

    public function executeSaveDocumentType(sfWebRequest $request) {
        $this->myCulture = $this->getUser()->getCulture();
        $leaveDao = new LeaveDao();
        $knwdt = new LeaveType();
        if ($request->isMethod('post')) {

            if (strlen($request->getParameter('txtName'))) {
                $knwdt->setLeave_type_name(trim($request->getParameter('txtName')));
            } else {
                $knwdt->setLeave_type_name(null);
            }
            if (strlen($request->getParameter('txtNamesi'))) {
                $knwdt->setLeave_type_name_si(trim($request->getParameter('txtNamesi')));
            } else {
                $knwdt->setLeave_type_name_si(null);
            }
            if (strlen($request->getParameter('txtNameta'))) {
                $knwdt->setLeave_type_name_ta(trim($request->getParameter('txtNameta')));
            } else {
                $knwdt->setLeave_type_name_ta(null);
            }

            try {
                $leaveDao->saveDocumentType($knwdt);
            } catch (Doctrine_Connection_Exception $e) {
                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/DocumentType');
            } catch (Doctrine_Connection_Exception $e) {

                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/DocumentType');
            } catch (Exception $e) {
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/DocumentType');
            }

            $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Added", $args, 'messages')));
            $this->redirect('Leave/DocumentType');
        }
    }

    public function executeUpdateDocumentType(sfWebRequest $request) {///die(var_dump($request));
        //Table Lock code is Open
        if (!strlen($request->getParameter('lock'))) {
            $this->lockMode = 0;
        } else {
            $this->lockMode = $request->getParameter('lock');
        }
        $transPid = $request->getParameter('id');

        if (isset($this->lockMode)) {
            if ($this->lockMode == 1) {

                $conHandler = new ConcurrencyHandler();

                $recordLocked = $conHandler->setTableLock('hs_hr_leave_type', array($transPid), 1);

                if ($recordLocked) {
                    // Display page in edit mode
                    $this->lockMode = 1;
                } else {

                    $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Can not update. Record locked by another user.', $args, 'messages')), false);
                    $this->lockMode = 0;
                }
            } else if ($this->lockMode == 0) {//dir("hgf");
                $conHandler = new ConcurrencyHandler();
                $recordLocked = $conHandler->resetTableLock('hs_hr_leave_type', array($transPid), 1);
                $this->lockMode = 0;
            }
        }

        //Table lock code is closed
        $this->myCulture = $this->getUser()->getCulture();
        $LeaveDao = new LeaveDao();

        $knwdt = $LeaveDao->readDocumentType($request->getParameter('id'));
        if (!$knwdt) {
            $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Can not update. Record has been Deleted', $args, 'messages')));
            $this->redirect('Leave/DocumentType');
        }

        $this->benifittypelist = $knwdt;
        if ($request->isMethod('post')) {

            if (strlen($request->getParameter('txtName'))) {
                $knwdt->setLeave_type_name(trim($request->getParameter('txtName')));
            } else {
                $knwdt->setLeave_type_name(null);
            }
            if (strlen($request->getParameter('txtNamesi'))) {
                $knwdt->setLeave_type_name_si(trim($request->getParameter('txtNamesi')));
            } else {
                $knwdt->setLeave_type_name_si(null);
            }
            if (strlen($request->getParameter('txtNameta'))) {
                $knwdt->setLeave_type_name_ta(trim($request->getParameter('txtNameta')));
            } else {
                $knwdt->setLeave_type_name_ta(null);
            }
            try {
                $LeaveDao->saveDocumentType($knwdt);
            } catch (Doctrine_Connection_Exception $e) {
                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/UpdateDocumentType?id=' . $knwdt->getLeave_type_id() . '&lock=0');
            } catch (Exception $e) {
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/UpdateDocumentType?id=' . $knwdt->getLeave_type_id() . '&lock=0');
            }
            $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Updated", $args, 'messages')));
            $this->redirect('Leave/UpdateDocumentType?id=' . $knwdt->getLeave_type_id() . '&lock=0');
        }
    }

    public function executeDeleteDocumentType(sfWebRequest $request) {
        if (count($request->getParameter('chkLocID')) > 0) {

            $LeaveDao = new LeaveDao();
            try {
                $conn = Doctrine_Manager::getInstance()->connection();
                $conn->beginTransaction();
                $ids = array();
                $ids = $request->getParameter('chkLocID');

                $countArr = array();
                $saveArr = array();
                for ($i = 0; $i < count($ids); $i++) {
                    $conHandler = new ConcurrencyHandler();
                    $isRecordLocked = $conHandler->isTableLocked('hs_hr_leave_type', array($ids[$i]), 1);
                    if ($isRecordLocked) {

                        $countArr = $ids[$i];
                    } else {
                        $saveArr = $ids[$i];
                        $LeaveDao->deleteDocumentType($ids[$i]);
                        $conHandler->resetTableLock('hs_hr_leave_type', array($ids[$i]), 1);
                    }
                }

                $conn->commit();
            } catch (Doctrine_Connection_Exception $e) {

                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/DocumentType');
            } catch (Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/DocumentType');
            }
            if (count($saveArr) > 0 && count($countArr) == 0) {
                $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Deleted", $args, 'messages')));
            } elseif (count($saveArr) > 0 && count($countArr) > 0) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Some records are can not be deleted as them  Locked by another user ", $args, 'messages')));
            } elseif (count($saveArr) == 0 && count($countArr) > 0) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Can not delete as them  Locked by another user ", $args, 'messages')));
            }
        } else {
            $this->setMessage('NOTICE', array('Select at least one record to delete'));
        }
        $this->redirect('Leave/DocumentType');
    }

    public function executeLeaveConfiguration(sfWebRequest $request) {
        if (!strlen($request->getParameter('lock'))) {
            $this->lockMode = 0;
        } else {
            $this->lockMode = $request->getParameter('lock');
        }
        $transPid = $request->getParameter('id');

        if (isset($this->lockMode)) {
            if ($this->lockMode == 1) {

                $conHandler = new ConcurrencyHandler();

                $recordLocked = $conHandler->setTableLock('hs_hr_leave_type_config', array($transPid), 1);
                if ($recordLocked) {
                    // Display page in edit mode
                    $this->lockMode = 1;
                } else {
                    $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Can not update. Record locked by another user.', $args, 'messages')), false);
                    $this->lockMode = 0;
                }
            } else if ($this->lockMode == 0) {
                $conHandler = new ConcurrencyHandler();
                $recordLocked = $conHandler->resetTableLock('hs_hr_leave_type_config', array($transPid), 1);
                $this->lockMode = 0;
            }
        }

        $this->Culture = $this->getUser()->getCulture();
        $LeaveDao = new LeaveDao();
        $this->loadbtype = $LeaveDao->getLeaveTypeloadall();

        if ($this->loadbtype[0][leave_type_id] == null) {
            $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Please Enter Leave Type", $args, 'messages')));
            $this->redirect('Leave/DocumentType');
        } else {
            $this->loadEtype = $LeaveDao->getEmployeeTypeload();
            $this->benifittypelist = $knwdt;
        }
        if ($request->isMethod('post')) {
            $status = $LeaveDao->IsLeaveType($request->getParameter('cmbbtype'));
            if ($status[0]['Status'] == 0) {
                $LeavetypeConfig = new LeaveTypeConfig();
            } else {
                $LeavetypeConfig = $LeaveDao->readLeaveTypeConfig($request->getParameter('cmbbtype'));
            }
            if (strlen($request->getParameter('cmbbtype'))) {
                $LeavetypeConfig->setLeave_type_id(trim($request->getParameter('cmbbtype')));
            } else {
                $LeavetypeConfig->setLeave_type_id(null);
            }
            if (strlen($request->getParameter('txtDescription'))) {
                $LeavetypeConfig->setLeave_type_description(trim($request->getParameter('txtDescription')));
            } else {
                $LeavetypeConfig->setLeave_type_description(null);
            }
            if (strlen($request->getParameter('chkActive'))) {
                $LeavetypeConfig->setLeave_type_active_flg(trim($request->getParameter('chkActive')));
            } else {
                $LeavetypeConfig->setLeave_type_active_flg(null);
            }
            if (strlen($request->getParameter('chkEcovering'))) {
                $LeavetypeConfig->setLeave_type_covering_employee_flg(trim($request->getParameter('chkEcovering')));
            } else {
                $LeavetypeConfig->setLeave_type_covering_employee_flg(null);
            }
            if (strlen($request->getParameter('chkAllowHD'))) {
                $LeavetypeConfig->setLeave_type_allow_halfday_flg(trim($request->getParameter('chkAllowHD')));
            } else {
                $LeavetypeConfig->setLeave_type_allow_halfday_flg(null);
            }
            if (strlen($request->getParameter('chkMerity'))) {
                $LeavetypeConfig->setLeave_type_maternity_leave_flg(trim($request->getParameter('chkMerity')));
            } else {
                $LeavetypeConfig->setLeave_type_maternity_leave_flg(null);
            }
            if (strlen($request->getParameter('chkNApprove'))) {
                $LeavetypeConfig->setLeave_type_need_approval_flg(trim($request->getParameter('chkNApprove')));
            } else {
                $LeavetypeConfig->setLeave_type_need_approval_flg(null);
            }
            if (strlen($request->getParameter('txtEntitleDays'))) {
                $LeavetypeConfig->setLeave_type_entitle_days(trim($request->getParameter('txtEntitleDays')));
            } else {
                $LeavetypeConfig->setLeave_type_entitle_days(null);
            }
            if (strlen($request->getParameter('txtApplyBefore'))) {
                if ($request->getParameter('txtApplyBefore') == "0") {
                    $LeavetypeConfig->setLeave_type_need_to_apply_before("0");
                } else {
                    $LeavetypeConfig->setLeave_type_need_to_apply_before(trim($request->getParameter('txtApplyBefore')));
                }
            } else {
                $LeavetypeConfig->setLeave_type_need_to_apply_before("0");
            }
            if (strlen($request->getParameter('txtMaximumLeaveDays'))) {
                $LeavetypeConfig->setLeave_type_max_days_without_medi(trim($request->getParameter('txtMaximumLeaveDays')));
            } else {
                $LeavetypeConfig->setLeave_type_max_days_without_medi(null);
            }
            if (strlen($request->getParameter('txtComments'))) {
                $LeavetypeConfig->setLeave_type_comment(trim($request->getParameter('txtComments')));
            } else {
                $LeavetypeConfig->setLeave_type_comment(null);
            }

            $ConfigDetails = $LeaveDao->readLeaveTypeConfigdetails($request->getParameter('cmbbtype'));
            try {
                $LeaveDao->saveLeaveTypeConfig($LeavetypeConfig);
                $LeaveDao->deletereclevtypeconfigdetail($request->getParameter('cmbbtype'));
                foreach ($this->loadEtype as $etyp) {
                    $LeavetypeConfigDetail = new LeaveTypeConfigDetail();
                    if ($request->getParameter('chk' . $etyp['id']) == 1) {
                        $LeavetypeConfigDetail->setLeave_type_id(trim($request->getParameter('cmbbtype')));
                        $LeavetypeConfigDetail->setEstat_code($etyp['id']);
                        $satus = $LeaveDao->IsLeaveTypedetail($request->getParameter('cmbbtype'), $etyp['id']);
                        $LeaveDao->saveLeaveTypeConfigDetails($LeavetypeConfigDetail);
                    }
                }
            } catch (Doctrine_Connection_Exception $e) {
                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/LeaveConfiguration?id=' . $transPid . '&lock=0');
            } catch (Exception $e) {
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/LeaveConfiguration?id=' . $transPid . '&lock=0');
            }
            $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Updated", $args, 'messages')));
            $this->redirect('Leave/LeaveConfiguration?id=' . $transPid . '&lock=0');
        }
    }

    public function executeAjaxDaysload(sfWebRequest $request) {

        $transPid = $request->getParameter('id');
        $LeaveDao = new LeaveDao();
        $Leavetype = $LeaveDao->LoadLeaveEntitledate($transPid);
        $Maternity = $LeaveDao->getLeaveTypeloadMeternity($transPid);
        echo json_encode(array("EntitleDays" =>$Leavetype[0]['leave_type_entitle_days'],"Maternity" =>$Maternity[0]['leave_type_maternity_leave_flg']));
        die;
    }

    public function executeEmpData(sfWebRequest $request) {
        $Culture = $this->getUser()->getCulture();
        $eid = $request->getParameter('eid');
        $year = $request->getParameter('year');
        $leaveDao = new LeaveDao();
        $Leavetype = $leaveDao->LoadEmpData($eid);
        $Leavetype[0]['job_title_code'];
        if ($Culture == 'en') {
            $abc = "getName";
        } else {
            $abc = "getName_" . $Culture;
        }

        if ($Leavetype[0]->jobTitle->$abc() == null) {
            $jobtitle = $Leavetype[0]->jobTitle->getName();
        } else {
            $jobtitle = $Leavetype[0]->jobTitle->$abc();
        }

        if ($Culture == 'en') {
            $ab = "getTitle";
        } else {
            $ab = "getTitle_" . $Culture;
        }

        if ($Leavetype[0]->subDivision->$ab() == null) {
            $Division = $Leavetype[0]->subDivision->getTitle();
        } else {
            $Division = $Leavetype[0]->subDivision->$ab();
        }
        $this->Sup = $leaveDao->LoadsubordinateData($eid);
        if ($this->Sup[0] !== null) {
            $EData = $leaveDao->LoadEmpData($this->Sup[0]['supervisorId']);
            if ($Culture == 'en') {
                $abcd = "getEmp_display_name";
            } else {
                $abcd = "getEmp_display_name_" . $Culture;
            }

            if ($EData[0]->$abcd() == " ") {
                $superviser = $EData[0]->getEmp_display_name();
            } else {
                $superviser = $EData[0]->$abcd();
            }
        } else {
            $superviser = "NO";
        }
        echo json_encode(array("Designation" => $jobtitle, "Department" => $Division, "Supervisor" => $superviser));
        die;
    }

    public function executeDefaultLeavedetails(sfWebRequest $request) {

        $eid = $request->getParameter('eid');
        $year = $request->getParameter('year');
        $leaveDao = new LeaveDao();
        $entitle = $leaveDao->readLeaveEntitlementDisplay($eid, $year);

        if ($entitle == null) {
            $entitle = array("|");
        }
        echo json_encode(array("entitle" => $entitle));
        die;
    }

    public function executeAjaxEmpType(sfWebRequest $request) {

        $transPid = $request->getParameter('id');
        $LeaveDao = new LeaveDao();
        $this->Leavevalidtype = $LeaveDao->validLeaveTypeConfigdetailsforemployee($transPid);
        echo json_encode(array("Leavevalidtype" => $this->Leavevalidtype));
        die;
    }

    public function executeAjaxLeaveValidation(sfWebRequest $request) {

        $transPid = $request->getParameter('id');
        $LeaveDao = new LeaveDao();
        $LeavetypeConfig = $LeaveDao->readLeaveTypeConfig($transPid);
        if ($LeavetypeConfig->getLeave_type_covering_employee_flg() != null) {
            $this->Cemp = $LeavetypeConfig->getLeave_type_covering_employee_flg();
        } else {
            $this->Cemp = "0";
        }
        if ($LeavetypeConfig->getLeave_type_need_approval_flg() != null) {
            $this->Napp = $LeavetypeConfig->getLeave_type_need_approval_flg();
        } else {
            $this->Napp = "0";
        }
        if ($LeavetypeConfig->getLeave_type_allow_halfday_flg() != null) {
            $this->Ahfd = $LeavetypeConfig->getLeave_type_allow_halfday_flg();
        } else {
            $this->Ahfd = "0";
        }
        if ($LeavetypeConfig->getLeave_type_need_to_apply_before() == 0) {
            $this->NAB = "0";
        } else {
            $numdaysba = $LeavetypeConfig->getLeave_type_need_to_apply_before();
            $Sdate = strtotime(date("Y-m-d"));
            $nday = date('Y-m-d', $Sdate + ($numdaysba * 86400));
            $this->NAB = $nday;
            $this->nodaysbefore = $numdaysba;
        }
        echo json_encode(array("Cemp" => $this->Cemp, "Napp" => $this->Napp, "Ahfd" => $this->Ahfd, "NAB" => $this->NAB, "noofdays" => $this->nodaysbefore));
        die;
    }

    public function executeAjaxLeaveHolydayValidation(sfWebRequest $request) {
        $SempNum = $request->getParameter('Eid');
        $SDate = $request->getParameter('SDate');
        $EDate = $request->getParameter('EDate');
        $HD = $request->getParameter('HD');
        $LType = $request->getParameter('LType');
        $leaveDao = new LeaveDao();
        $LeaavaeHD = $leaveDao->readLeaveHolyDay();
        $start_ts = strtotime($SDate);
        $end_ts = strtotime($EDate);
        $LDays = 0;
        $noDays = null;
        $Dyear = date_parse(date($SDate));
        $Dyear2 = date_parse(date($EDate));
        $LeavaeBal = $leaveDao->readLeaveEntitlement($SempNum, $LType, $Dyear['year']);
        if ($LeavaeBal[0]['leave_ent_remain'] == null or $LeavaeBal[0]['leave_ent_remain'] < 0) {
            $this->LBal = "0";
        } else {
            if ($Dyear['year'] != $Dyear2['year']) {
                $end_ts = strtotime($Dyear['year'] . "-12-31");
                $rem = ($end_ts - $start_ts) / 86400;
                $this->LBal = $rem + 1;
            }
            $this->LBal = $LeavaeBal[0]['leave_ent_remain'];
        }
        $LeavaeRange = $leaveDao->readLeaveLeaveRange($SDate, $EDate, $SempNum);
        if ($HD == "yes") {
            $LeavaeHD = $leaveDao->readLeaveLeaveHD($SDate, $SempNum);
        }
        foreach ($LeaavaeHD as $row) {

            $user_ts = strtotime($row['leave_holiday_date']);

            if (($user_ts >= $start_ts) && ($user_ts <= $end_ts)) {
                if ($row['leave_holiday_fulorhalf'] == "0") {
                    $LDays+=0.5;
                    $user_ts = $user_ts + 5100000000;
                } else {
                    $LDays+=1;
                }
            }
            $hdate[] = $user_ts;
        }

        //------Shift basis calculation
        $AtnDao = new attendanceDao();
        $shift = $AtnDao->readADay();
        $SDay = getdate(strtotime($SDate));
        $EDay = getdate(strtotime($EDate));
        while ($SDay[0] <= $EDay[0]) {
            $middate = getdate($SDay[0]);

            foreach ($shift as $shiftday) {
                if ($shiftday['dt_id'] == "3") {
                    if ($shiftday['adt_day'] == $middate['weekday']) {
                        $hdate[] = $middate[0];
                        $LDays+=1;
                    }
                } else if ($shiftday['dt_id'] == "4") {
                    if ($shiftday['adt_day'] == $middate['weekday']) {
                        $hdate[] = $middate[0] + 5000000000;
                        $LDays+=0.5;
                    }
                }
            }

            $SDay[0]+=86400;
        }
        //-------end Shift basis calculation

        $Ddif = (($end_ts - $start_ts) / (24 * 60 * 60));
        if ($Ddif == 0) {
            $noDays+=1;
        } else if ($Ddif < 0) {
            $noDays = -1;
        } else {
            $noDays = ($Ddif + 1) - $LDays;
        }
        $LDATE = getdate($end_ts);
        if ($LDATE['mon'] < 10) {
            $LDATE['mon'] = '0' . $LDATE['mon'];
        }
        if ($LDATE['mday'] < 10) {
            $LDATE['mday'] = '0' . $LDATE['mday'];
        }
        $ENDDATE = $LDATE['year'] . "-" . $LDATE['mon'] . "-" . $LDATE['mday'];
        if (($LDays == "0.5") && ($noDays == "1")) {
            $noDays = "0.5";
        }
        if ($hdate == null) {
            $hdate = 0;
        }
        $this->Ahfd = $LDays;
        $this->NoDays = $noDays;
        $this->Range = $LeavaeRange;
        $this->HD = $LeavaeHD;
        $this->LeaveDays = $hdate;
        $this->ENDDATE = $ENDDATE;
        echo json_encode(array("LDays" => $this->Ahfd, "NDays" => $this->NoDays, "Range" => $this->Range, "HD" => $this->HD, "LBal" => $this->LBal, "LeaveDays" => $this->LeaveDays, "ENDDate" => $this->ENDDATE));
        die;
    }

    public function executeAjaxLeaveEmployeedataload(sfWebRequest $request) {

    }

    public function executeAjaxLeavecoveringEmployee(sfWebRequest $request) {

        $emp = $request->getParameter('eid');
        $SDate = $request->getParameter('sdate');
        $EDate = $request->getParameter('edate');
        $leaveDao = new LeaveDao();
        $LeavaeHD = $leaveDao->readLeaveLeaveRange($SDate, $EDate, $emp);
        echo json_encode($LeavaeHD);
        die;
    }

    public function executeDTConfig(sfWebRequest $request) {
        if (!strlen($request->getParameter('lock'))) {
            $this->lockMode = 0;
        } else {
            $this->lockMode = $request->getParameter('lock');
        }
        $transPid = $request->getParameter('id');
        if (isset($this->lockMode)) {
            if ($this->lockMode == 1) {

                $conHandler = new ConcurrencyHandler();

                $recordLocked = $conHandler->setTableLock('hs_hr_leave_type', array($transPid), 1);
                $recordLocked = $conHandler->setTableLock('hs_hr_leave_type_config', array($transPid), 1);
                if ($recordLocked) {
                    // Display page in edit mode
                    $this->lockMode = 1;
                } else {
                    $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Can not update. Record locked by another user.', $args, 'messages')), false);
                    $this->lockMode = 0;
                }
            } else if ($this->lockMode == 0) {//dir("hgf");
                $conHandler = new ConcurrencyHandler();
                $recordLocked = $conHandler->resetTableLock('hs_hr_leave_type', array($transPid), 1);
                $recordLocked = $conHandler->resetTableLock('hs_hr_leave_type_config', array($transPid), 1);
                $this->lockMode = 0;
            }
        }
        $LeaveDao = new LeaveDao();
        $Leavetype = $LeaveDao->IsLeaveType($transPid);

        if ($Leavetype[0]['Status'] == "0") {

            $this->ConfigT = null;
            echo json_encode(array($this->ConfigT, $this->lockMode));
        } else {
            $ConfigT = $LeaveDao->readLeaveTypeConfig($transPid);
            $employeeT = $LeaveDao->getEmployeeTypeload();
            $ConfigDetails = $LeaveDao->readLeaveTypeConfigdetails($transPid);
            $leave_type_id = $ConfigT['leave_type_id'];
            $leave_type_description = $ConfigT['leave_type_description'];
            $leave_type_active_flg = $ConfigT['leave_type_active_flg'];
            $leave_type_covering_employee_flg = $ConfigT['leave_type_covering_employee_flg'];
            $leave_type_allow_halfday_flg = $ConfigT['leave_type_allow_halfday_flg'];
            $leave_type_maternity_leave_flg = $ConfigT['leave_type_maternity_leave_flg'];
            $leave_type_need_approval_flg = $ConfigT['leave_type_need_approval_flg'];
            $leave_type_entitle_days = $ConfigT['leave_type_entitle_days'];
            $leave_type_max_days_without_medi = $ConfigT['leave_type_max_days_without_medi'];
            $leave_type_need_to_apply_before = $ConfigT['leave_type_need_to_apply_before'];
            $leave_type_wf_id = $ConfigT['leave_type_wf_id'];
            $leave_type_comment = $ConfigT['leave_type_comment'];

            //leave type config details
            $leave_type_id = $ConfigT['leave_type_id'];
            echo json_encode(array($leave_type_id, $leave_type_description, $leave_type_active_flg, $leave_type_covering_employee_flg, $leave_type_allow_halfday_flg, $leave_type_maternity_leave_flg, $leave_type_need_approval_flg, $leave_type_entitle_days, $leave_type_max_days_without_medi, $leave_type_need_to_apply_before, $leave_type_wf_id, $leave_type_comment, $ConfigDetails, $this->lockMode));
        }
        die;
    }

    public function executeEntitlement(sfWebRequest $request) {

        try {
            $this->Culture = $this->getUser()->getCulture();
            $this->isAdmin = $_SESSION['isAdmin'];
            $leaveDao = new LeaveDao();

            $this->sorter = new ListSorter('Entitlement', 'Leave', $this->getUser(), array('b.emp_number', ListSorter::ASCENDING));
            $this->sorter->setSort(array($request->getParameter('sort'), $request->getParameter('order')));

            if ($request->getParameter('mode') == 'search') {
                if (($request->getParameter('searchMode') == 'all') && (trim($request->getParameter('searchValue')) != '')) {
                    $this->setMessage('NOTICE', array('Select the field to search'));
                    $this->redirect('Leave/Entitlement');
                }
                $this->var = 1;
            }

            $this->searchMode = ($request->getParameter('searchMode') == null) ? 'all' : $request->getParameter('searchMode');
            $this->searchValue = ($request->getParameter('searchValue') == null) ? '' : $request->getParameter('searchValue');

            $this->sort = ($request->getParameter('sort') == '') ? 'b.emp_number' : $request->getParameter('sort');
            $this->order = ($request->getParameter('order') == '') ? 'ASC' : $request->getParameter('order');
            $res = $leaveDao->searchEntitlement($this->searchMode, $this->searchValue, $this->Culture, $this->sort, $this->order, $request->getParameter('page'));
            $this->knwdoctype = $res['data'];
            $this->pglay = $res['pglay'];
            $this->pglay->setTemplate('<a href="{%url}">{%page}</a>');
            $this->pglay->setSelectedTemplate('{%page}');
        } catch (Exception $e) {
            $errMsg = new CommonException($e->getMessage(), $e->getCode());
            $this->setMessage('WARNING', $errMsg->display());
            $this->redirect('default/error');
        }
    }

    public function executeSaveEntitlement(sfWebRequest $request) {
        $this->Culture = $this->getUser()->getCulture();
        $leaveDao = new LeaveDao();
        $this->loadbtype = $leaveDao->getLeaveTypeload();
        $ss = $request->getParameter('hiddenEmpNumber');

        if ($request->isMethod('post')) {
            try {
                $conn = Doctrine_Manager::getInstance()->connection();
                $conn->beginTransaction();

                foreach ($ss as $row) {

                    $knwdt = new LeaveEntitlement();
                    if (strlen($row)) {
                        $knwdt->setEmp_number(trim($row));
                    } else {
                        $knwdt->setEmp_number(null);
                    }
                    if (strlen($request->getParameter('cmbbtype'))) {
                        $knwdt->setLeave_type_id(trim($request->getParameter('cmbbtype')));
                    } else {
                        $knwdt->setLeave_type_id(null);
                    }
                    if (strlen($request->getParameter('txtYear'))) {
                        $knwdt->setLeave_ent_year(trim($request->getParameter('txtYear')));
                    } else {
                        $knwdt->setLeave_ent_day(null);
                    }
                    if (strlen($request->getParameter('txtEntitleDays'))) {
                        $knwdt->setLeave_ent_day(trim($request->getParameter('txtEntitleDays')));
                    } else {
                        $knwdt->setLeave_ent_day(0);
                    }
                    if (strlen($request->getParameter('txtSheduleDays'))) {
                        $knwdt->setLeave_ent_sheduled(trim($request->getParameter('txtSheduleDays')));
                    } else {
                        $knwdt->setLeave_ent_sheduled(0);
                    }
                    if (strlen($request->getParameter('txtEnTakenDays'))) {
                        $knwdt->setLeave_ent_taken(trim($request->getParameter('txtEnTakenDays')));
                    } else {
                        $knwdt->setLeave_ent_taken(0);
                    }

                    $remain = ($request->getParameter('txtEntitleDays') - ($request->getParameter('txtEnTakenDays') + $request->getParameter('txtSheduleDays')));
                    $knwdt->setLeave_ent_remain($remain);



                    $readLeaveEnt = $leaveDao->readLeaveEntitlement($row, $request->getParameter('cmbbtype'), $request->getParameter('txtYear'));
                    if ($readLeaveEnt == null) {
                        $leaveDao->saveEntitlement($knwdt);
                    } else {
                        $leaveDao->UpdateEntitlement($row, $request->getParameter('cmbbtype'), $request->getParameter('txtYear'), $request->getParameter('txtEntitleDays'), "null", "null", $remain);
                    }
                }
                $conn->commit();
            } catch (Doctrine_Connection_Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Entitlement');
            } catch (Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Entitlement');
            }
            $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Added", $args, 'messages')));
            $this->redirect('Leave/Entitlement');
        }
    }

    public function executeUpdateEntitlement(sfWebRequest $request) {
        //Table Lock code is Open

        if (!strlen($request->getParameter('lock'))) {
            $this->lockMode = 0;
        } else {
            $this->lockMode = $request->getParameter('lock');
        }
        $transPeid = $request->getParameter('eid');
        $transPlt = $request->getParameter('lt');
        $transPyr = $request->getParameter('yr');

        if (isset($this->lockMode)) {
            if ($this->lockMode == 1) {

                $conHandler = new ConcurrencyHandler();

                $recordLocked = $conHandler->setTableLock('hs_hr_leave_entitlement', array($transPeid, $transPlt, $transPyr), 1);

                if ($recordLocked) {
                    // Display page in edit mode
                    $this->lockMode = 1;
                } else {
                    $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Can not update. Record locked by another user.', $args, 'messages')), false);
                    $this->lockMode = 0;
                }
            } else if ($this->lockMode == 0) {
                $conHandler = new ConcurrencyHandler();
                $recordLocked = $conHandler->resetTableLock('hs_hr_leave_entitlement', array($transPeid, $transPlt, $transPyr), 1);
                $this->lockMode = 0;
            }
        }

        //Table lock code is closed
        $this->Culture = $this->getUser()->getCulture();
        $LeaveDao = new LeaveDao();
        $this->loadbtype = $LeaveDao->getLeaveTypeload();

        $readLeaveEnt = $LeaveDao->readLeaveEntitlement($request->getParameter('eid'), $request->getParameter('lt'), $request->getParameter('yr'));
        if (!$readLeaveEnt) {
            $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Can not update. Record has been Deleted', $args, 'messages')));
            $this->redirect('Leave/Entitlement');
        }
        $this->Entitle = $readLeaveEnt;
        $readLeave = $LeaveDao->LoadLeaveEntitledate($request->getParameter('lt'));
        $this->Entitlemax = $readLeave[0]['leave_type_entitle_days'];

        $Entitlemin1 = $readLeaveEnt[0]['leave_ent_sheduled'];
        $Entitlemin2 = $readLeaveEnt[0]['leave_ent_taken'];

        $Entitlemin = $Entitlemin1;
        if ($Entitlemin < $Entitlemin2) {
            $Entitlemin = $Entitlemin2;
        } else {
            $Entitlemin = $Entitlemin1;
        }
        $this->Entitlemin = $Entitlemin;
        $this->empname = $LeaveDao->reademplyeename($readLeaveEnt[0]['emp_number'], $this->Culture);
        if ($request->isMethod('post')) {
            if (strlen($request->getParameter('txtEmpId'))) {
                $txtEmpId = $request->getParameter('txtEmpId');
            } else {
                $txtEmpId = $request->getParameter('eid');
            }
            if (strlen($request->getParameter('cmbbtype'))) {
                $cmbbtype = $request->getParameter('cmbbtype');
            } else {
                $cmbbtype = "null";
            }
            if (strlen($request->getParameter('txtYear'))) {
                $txtYear = $request->getParameter('txtYear');
            } else {
                $txtYear = "null";
            }
            if (strlen($request->getParameter('txtEntitleDays'))) {
                $txtEntitleDays = $request->getParameter('txtEntitleDays');
            } else {
                $txtEntitleDays = "null";
            }
            if ($request->getParameter('txtSheduleDays') != null) {
                $txtSheduleDays = $request->getParameter('txtSheduleDays');
            } else {
                $txtSheduleDays = "null";
            }
            if (strlen($request->getParameter('txtEnTakenDays'))) {
                $txtEnTakenDays = $request->getParameter('txtEnTakenDays');
            } else {
                $txtEnTakenDays = "null";
            }
            $leave_ent_remain = ($txtEntitleDays - ($txtSheduleDays + $txtEnTakenDays));

            try {
                $LeaveDao->UpdateEntitlement($txtEmpId, $cmbbtype, $txtYear, $txtEntitleDays, $txtSheduleDays, $txtEnTakenDays, $leave_ent_remain);
            } catch (Doctrine_Connection_Exception $e) {
                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/UpdateEntitlement?eid=' . $readLeaveEnt[0]['emp_number'] . '&lt=' . $readLeaveEnt[0]['leave_type_id'] . '&yr=' . $readLeaveEnt[0]['leave_ent_year'] . '&lock=0');
            } catch (Exception $e) {
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/UpdateEntitlement?eid=' . $readLeaveEnt[0]['emp_number'] . '&lt=' . $readLeaveEnt[0]['leave_type_id'] . '&yr=' . $readLeaveEnt[0]['leave_ent_year'] . '&lock=0');
            }
            $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Updated", $args, 'messages')));
            $this->redirect('Leave/UpdateEntitlement?eid=' . $readLeaveEnt[0]['emp_number'] . '&lt=' . $readLeaveEnt[0]['leave_type_id'] . '&yr=' . $readLeaveEnt[0]['leave_ent_year'] . '&lock=0');
        }
    }

    public function executeDeleteEntitlement(sfWebRequest $request) {

        if (count($request->getParameter('chkLocID')) > 0) {

            $LeaveDao = new LeaveDao();
            try {
                $conn = Doctrine_Manager::getInstance()->connection();
                $conn->beginTransaction();
                $ids = array();
                $ids = $request->getParameter('chkLocID');
                $i = 0;
                $countArr = array();
                $saveArr = array();
                foreach ($ids as $row) {
                    $col = explode("|", $row);
                    $conHandler = new ConcurrencyHandler();
                    $isRecordLocked = $conHandler->isTableLocked('hs_hr_leave_entitlement', array($col[0], $col[1], $col[2]), 1);
                    if ($isRecordLocked) {

                        $countArr[$i] = $col[0];
                    } else {
                        $saveArr[$i] = $col[0];
                        $LeaveDao->deleteEntitlement($row);
                        $conHandler->resetTableLock('hs_hr_leave_entitlement', array($col[0], $col[1], $col[2]), 1);
                    }
                    $i++;
                }
                $conn->commit();
            } catch (Doctrine_Connection_Exception $e) {

                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Entitlement');
            } catch (Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Entitlement');
            }
            if (count($saveArr) > 0 && count($countArr) == 0) {
                $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Deleted", $args, 'messages')));
            } elseif (count($saveArr) > 0 && count($countArr) > 0) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Some records are can not be deleted as them  Locked by another user ", $args, 'messages')));
            } elseif (count($saveArr) == 0 && count($countArr) > 0) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Can not delete as them  Locked by another user ", $args, 'messages')));
            }
        } else {
            $this->setMessage('NOTICE', array('Select at least one record to delete'));
        }
        $this->redirect('Leave/Entitlement');
    }

    public function executeLeave(sfWebRequest $request) {

        try {
            $this->Culture = $this->getUser()->getCulture();
            if ($request->getParameter('eid') != null) {
                $SempNum = $request->getParameter('eid');
                if($request->getParameter('eid')==$_SESSION['empNumber']){
                    $this->btnactive = 1;
                }
            } else {
                $SempNum = $_SESSION['empNumber'];
            }
            $leaveDao = new LeaveDao();

            $this->sorter = new ListSorter('Leave', 'Leave', $this->getUser(), array('b.leave_app_id', ListSorter::ASCENDING));
            $this->sorter->setSort(array($request->getParameter('sort'), $request->getParameter('order')));

            if ($request->getParameter('mode') == 'search') {
                if (($request->getParameter('searchMode') == 'all') && (trim($request->getParameter('searchValue')) != '')) {
                    $this->setMessage('NOTICE', array('Select the field to search'));
                    $this->redirect('Leave/Entitlement');
                }
                $this->var = 1;
            }

            $this->searchMode = ($request->getParameter('searchMode') == null) ? 'all' : $request->getParameter('searchMode');
            $this->searchValue = ($request->getParameter('searchValue') == null) ? '' : $request->getParameter('searchValue');

            $this->sort = ($request->getParameter('sort') == '') ? 'b.leave_app_id' : $request->getParameter('sort');
            $this->order = ($request->getParameter('order') == '') ? 'ASC' : $request->getParameter('order');
            $this->empid = ($SempNum == '') ? 'ASC' : $SempNum;
            $res = $leaveDao->searchLeave($this->searchMode, $this->searchValue, $this->Culture, $this->sort, $this->order, $request->getParameter('page'), $this->empid);
            $this->knwdoctype = $res['data'];
            $this->pglay = $res['pglay'];
            $this->pglay->setTemplate('<a href="{%url}">{%page}</a>');
            $this->pglay->setSelectedTemplate('{%page}');
        } catch (Exception $e) {
            $errMsg = new CommonException($e->getMessage(), $e->getCode());
            $this->setMessage('WARNING', $errMsg->display());
            $this->redirect('default/error');
        }
    }

    public function executeSaveLeave(sfWebRequest $request) {//die(print_r($_POST));
        $SempNum = $_SESSION['empNumber'];
        $this->eNum = $_SESSION['empNumber'];

        $this->Culture = $this->getUser()->getCulture();
        $leaveDao = new LeaveDao();
        $this->loadbtype = $leaveDao->getLeaveTypeload();
        $this->LeaveHoly = $leaveDao->readLeaveHolyDay();

        $this->EData = $leaveDao->LoadEmpData($SempNum);
        if ($this->EData[0]->getEmp_number() == null) {
            $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Admin Can not apply Leave. ", $args, 'messages')));
            $this->redirect('Leave/Leave');
        }
        $this->Sup = $leaveDao->LoadsubordinateData($SempNum);
        if ($this->Sup[0] !== null) {
            $this->ESupData = $leaveDao->LoadEmpData($this->Sup[0]['supervisorId']);
        } else {
            $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("You don't have Superviser, Can't Apply Leave. ", $args, 'messages')));
            $this->redirect('Leave/Leave');
        }
        $knwdt = new LeaveApplication();
        if ($request->isMethod('post')) {//die(print_r($_POST));
            if (strlen($request->getParameter('txtEmpId'))) {
                $knwdt->setEmp_number(trim($request->getParameter('txtEmpId')));
            } else {
                $knwdt->setEmp_number(null);
            }
            if (strlen($request->getParameter('cmbbtype'))) {
                $knwdt->setLeave_type_id(trim($request->getParameter('cmbbtype')));
            } else {
                $knwdt->setLeave_type_id(null);
            }
            if (strlen($request->getParameter('txtLeaveStartDate'))) {
                $knwdt->setLeave_app_start_date(trim(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveStartDate'))));
            } else {
                $knwdt->setLeave_app_start_date(null);
            }
            if (strlen($request->getParameter('txtLeaveEndDate'))) {
                $knwdt->setLeave_app_end_date(trim(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveEndDate'))));
            } else {
                $knwdt->setLeave_app_end_date(null);
            }
            if (strlen($request->getParameter('txtAppEmpId'))) {
                $knwdt->setLeave_app_covemp_number(trim($request->getParameter('txtAppEmpId')));
            } else {
                $knwdt->setLeave_app_covemp_number(null);
            }
            if (strlen($request->getParameter('cmbLeaveReason'))) {
                $knwdt->setLeave_app_reason(trim($request->getParameter('cmbLeaveReason')));
            } else {
                $knwdt->setLeave_app_reason(null);
            }
            if (strlen($request->getParameter('txtComments'))) {
                $knwdt->setLeave_app_comment(trim($request->getParameter('txtComments')));
            } else {
                $knwdt->setLeave_app_comment(null);
            }
            if (strlen($request->getParameter('txtnofodays'))) {
                $knwdt->setLeave_app_workdays(trim($request->getParameter('txtnofodays')));
            } else {
                $knwdt->setLeave_app_workdays(null);
            }
            if (strlen($request->getParameter('txtApproved'))) {
                $knwdt->setLeave_app_status(trim($request->getParameter('txtApproved')));
            } else {
                $knwdt->setLeave_app_status(null);
            }
            $Approved = $request->getParameter('txtApproved');


            $knwdt->setLeave_app_applied_date(date("Y-m-d"));

            $userEntdays = $request->getParameter('txtnofodays');
            $year = date_parse(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveStartDate')));
            if ($year == null) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Year Format has Change ", $args, 'messages')));
                $this->redirect('Leave/Leave');
            }

            try {
                $conn = Doctrine_Manager::getInstance()->connection();
                $conn->beginTransaction();
                $leavetypeconfig = $leaveDao->readLeaveTypeConfig($request->getParameter('cmbbtype'));
                if ($leavetypeconfig != null) {
                    $Entitleday = $leavetypeconfig->getLeave_type_entitle_days();
                }

                $readconfig = $leaveDao->readLeaveEntitlement($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), $year['year']);
                if ($Approved == "2") {
                    $Taken = $userEntdays;
                } else {
                    $shedule = $userEntdays;
                }
                if ($readconfig[0] == null) {

                    $newEntReamin = $Entitleday - $userEntdays;


                    $leaveent = new LeaveEntitlement();
                    $leaveent->setEmp_number(trim($request->getParameter('txtEmpId')));
                    $leaveent->setLeave_type_id(trim($request->getParameter('cmbbtype')));
                    $leaveent->setLeave_ent_year($year['year']);
                    $leaveent->setLeave_ent_day($Entitleday);
                    $leaveent->setLeave_ent_sheduled($shedule);
                    $leaveent->setLeave_ent_remain($newEntReamin);
                    $leaveent->setLeave_ent_taken($Taken);
                    $leaveDao->saveEntitlement($leaveent);
                } else {
                    //-------------------------

                    if ($Approved == "2") {
                        $Entitletaken = $readconfig[0]['leave_ent_taken'] + $userEntdays;
                        $Entitleremain = $readconfig[0]['leave_ent_remain'] - $userEntdays;
                        $leaveDao->UpdateEntitlementLeaveNoShedule($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), $year['year'], $Entitletaken, $Entitleremain);
                    } else {
                        $Entitleshedule = $readconfig[0]['leave_ent_sheduled'] + $userEntdays;
                        $Entitleremain = $readconfig[0]['leave_ent_remain'] - $userEntdays;
                        $leaveDao->UpdateEntitlementLeaveNoTaken($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), $year['year'], $Entitleshedule, $Entitleremain);
                    }


                    //---------------
                }
                $leaveDao->saveLeave($knwdt);
                $leaveid = $leaveDao->findlastleave($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveStartDate')), LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveEndDate')), $request->getParameter('txtnofodays'));
                if ($request->getParameter('datedetails') != null) {
                    $row = explode(',', $request->getParameter('datedetails'));

                    foreach ($row as $data) {
                        $col = explode('|', $data);
                        $leavedetail = new LeaveDetail();
                        $leavedetail->setLeave_app_id($leaveid[0]['Max']);
                        $leavedetail->setLeave_app_applied_date($col[0]);
                        if ($col[1] == "1") {
                            $leavedetail->setLeave_dtl_amount(1);
                            $leavedetail->setLeave_dtl_type("1");
                            $leaveDao->saveLeavedeatil($leavedetail);
                        } elseif ($col[1] == "2") {
                            $leavedetail->setLeave_dtl_amount(0.5);
                            $leavedetail->setLeave_dtl_type("2");
                            $leaveDao->saveLeavedeatil($leavedetail);
                        } elseif ($col[1] == "3") {
                            $leavedetail->setLeave_dtl_amount(0.5);
                            $leavedetail->setLeave_dtl_type("3");
                            $leaveDao->saveLeavedeatil($leavedetail);
                        }
                    }
                }
                $conn->commit();
            } catch (Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Leave');
            }
            $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Added", $args, 'messages')));
            $this->redirect('Leave/Leave?eid=' . $request->getParameter('txtEmpId'));
        }
    }

    public function executeSaveLeaveuser(sfWebRequest $request) {

        $this->Culture = $this->getUser()->getCulture();
        $leaveDao = new LeaveDao();
        $this->loadbtype = $leaveDao->getLeaveTypeload();
        $this->LeaveHoly = $leaveDao->readLeaveHolyDay();
        $this->LeaveHoly = array();
        if($LeaveHolyDay){
        foreach ($LeaveHolyDay as $row) {
            $LeaveHoly[] = $row['leave_holiday_date'];
        }
        }
        $this->LeaveHD = $LeaveHoly;

        $knwdt = new LeaveApplication();
        if ($request->isMethod('post')) {//die(print_r($_POST));
            if (strlen($request->getParameter('txtEmpId'))) {
                $knwdt->setEmp_number(trim($request->getParameter('txtEmpId')));
            } else {
                $knwdt->setEmp_number(null);
            }
            if (strlen($request->getParameter('cmbbtype'))) {
                $knwdt->setLeave_type_id(trim($request->getParameter('cmbbtype')));
            } else {
                $knwdt->setLeave_type_id(null);
            }
            if (strlen($request->getParameter('txtLeaveStartDate'))) {
                $knwdt->setLeave_app_start_date(trim(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveStartDate'))));
            } else {
                $knwdt->setLeave_app_start_date(null);
            }
            if (strlen($request->getParameter('txtLeaveEndDate'))) {
                $knwdt->setLeave_app_end_date(trim(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveEndDate'))));
            } else {
                $knwdt->setLeave_app_end_date(null);
            }
            if (strlen($request->getParameter('txtAppEmpId'))) {
                $knwdt->setLeave_app_covemp_number(trim($request->getParameter('txtAppEmpId')));
            } else {
                $knwdt->setLeave_app_covemp_number(null);
            }
            if (strlen($request->getParameter('cmbLeaveReason'))) {
                $knwdt->setLeave_app_reason(trim($request->getParameter('cmbLeaveReason')));
            } else {
                $knwdt->setLeave_app_reason(null);
            }
            if (strlen($request->getParameter('txtComments'))) {
                $knwdt->setLeave_app_comment(trim($request->getParameter('txtComments')));
            } else {
                $knwdt->setLeave_app_comment(null);
            }
            if (strlen($request->getParameter('txtnofodays'))) {
                $knwdt->setLeave_app_workdays(trim($request->getParameter('txtnofodays')));
            } else {
                $knwdt->setLeave_app_workdays(null);
            }
            if (strlen($request->getParameter('txtApproved'))) {
                $knwdt->setLeave_app_status(trim($request->getParameter('txtApproved')));
            } else {
                $knwdt->setLeave_app_status(null);
            }
            $Approved = $request->getParameter('txtApproved');


            $knwdt->setLeave_app_applied_date(date("Y-m-d"));

            $userEntdays = $request->getParameter('txtnofodays');
            $year = date_parse(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveStartDate')));
            if ($year == null) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Year Format has Change ", $args, 'messages')));
                $this->redirect('Leave/Leave');
            }

            try {
                $conn = Doctrine_Manager::getInstance()->connection();
                $conn->beginTransaction();
                $leavetypeconfig = $leaveDao->readLeaveTypeConfig($request->getParameter('cmbbtype'));
                if ($leavetypeconfig != null) {
                    $Entitleday = $leavetypeconfig->getLeave_type_entitle_days();
                }

                $readconfig = $leaveDao->readLeaveEntitlement($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), $year['year']);
                if ($Approved == "2") {
                    $Taken = $userEntdays;
                } else {
                    $shedule = $userEntdays;
                }
                if ($readconfig[0] == null) {

                    $newEntReamin = $Entitleday - $userEntdays;


                    $leaveent = new LeaveEntitlement();
                    $leaveent->setEmp_number(trim($request->getParameter('txtEmpId')));
                    $leaveent->setLeave_type_id(trim($request->getParameter('cmbbtype')));
                    $leaveent->setLeave_ent_year($year['year']);
                    $leaveent->setLeave_ent_day($Entitleday);
                    $leaveent->setLeave_ent_sheduled($shedule);
                    $leaveent->setLeave_ent_remain($newEntReamin);
                    $leaveent->setLeave_ent_taken($Taken);
                    $leaveDao->saveEntitlement($leaveent);
                } else {
                    //-------------------------

                    if ($Approved == "2") {
                        $Entitletaken = $readconfig[0]['leave_ent_taken'] + $userEntdays;
                        $Entitleremain = $readconfig[0]['leave_ent_remain'] - $userEntdays;
                        $leaveDao->UpdateEntitlementLeaveNoShedule($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), $year['year'], $Entitletaken, $Entitleremain);
                    } else {
                        $Entitleshedule = $readconfig[0]['leave_ent_sheduled'] + $userEntdays;
                        $Entitleremain = $readconfig[0]['leave_ent_remain'] - $userEntdays;
                        $leaveDao->UpdateEntitlementLeaveNoTaken($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), $year['year'], $Entitleshedule, $Entitleremain);
                    }


                    //---------------
                }
                $leaveDao->saveLeave($knwdt);
                $leaveid = $leaveDao->findlastleave($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveStartDate')), LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveEndDate')), $request->getParameter('txtnofodays'));
                if ($request->getParameter('datedetails') != null) {
                    $row = explode(',', $request->getParameter('datedetails'));

                    foreach ($row as $data) {
                        $col = explode('|', $data);
                        $leavedetail = new LeaveDetail();
                        $leavedetail->setLeave_app_id($leaveid[0]['Max']);
                        $leavedetail->setLeave_app_applied_date($col[0]);
                        if ($col[1] == "1") {
                            $leavedetail->setLeave_dtl_amount(1);
                            $leavedetail->setLeave_dtl_type("1");
                            $leaveDao->saveLeavedeatil($leavedetail);
                        } elseif ($col[1] == "2") {
                            $leavedetail->setLeave_dtl_amount(0.5);
                            $leavedetail->setLeave_dtl_type("2");
                            $leaveDao->saveLeavedeatil($leavedetail);
                        } elseif ($col[1] == "3") {
                            $leavedetail->setLeave_dtl_amount(0.5);
                            $leavedetail->setLeave_dtl_type("3");
                            $leaveDao->saveLeavedeatil($leavedetail);
                        }
                    }
                }
                $conn->commit();
            } catch (Doctrine_Connection_Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Leave');
            } catch (Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Leave?eid=');
            }
            $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Added", $args, 'messages')));
            $this->redirect('Leave/Leave?eid=' . $request->getParameter('txtEmpId'));
        }
    }

    public function executeUpdateLeave(sfWebRequest $request) {

        //Table Lock code is Open

        if (!strlen($request->getParameter('lock'))) {
            $this->lockMode = 0;
        } else {
            $this->lockMode = $request->getParameter('lock');
        }
        $transPid = $request->getParameter('id');
        if (isset($this->lockMode)) {
            if ($this->lockMode == 1) {

                $conHandler = new ConcurrencyHandler();

                $recordLocked = $conHandler->setTableLock('hs_hr_leave_application', array($transPid), 1);

                if ($recordLocked) {
                    // Display page in edit mode
                    $this->lockMode = 1;
                } else {
                    $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Can not update. Record locked by another user.', $args, 'messages')), false);
                    $this->lockMode = 0;
                }
            } else if ($this->lockMode == 0) {//dir("hgf");
                $conHandler = new ConcurrencyHandler();
                $recordLocked = $conHandler->resetTableLock('hs_hr_leave_application', array($transPid), 1);
                $this->lockMode = 0;
            }
        }

        //Table lock code is closed
        $leaveDao = new LeaveDao();
        $knwdt = $leaveDao->getLeaveload($request->getParameter('id'));

        if (!$knwdt) {
            $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Can not update. Record has been Deleted', $args, 'messages')));
            $this->redirect('Leave/Leave');
        }
        if ($knwdt->getLeave_app_status() == 0) {
            $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Canceled Leave', $args, 'messages')));
            $this->show = 1;
        } else {
            $this->show = 0;
        }



        //$SempNum = $_SESSION['empNumber'];
        $SempNum = $knwdt->getEmp_number();
        $this->Culture = $this->getUser()->getCulture();


        $this->loadbtype = $leaveDao->getLeaveTypeload();
        $this->EData = $leaveDao->LoadEmpData($SempNum);
        if ($this->EData[0]->getEmp_number() == null) {
            $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("You don't have Employee Number, So not an Employee, ", $args, 'messages')));
            $this->redirect('Leave/Leave');
        }
        $this->Sup = $leaveDao->LoadsubordinateData($SempNum);
        if ($this->Sup[0] !== null) {
            $this->ESupData = $leaveDao->LoadEmpData($this->Sup[0]['supervisorId']);
        } else {
            $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("You don't have Superviser, Can't Apply Leave. ", $args, 'messages')));
            $this->redirect('Leave/Leave');
        }


        $this->Entitle = $knwdt;
        $this->ECov = $leaveDao->LoadEmpData($this->Entitle->getLeave_app_covemp_number());
        $Approved = $knwdt->getLeave_app_status();
        if ($request->isMethod('post')) {

            if (strlen($request->getParameter('txtEmpId'))) {
                $knwdt->setEmp_number(trim($request->getParameter('txtEmpId')));
            } else {
                $knwdt->setEmp_number(null);
            }
            if (strlen($request->getParameter('cmbbtype'))) {
                $knwdt->setLeave_type_id(trim($request->getParameter('cmbbtype')));
            } else {
                $knwdt->setLeave_type_id(null);
            }
            if (strlen($request->getParameter('txtLeaveStartDate'))) {
                $knwdt->setLeave_app_start_date(trim(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveStartDate'))));
            } else {
                $knwdt->setLeave_app_start_date(null);
            }
            if (strlen($request->getParameter('txtLeaveEndDate'))) {
                $knwdt->setLeave_app_end_date(trim(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveEndDate'))));
            } else {
                $knwdt->setLeave_app_end_date(null);
            }
            if (strlen($request->getParameter('txtAppEmpId'))) {
                $knwdt->setLeave_app_covemp_number(trim($request->getParameter('txtAppEmpId')));
            } else {
                $knwdt->setLeave_app_covemp_number(null);
            }
            if (strlen($request->getParameter('cmbLeaveReason'))) {
                $knwdt->setLeave_app_reason(trim($request->getParameter('cmbLeaveReason')));
            } else {
                $knwdt->setLeave_app_reason(null);
            }
            if (strlen($request->getParameter('txtComments'))) {
                $knwdt->setLeave_app_comment(trim($request->getParameter('txtComments')));
            } else {
                $knwdt->setLeave_app_comment(null);
            }
            if (strlen($request->getParameter('txtnofodays'))) {
                $knwdt->setLeave_app_workdays(trim($request->getParameter('txtnofodays')));
            } else {
                $knwdt->setLeave_app_workdays(null);
            }

            $knwdt->setLeave_app_applied_date(date("Y-m-d"));
            $knwdt->setLeave_app_status('0');

            $userEntdays = $request->getParameter('txtnofodays');
            $year = date_parse(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveStartDate')));
            if ($year == null) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Year Format has Change ", $args, 'messages')));
                $this->redirect('Leave/Leave');
            }
            try {

                $conn = Doctrine_Manager::getInstance()->connection();
                $conn->beginTransaction();
                $leavetypeconfig = $leaveDao->readLeaveTypeConfig($request->getParameter('cmbbtype'));
                if ($leavetypeconfig != null) {
                    $Entitleday = $leavetypeconfig->getLeave_type_entitle_days();
                }

                $readconfig = $leaveDao->readLeaveEntitlement($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), $year['year']);

                if ($readconfig[0] == null) {
                    $newEntReamin = $Entitleday - $userEntdays;

                    $leaveent = new LeaveEntitlement();
                    $leaveent->setEmp_number(trim($request->getParameter('txtEmpId')));
                    $leaveent->setLeave_type_id(trim($request->getParameter('cmbbtype')));
                    $leaveent->setLeave_ent_year($year['year']);
                    $leaveent->setLeave_ent_day($Entitleday);
                    $leaveent->setLeave_ent_sheduled($userEntdays);
                    $leaveent->setLeave_ent_remain($newEntReamin);
                    $leaveDao->saveEntitlement($leaveent);
                } else {

                    if ($Approved == "2") {
                        $Entitletaken = $readconfig[0]['leave_ent_taken'] - $userEntdays;
                        $Entitleremain = $readconfig[0]['leave_ent_remain'] + $userEntdays;
                        $leaveDao->UpdateEntitlementLeaveNoShedule($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), $year['year'], $Entitletaken, $Entitleremain);
                    } else {
                        $Entitleshedule = $readconfig[0]['leave_ent_sheduled'] - $userEntdays;
                        $Entitleremain = $readconfig[0]['leave_ent_remain'] + $userEntdays;
                        $leaveDao->UpdateEntitlementLeaveNoTaken($request->getParameter('txtEmpId'), $request->getParameter('cmbbtype'), $year['year'], $Entitleshedule, $Entitleremain);
                    }
                }

                $leaveDao->saveLeave($knwdt);
                $conn->commit();
            } catch (Doctrine_Connection_Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/UpdateLeave?id=' . $knwdt->getLeave_app_id() . '&lock=0');
            } catch (Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/UpdateLeave?id=' . $knwdt->getLeave_app_id() . '&lock=0');
            }
            $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Updated", $args, 'messages')));
            $this->redirect('Leave/UpdateLeave?id=' . $knwdt->getLeave_app_id() . '&lock=0');
        }
    }

    public function executeDeleteLeave(sfWebRequest $request) {

        if (count($request->getParameter('chkLocID')) > 0) {

            $LeaveDao = new LeaveDao();
            try {
                $conn = Doctrine_Manager::getInstance()->connection();
                $conn->beginTransaction();
                $ids = array();
                $ids = $request->getParameter('chkLocID');

                $countArr = array();
                $saveArr = array();
                for ($i = 0; $i < count($ids); $i++) {
                    $conHandler = new ConcurrencyHandler();
                    $isRecordLocked = $conHandler->isTableLocked('txtEnTakenDays', array($ids[$i]), 1);
                    if ($isRecordLocked) {

                        $countArr = $ids[$i];
                    } else {
                        $saveArr = $ids[$i];
                        $LeaveDao->deleteEntitlement($ids[$i]);
                        $conHandler->resetTableLock('txtEnTakenDays', array($ids[$i]), 1);
                    }
                }

                $conn->commit();
            } catch (Doctrine_Connection_Exception $e) {

                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Entitlement');
            } catch (Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Entitlement');
            }
            if (count($saveArr) > 0 && count($countArr) == 0) {
                $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Deleted", $args, 'messages')));
            } elseif (count($saveArr) > 0 && count($countArr) > 0) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Some records are can not be deleted as them  Locked by another user ", $args, 'messages')));
            } elseif (count($saveArr) == 0 && count($countArr) > 0) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Can not delete as them  Locked by another user ", $args, 'messages')));
            }
        } else {
            $this->setMessage('NOTICE', array('Select at least one record to delete'));
        }
        $this->redirect('Leave/Entitlement');
    }

    public function executeLeaveSearch(sfWebRequest $request) {
        $this->Culture = $this->getUser()->getCulture();
        $this->sorter = new ListSorter('Leave', 'LeaveSearch', $this->getUser(), array('a.leave_app_id', ListSorter::ASCENDING));
        $this->sorter->setSort(array($request->getParameter('sort'), $request->getParameter('order')));

        $leaveDao = new LeaveDao();

        $this->sort = ($request->getParameter('sort') == '') ? 'a.leave_app_id' : $request->getParameter('sort');
        $this->order = ($request->getParameter('order') == '') ? 'ASC' : $request->getParameter('order');

        $this->EmployeeName = ($request->getParameter('txtEmployeeName') == null) ? $request->getParameter('txtEmployeeName') : $_POST['txtEmployeeName'];
        $this->searchMode = ($request->getParameter('txttdate') == null) ? $request->getParameter('searchMode') : LocaleUtil::getInstance()->convertToStandardDateFormat($_POST['txttdate']);
        $this->searchValue = ($request->getParameter('txtfdate') == null) ? $request->getParameter('searchValue') : LocaleUtil::getInstance()->convertToStandardDateFormat($_POST['txtfdate']);
        $this->emp = ($request->getParameter('txtEmpId') == null) ? $request->getParameter('emp') : $_POST['txtEmpId'];
        $this->type = ($request->getParameter('abc') == null) ? $request->getParameter('type') : $_POST['abc'];
        $this->post = ($_POST == null) ? $request->getParameter('post') : $_POST;


        $res = $leaveDao->viewall($this->searchValue, $this->searchMode, $request->getParameter('page'), $this->emp, $this->type, $this->sort, $this->order, $this->post);
        $this->view = $res['data'];
        $this->pglay = $res['pglay'];
        $this->pglay->setTemplate('<a href="{%url}">{%page}</a>');
        $this->pglay->setSelectedTemplate('{%page}');
    }

    public function executeAjaxTableLock(sfWebRequest $request) {


        if (!strlen($request->getParameter('lock'))) {
            $this->lockMode = 0;
        } else {
            $this->lockMode = $request->getParameter('lock');
        }
        $leaveid = $request->getParameter('leaveid');

        if (isset($this->lockMode)) {
            if ($this->lockMode == 1) {

                $conHandler = new ConcurrencyHandler();

                $recordLocked = $conHandler->setTableLock('hs_hr_leave_application', array($leaveid), 1);

                if ($recordLocked) {
                    $this->lockMode = 1;
                    $leaveDao = new LeaveDao();
                    $leave = $leaveDao->getLeaveload($leaveid);
                    $this->status = $leave->getLeave_app_status();
                    $this->comment = $leave->getLeave_app_comment();
                } else {

                    $this->lockMode = 0;
                }
            } else if ($this->lockMode == 0) {

                $conHandler = new ConcurrencyHandler();
                $recordLocked = $conHandler->resetTableLock('hs_hr_leave_application', array($leaveid), 1);
                $this->lockMode = 0;
            }
            echo json_encode(array("status" => $this->status, "comment" => $this->comment, "lockMode" => $this->lockMode));
            die;
        }
    }

    public function executeSaveLeaveApprove(sfWebRequest $request) {
        $leaveDao = new LeaveDao();
        $leaveid = $request->getParameter('leaveid');
        $status = $request->getParameter('status');
        $comment = $request->getParameter('comment');
        try {
            $LeaveRecord = $leaveDao->getLeaveload($leaveid);
            $year = date_parse($LeaveRecord->getLeave_app_start_date());
            $empnumber = $LeaveRecord->getEmp_number();
            $Leavtype = $LeaveRecord->getLeave_type_id();

            $LeaveEntitlement = $leaveDao->readLeaveEntitlement($empnumber, $Leavtype, $year['year']);
            $taken = $LeaveEntitlement[0]['leave_ent_taken'];
            $remain = $LeaveEntitlement[0]['leave_ent_remain'];
            $shedule = $LeaveEntitlement[0]['leave_ent_sheduled'];
            //Core of Leave
            // 0-Cancel , 1-Pending,  2-Approved,  3-Reject
            $Prestatus = $LeaveRecord->getLeave_app_status();
            $Leavedays = $LeaveRecord->getLeave_app_workdays();
            $Newstatus = $status;

            $conn = Doctrine_Manager::getInstance()->connection();
            $conn->beginTransaction();

            if (($Prestatus == 0) && ($Newstatus == 1)) {
                $remain-=$Leavedays;
                $shedule+=$Leavedays;
                $leaveDao->UpdateEntitlementLeaveNoTaken($empnumber, $Leavtype, $year['year'], $shedule, $remain);
            } else if (($Prestatus == 0) && ($Newstatus == 2)) {
                $remain-=$Leavedays;
                $taken+=$Leavedays;
                $leaveDao->UpdateEntitlementLeaveNoShedule($empnumber, $Leavtype, $year['year'], $taken, $remain);
            } else if (($Prestatus == 1) && ($Newstatus == 0)) {
                $remain+=$Leavedays;
                $shedule-=$Leavedays;
                $leaveDao->UpdateEntitlementLeaveNoTaken($empnumber, $Leavtype, $year['year'], $shedule, $remain);
            } else if (($Prestatus == 1) && ($Newstatus == 2)) {
                $shedule-=$Leavedays;
                $taken+=$Leavedays;
                $leaveDao->UpdateEntitlementLeaveNoRemain($empnumber, $Leavtype, $year['year'], $taken, $shedule);
            } else if (($Prestatus == 1) && ($Newstatus == 3)) {
                $remain+=$Leavedays;
                $shedule-=$Leavedays;
                $leaveDao->UpdateEntitlementLeaveNoTaken($empnumber, $Leavtype, $year['year'], $shedule, $remain);
            } else if (($Prestatus == 2) && ($Newstatus == 0)) {
                $remain+=$Leavedays;
                $taken-=$Leavedays;
                $leaveDao->UpdateEntitlementLeaveNoShedule($empnumber, $Leavtype, $year['year'], $taken, $remain);
            } else if (($Prestatus == 2) && ($Newstatus == 1)) {
                $shedule+=$Leavedays;
                $taken-=$Leavedays;
                $leaveDao->UpdateEntitlementLeaveNoRemain($empnumber, $Leavtype, $year['year'], $taken, $shedule);
            } else if (($Prestatus == 2) && ($Newstatus == 3)) {
                $remain+=$Leavedays;
                $taken-=$Leavedays;
                $leaveDao->UpdateEntitlementLeaveNoShedule($empnumber, $Leavtype, $year['year'], $taken, $remain);
            } else if (($Prestatus == 3) && ($Newstatus == 1)) {
                $remain-=$Leavedays;
                $shedule+=$Leavedays;
                $leaveDao->UpdateEntitlementLeaveNoTaken($empnumber, $Leavtype, $year['year'], $shedule, $remain);
            } else if (($Prestatus == 3) && ($Newstatus == 2)) {
                $remain-=$Leavedays;
                $taken+=$Leavedays;
                $leaveDao->UpdateEntitlementLeaveNoShedule($empnumber, $Leavtype, $year['year'], $taken, $remain);
            }
            //end Core
            $LeaveRecord->setLeave_app_status($status);
            $LeaveRecord->setLeave_app_comment($comment);
            $leaveDao->saveLeave($LeaveRecord);

            $conn->commit();
            $this->isupdated = "true";
        } catch (Exception $e) {
            $conn->rollBack();
            $errMsg = new CommonException($e->getMessage(), $e->getCode());
            $this->setMessage('WARNING', $errMsg->display());
            $this->isupdated = "false";
            $this->redirect('Leave/LeaveSearch');
        }
        echo json_encode(array("isupdated" => $this->isupdated));
        die;
    }

    public function executeHolyday(sfWebRequest $request) {

        try {
            $this->Culture = $this->getUser()->getCulture();
            $this->isAdmin = $_SESSION['isAdmin'];
            $leaveDao = new LeaveDao();

            $this->sorter = new ListSorter('Holyday', 'Leave', $this->getUser(), array('b.leave_holiday_id', ListSorter::ASCENDING));
            $this->sorter->setSort(array($request->getParameter('sort'), $request->getParameter('order')));

            if ($request->getParameter('mode') == 'search') {
                if (($request->getParameter('searchMode') == 'all') && (trim($request->getParameter('searchValue')) != '')) {
                    $this->setMessage('NOTICE', array('Select the field to search'));
                    $this->redirect('Leave/Holyday');
                }
                $this->var = 1;
            }

            $this->searchMode = ($request->getParameter('searchMode') == null) ? 'all' : $request->getParameter('searchMode');
            $this->searchValue = ($request->getParameter('searchValue') == null) ? '' : $request->getParameter('searchValue');

            $this->sort = ($request->getParameter('sort') == '') ? 'leave_holiday_date' : $request->getParameter('sort');
            $this->order = ($request->getParameter('order') == '') ? 'ASC' : $request->getParameter('order');
            $res = $leaveDao->searchHolyDay($this->searchMode, $this->searchValue, $this->Culture, $this->sort, $this->order, $request->getParameter('page'));
            $this->knwdoctype = $res['data'];
            $this->pglay = $res['pglay'];
            $this->pglay->setTemplate('<a href="{%url}">{%page}</a>');
            $this->pglay->setSelectedTemplate('{%page}');
        } catch (Exception $e) {
            $errMsg = new CommonException($e->getMessage(), $e->getCode());
            $this->setMessage('WARNING', $errMsg->display());
            $this->redirect('default/error');
        }
    }

    public function executeSaveHolyday(sfWebRequest $request) {//die(print_r($_POST));
        $this->myCulture = $this->getUser()->getCulture();
        $leaveDao = new LeaveDao();
        $knwdt = new LeaveHoliday();
        if ($request->isMethod('post')) {

            if (strlen($request->getParameter('txtName'))) {
                $knwdt->setLeave_holiday_name(trim($request->getParameter('txtName')));
            } else {
                $knwdt->setLeave_holiday_name(null);
            }
            if (strlen($request->getParameter('txtNamesi'))) {
                $knwdt->setLeave_holiday_name_si(trim($request->getParameter('txtNamesi')));
            } else {
                $knwdt->setLeave_holiday_name_si(null);
            }
            if (strlen($request->getParameter('txtNameta'))) {
                $knwdt->setLeave_holiday_name_ta(trim($request->getParameter('txtNameta')));
            } else {
                $knwdt->setLeave_holiday_name_ta(null);
            }
            if (strlen($request->getParameter('txtLeaveStartDate'))) {
                $knwdt->setLeave_holiday_date(trim(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveStartDate'))));
            } else {
                $knwdt->setLeave_holiday_date(null);
            }
            if (strlen($request->getParameter('cmbHalfDay'))) {
                $knwdt->setLeave_holiday_fulorhalf(trim($request->getParameter('cmbHalfDay')));
            } else {
                $knwdt->setLeave_holiday_fulorhalf(null);
            }
            if (strlen($request->getParameter('cmbannual'))) {
                $knwdt->setLeave_holiday_annual(trim($request->getParameter('cmbannual')));
            } else {
                $knwdt->setLeave_holiday_annual(null);
            }


            try {
                $leaveDao->saveHolyday($knwdt);
            } catch (Doctrine_Connection_Exception $e) {

                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Holyday');
            } catch (Exception $e) {
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Holyday');
            }

            $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Added", $args, 'messages')));
            $this->redirect('Leave/Holyday');
        }
    }

    public function executeUpdateHolyday(sfWebRequest $request) {///die(var_dump($request));
        //Table Lock code is Open
        if (!strlen($request->getParameter('lock'))) {
            $this->lockMode = 0;
        } else {
            $this->lockMode = $request->getParameter('lock');
        }
        $transPid = $request->getParameter('id');

        if (isset($this->lockMode)) {
            if ($this->lockMode == 1) {

                $conHandler = new ConcurrencyHandler();

                $recordLocked = $conHandler->setTableLock('hs_hr_leave_holiday', array($transPid), 1);

                if ($recordLocked) {
                    // Display page in edit mode
                    $this->lockMode = 1;
                } else {

                    $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Can not update. Record locked by another user.', $args, 'messages')), false);
                    $this->lockMode = 0;
                }
            } else if ($this->lockMode == 0) {
                $conHandler = new ConcurrencyHandler();
                $recordLocked = $conHandler->resetTableLock('hs_hr_leave_holiday', array($transPid), 1);
                $this->lockMode = 0;
            }
        }

        //Table lock code is closed
        $this->myCulture = $this->getUser()->getCulture();
        $LeaveDao = new LeaveDao();

        $knwdt = $LeaveDao->readHolyday($request->getParameter('id'));
        if (!$knwdt) {
            $this->setMessage('WARNING', array($this->getContext()->getI18N()->__('Can not update. Record has been Deleted', $args, 'messages')));
            $this->redirect('Leave/Holyday');
        }

        $this->benifittypelist = $knwdt;
        if ($request->isMethod('post')) {

            if (strlen($request->getParameter('txtName'))) {
                $knwdt->setLeave_holiday_name(trim($request->getParameter('txtName')));
            } else {
                $knwdt->setLeave_holiday_name(null);
            }
            if (strlen($request->getParameter('txtNamesi'))) {
                $knwdt->setLeave_holiday_name_si(trim($request->getParameter('txtNamesi')));
            } else {
                $knwdt->setLeave_holiday_name_si(null);
            }
            if (strlen($request->getParameter('txtNameta'))) {
                $knwdt->setLeave_holiday_name_ta(trim($request->getParameter('txtNameta')));
            } else {
                $knwdt->setLeave_holiday_name_ta(null);
            }
            if (strlen($request->getParameter('txtLeaveStartDate'))) {
                $knwdt->setLeave_holiday_date(trim(LocaleUtil::getInstance()->convertToStandardDateFormat($request->getParameter('txtLeaveStartDate'))));
            } else {
                $knwdt->setLeave_holiday_date(null);
            }
            if (strlen($request->getParameter('cmbHalfDay'))) {
                $knwdt->setLeave_holiday_fulorhalf(trim($request->getParameter('cmbHalfDay')));
            } else {
                $knwdt->setLeave_holiday_fulorhalf(null);
            }
            if (strlen($request->getParameter('cmbannual'))) {
                $knwdt->setLeave_holiday_annual(trim($request->getParameter('cmbannual')));
            } else {
                $knwdt->setLeave_holiday_annual(null);
            }
            try {
                $LeaveDao->saveHolyday($knwdt);
            } catch (Doctrine_Connection_Exception $e) {
                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/UpdateHolyday?id=' . $knwdt->getLeave_holiday_id() . '&lock=0');
            } catch (Exception $e) {
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/UpdateHolyday?id=' . $knwdt->getLeave_holiday_id() . '&lock=0');
            }
            $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Updated", $args, 'messages')));
            $this->redirect('Leave/UpdateHolyday?id=' . $knwdt->getLeave_holiday_id() . '&lock=0');
        }
    }

    public function executeDeleteHolyday(sfWebRequest $request) {
        if (count($request->getParameter('chkLocID')) > 0) {

            $LeaveDao = new LeaveDao();
            try {
                $conn = Doctrine_Manager::getInstance()->connection();
                $conn->beginTransaction();
                $ids = array();
                $ids = $request->getParameter('chkLocID');

                $countArr = array();
                $saveArr = array();
                for ($i = 0; $i < count($ids); $i++) {
                    $conHandler = new ConcurrencyHandler();
                    $isRecordLocked = $conHandler->isTableLocked('hs_hr_leave_holiday', array($ids[$i]), 1);
                    if ($isRecordLocked) {

                        $countArr = $ids[$i];
                    } else {
                        $saveArr = $ids[$i];
                        $LeaveDao->deleteHolyDay($ids[$i]);
                        $conHandler->resetTableLock('hs_hr_leave_holiday', array($ids[$i]), 1);
                    }
                }

                $conn->commit();
            } catch (Doctrine_Connection_Exception $e) {

                $errMsg = new CommonException($e->getPortableMessage(), $e->getPortableCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Holyday');
            } catch (Exception $e) {
                $conn->rollBack();
                $errMsg = new CommonException($e->getMessage(), $e->getCode());
                $this->setMessage('WARNING', $errMsg->display());
                $this->redirect('Leave/Holyday');
            }
            if (count($saveArr) > 0 && count($countArr) == 0) {
                $this->setMessage('SUCCESS', array($this->getContext()->getI18N()->__("Successfully Deleted", $args, 'messages')));
            } elseif (count($saveArr) > 0 && count($countArr) > 0) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Some records are can not be deleted as them  Locked by another user ", $args, 'messages')));
            } elseif (count($saveArr) == 0 && count($countArr) > 0) {
                $this->setMessage('WARNING', array($this->getContext()->getI18N()->__("Can not delete as them  Locked by another user ", $args, 'messages')));
            }
        } else {
            $this->setMessage('NOTICE', array('Select at least one record to delete'));
        }
        $this->redirect('Leave/Holyday');
    }

    public function executeError(sfWebRequest $request) {

        $this->redirect('default/error');
    }

    public function setMessage($messageType, $message = array(), $persist=true) {
        $this->getUser()->setFlash('messageType', $messageType, $persist);
        $this->getUser()->setFlash('message', $message, $persist);
    }

}
