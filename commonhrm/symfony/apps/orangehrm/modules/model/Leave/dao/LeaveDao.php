<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class LeaveDao extends BaseDao {

    public function searchDocumentType($searchMode, $searchValue, $culture="en", $orderField = 'b.leave_type_id', $orderBy = 'ASC', $page = 1) {

        if ($searchMode == "leave_type_name_") {
            if ($culture == "en")
                $feildName = "b.leave_type_name";
            else
                $feildName="b.leave_type_name_" . $culture;
        }
        if ($orderField == "b.leave_type_name") {
            if ($culture == "en")
                $orderField = "b.leave_type_name";
            else
                $orderField="b.leave_type_name_" . $culture;
        }
        $q = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveType b');

        if ($searchValue != "") {
            $q->where($feildName . ' LIKE ?', '%' . trim($searchValue) . '%');
        }
        $q->orderBy($orderField . ' ' . $orderBy);


        //return $q->execute();
        $sysConf = new sysConf();
        $resultsPerPage = $sysConf->getRowLimit() ? $sysConf->getRowLimit() : 10;

        // Pager object
        $pagerLayout = new CommonhrmPager(
                        new Doctrine_Pager(
                                $q,
                                $page,
                                $resultsPerPage
                        ),
                        new Doctrine_Pager_Range_Sliding(array(
                            'chunk' => 5
                        )),
                        //  'wbm/?page={%page_number}'
                        "?page={%page_number}&amp;mode=search&amp;searchValue={$searchValue}&amp;searchMode={$searchMode}&amp;sort={$orderField}&amp;order={$orderBy}"
        );

        $pager = $pagerLayout->getPager();
        $res = array();
        $res['data'] = $pager->execute();
        $res['pglay'] = $pagerLayout;

        return $res;
    }

    public function readDocumentType($id) {

        return Doctrine::getTable('LeaveType')->find($id);
    }

    public function readLeaveEntitlement($eid, $lt, $yr) {

        $q = Doctrine_Query::create()
                        ->select('l.*')
                        ->from('LeaveEntitlement l')
                        ->where('l.emp_number = ?', $eid)
                        ->andwhere('l.leave_type_id = ?', $lt)
                        ->andwhere('l.leave_ent_year = ?', $yr);
        return $q->fetchArray();
    }

    public function readLeaveEntitlementDisplay($eid, $yr) {
        $q = Doctrine_Query::create()
                        ->select('l.*')
                        ->from('LeaveEntitlement l')
                        ->where('l.emp_number = ?', $eid)
                        ->andwhere('l.leave_ent_year = ?', $yr);
        return $q->fetchArray();
    }

    public function readLeaveTypeConfig($transPeid) {
        return Doctrine::getTable('LeaveTypeConfig')->find(array($transPeid));
    }

    public function readLeaveHolyDay() {
        $q = Doctrine_Query::create()
                        ->select('l.*')
                        ->from('LeaveHoliday l');
        return $q->fetchArray();
    }

    public function readLeaveLeaveRange($SDate, $EDate, $emp) {
        $q = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveApplication b')
                        ->where('b.emp_number = ?', $emp)
                        ->andWhere('b.leave_app_start_date >= ?', $SDate)
                        ->andWhere('b.leave_app_start_date <= ?', $EDate)
                        ->andWhere('b.leave_app_status NOT IN (0,3)');

        $r = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveApplication b')
                        ->where('b.emp_number = ?', $emp)
                        ->andWhere('b.leave_app_end_date >= ?', $SDate)
                        ->andWhere('b.leave_app_end_date <= ?', $EDate)
                        ->andWhere('b.leave_app_status NOT IN (0,3)');

        $s = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveApplication b')
                        ->where('b.emp_number = ?', $emp)
                        ->andWhere('b.leave_app_start_date >= ?', $SDate)
                        ->andWhere('b.leave_app_end_date <= ?', $EDate)
                        ->andWhere('b.leave_app_status NOT IN (0,3)');
        $t = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveApplication b')
                        ->where('b.emp_number = ?', $emp)
                        ->andWhere('b.leave_app_start_date <= ?', $SDate)
                        ->andWhere('b.leave_app_end_date >= ?', $EDate)
                        ->andWhere('b.leave_app_status NOT IN (0,3)');

        $sqlone = $q->fetchArray();
        $sqltwo = $r->fetchArray();
        $sqlthree = $s->fetchArray();
        $sqlfour = $t->fetchArray();
        if (($sqlone != null or $sqltwo != null) or ($sqlthree != null or $sqlfour != null )) {
            return "invalid";
        } else {
            return "valid";
        }
    }

    public function getEmployee($insList = array()) {

        try {
            if (is_array($insList)) {
                $q = Doctrine_Query::create()
                                ->select('e.*')
                                ->from('Employee e')
                                ->whereIn('e.emp_number', $insList);

                return $q->fetchArray();
            }
        } catch (Exception $e) {
            throw new DaoException($e->getMessage());
        }
    }

    public function readLeaveLeaveHD($SDate, $emp) {
        $q = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveApplication b')
                        ->where('b.emp_number = ?', $emp)
                        ->andWhere('b.leave_app_start_date <= ?', $SDate)
                        ->andWhere('b.leave_app_end_date >= ?', $SDate);
        if ($q->fetchArray() != null) {
            return "invalid";
        } else {
            return "valid";
        }
    }

    public function getLeaveload($transPeid) {
        return Doctrine::getTable('LeaveApplication')->find(array($transPeid));
    }

    public function getemployeePendingLeave($emp) {

        $q = Doctrine_Query::create()
                        ->select('count(l.leave_type_id) ')
                        ->from('LeaveApplication l')
                        ->where('l.emp_number = ?', $emp)
                        ->andwhere('l.leave_app_status = ?', 1);
        return $q->fetchArray();
    }

    public function IsLeaveTypedetail($tid, $eid) {
        $q = Doctrine_Query::create()
                        ->select('count(l.leave_type_id) as Status')
                        ->from('LeaveTypeConfigDetail l')
                        ->where('l.leave_type_id = ?', $tid)
                        ->andwhere('l.estat_code = ?', $eid);

        return $q->fetchArray();
    }

    public function readLeaveTypeConfigdetails($id) {
        $q = Doctrine_Query::create()
                        ->select('*')
                        ->from('LeaveTypeConfigDetail')
                        ->where('leave_type_id = ?', $id)
                        ->orderBy('estat_code ASC');
        return $q->fetchArray();
    }

    public function validLeaveTypeConfigdetailsforemployee($id) {
        $q = Doctrine_Query::create()
                        ->select('*')
                        ->from('LeaveTypeConfigDetail')
                        ->where('leave_type_id = ?', $id)
                        ->orderBy('estat_code ASC');
        return $q->fetchArray();
    }

    public function IsLeaveType($id) {
        $q = Doctrine_Query::create()
                        ->select('count(l.leave_type_id) as Status')
                        ->from('LeaveTypeConfig l')
                        ->where('l.leave_type_id = ?', $id);

        return $q->fetchArray();
    }

    public function LoadLeaveEntitledate($id) {
        $q = Doctrine_Query::create()
                        ->select('l.leave_type_entitle_days')
                        ->from('LeaveTypeConfig l')
                        ->where('l.leave_type_id = ?', $id);

        return $q->fetchArray();
    }

    public function LoadEmpData($id) {
        $q = Doctrine_Query::create()
                        ->select('e.*')
                        ->from('Employee e')
                        ->where('e.emp_number = ?', $id);

        return $q->execute();
    }

    public function LoadsubordinateData($id) {
        $q = Doctrine_Query::create()
                        ->select('r.*')
                        ->from('ReportTo r')
                        ->where('r.subordinateId = ?', $id);

        return $q->fetchArray();
    }

    public function saveDocumentType(LeaveType $rte) {
        $rte->save();
        return true;
    }

    public function saveEntitlement(LeaveEntitlement $rte) {
        $rte->save();
        return true;
    }

    public function saveLeave(LeaveApplication $rte) {
        $rte->save();
        return true;
    }

    public function saveLeavedeatil(LeaveDetail $rte) {
        $rte->save();
        return true;
    }

    public function findlastleave($txtEmpId, $cmbbtype, $start_date, $end_date, $workdays) {
        $q = Doctrine_Query::create()
                        ->select('Max(r.leave_app_id)')
                        ->from('LeaveApplication r')
                        ->where('emp_number = ?', $txtEmpId)
                        ->andwhere('leave_type_id = ?', $cmbbtype)
                        ->andWhere('leave_app_start_date = ?', $start_date)
                        ->andWhere('leave_app_end_date = ?', $end_date)
                        ->andWhere('leave_app_workdays = ?', $workdays);
        return $q->fetchArray();
    }

    public function UpdateEntitlement($txtEmpId, $cmbbtype, $txtYear, $txtEntitleDays, $txtSheduleDays, $txtEnTakenDays, $leave_ent_remain) {
        $q = Doctrine_Query::create()
                        ->update('LeaveEntitlement r')
                        ->set('r.leave_ent_day', '?', $txtEntitleDays)
                        ->set('r.leave_ent_taken', '?', $txtEnTakenDays)
                        ->set('r.leave_ent_sheduled', '?', $txtSheduleDays)
                        ->set('r.leave_ent_remain', '?', $leave_ent_remain)
                        ->where('emp_number = ?', $txtEmpId)
                        ->andwhere('leave_type_id = ?', $cmbbtype)
                        ->andWhere('leave_ent_year = ?', $txtYear);
        $q->execute();
        return true;
    }

    public function UpdateEntitlementLeave($txtEmpId, $cmbbtype, $txtYear, $txtSheduleDays, $leave_ent_remain, $Taken, $Approved) {
        $q = Doctrine_Query::create()
                        ->update('LeaveEntitlement r')
                        ->set('r.leave_ent_sheduled', '?', $txtSheduleDays)
                        ->set('r.leave_ent_remain', '?', $leave_ent_remain);
        if ($Approved == "2") {
            $q->set('r.leave_ent_taken', '?', $Taken);
        }
        $q->where('emp_number = ?', $txtEmpId)
                ->andwhere('leave_type_id = ?', $cmbbtype)
                ->andWhere('leave_ent_year = ?', $txtYear);
        $q->execute();
        return true;
    }

    public function UpdateEntitlementLeaveNoShedule($txtEmpId, $cmbbtype, $txtYear, $txtEnTakenDays, $leave_ent_remain) {
        $q = Doctrine_Query::create()
                        ->update('LeaveEntitlement r')
                        ->set('r.leave_ent_taken', '?', $txtEnTakenDays)
                        ->set('r.leave_ent_remain', '?', $leave_ent_remain)
                        ->where('emp_number = ?', $txtEmpId)
                        ->andwhere('leave_type_id = ?', $cmbbtype)
                        ->andWhere('leave_ent_year = ?', $txtYear);
        $q->execute();
        return true;
    }

    public function UpdateEntitlementLeaveNoRemain($txtEmpId, $cmbbtype, $txtYear, $txtEnTakenDays, $txtSheduleDays) {
        $q = Doctrine_Query::create()
                        ->update('LeaveEntitlement r')
                        ->set('r.leave_ent_taken', '?', $txtEnTakenDays)
                        ->set('r.leave_ent_sheduled', '?', $txtSheduleDays)
                        ->where('emp_number = ?', $txtEmpId)
                        ->andwhere('leave_type_id = ?', $cmbbtype)
                        ->andWhere('leave_ent_year = ?', $txtYear);
        $q->execute();
        return true;
    }

    public function UpdateEntitlementLeaveNoTaken($txtEmpId, $cmbbtype, $txtYear, $txtSheduleDays, $leave_ent_remain) {
        $q = Doctrine_Query::create()
                        ->update('LeaveEntitlement r')
                        ->set('r.leave_ent_sheduled', '?', $txtSheduleDays)
                        ->set('r.leave_ent_remain', '?', $leave_ent_remain)
                        ->where('emp_number = ?', $txtEmpId)
                        ->andwhere('leave_type_id = ?', $cmbbtype)
                        ->andWhere('leave_ent_year = ?', $txtYear);
        $q->execute();
        return true;
    }

    public function saveLeaveTypeConfig(LeaveTypeConfig $rte) {
        $rte->save();
        return true;
    }

    public function saveLeaveTypeConfigDetails(LeaveTypeConfigDetail $rte) {
        $rte->save();
        return true;
    }

    public function getLeaveTypeloadall() {
        $q = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveType b')
                        ->leftJoin('b.LeaveTypeConfig d ON b.leave_type_id = d.leave_type_id');
        return($q->execute());
    }

    public function getLeaveTypeload() {
        $q = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveType b')
                        ->leftJoin('b.LeaveTypeConfig d ON b.leave_type_id = d.leave_type_id')
                        ->where('d.leave_type_active_flg = 1');
        return($q->execute());
    }

    public function getEmployeeTypeload() {
        $q = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('EmployeeStatus b');

        return $q->fetchArray();
    }

    public function reademplyeename($eid, $Culture) {
        if ($Culture == 'en') {
            $abcd = "emp_display_name";
        } else {
            $abcd = "emp_display_name_" . $Culture;
        }
        $q = Doctrine_Query::create()
                        ->select('e.' . $abcd)
                        ->from('Employee e')
                        ->where('e.emp_number = ?', $eid);
        return $q->fetchArray();
    }

    public function deleteDocumentType($id) {

        $q = Doctrine_Query::create()
                        ->delete('LeaveType')
                        ->where('leave_type_id =' . $id);

        $numDeleted = $q->execute();
        if ($numDeleted > 0) {
            return true;
        }
        return false;
    }

    public function deleteLeave($id) {

        $q = Doctrine_Query::create()
                        ->delete('LeaveApplication')
                        ->where('leave_app_id =' . $id);

        $numDeleted = $q->execute();
        if ($numDeleted > 0) {
            return true;
        }
        return false;
    }

    public function deleteEntitlement($id) {
        $pieces = explode("|", $id);
        $pieces[0];
        $pieces[1];
        $pieces[2];
        $q = Doctrine_Query::create()
                        ->delete('LeaveEntitlement')
                        ->where('emp_number =' . $pieces[0])
                        ->andwhere('leave_type_id =' . $pieces[1])
                        ->andwhere('leave_ent_year =' . $pieces[2]);

        $numDeleted = $q->execute();
        if ($numDeleted > 0) {
            return true;
        }
        return false;
    }

    public function deletereclevtypeconfigdetail($ltid) {
        $q = Doctrine_Query::create()
                        ->delete('LeaveTypeConfigDetail')
                        ->where('leave_type_id = ?', $ltid);
        $numDeleted = $q->execute();
        if ($numDeleted > 0) {
            return true;
        }
        return false;
    }

    public function getCompnayStructure($id) {
        try {
            return Doctrine::getTable('CompanyStructure')->find($id);
        } catch (Exception $e) {
            throw new DaoException($e->getMessage());
        }
    }

    public function searchEntitlement($searchMode, $searchValue, $culture="en", $orderField = 'b.emp_number', $orderBy = 'ASC', $page = 1) {
        switch ($searchMode) {
            case "employee_id":
                $feildName = "e.employee_id";
                break;

            case "emp_name":
                if ($culture == "en")
                    $feildName = "e.emp_display_name";
                else
                    $feildName="e.emp_display_name_" . $culture;
                break;
            case "leave_type_name_":
                if ($culture == "en")
                    $feildName = "c.leave_type_name";
                else
                    $feildName="c.leave_type_name_" . $culture;
                break;
            case "empid":
                $feildName = "b.emp_number";
                break;
        }

        $q = Doctrine_Query::create()
                        ->select('DISTINCT b.*')
                        ->from('LeaveEntitlement b')
                        ->leftJoin('b.Employee e ON b.emp_number = e.emp_number')
                        ->leftJoin('b.LeaveType c ON b.leave_type_id = c.leave_type_id')
                        ->leftJoin('c.LeaveTypeConfig d ON c.leave_type_id = d.leave_type_id');

        if ($searchValue != "") {
            if ($feildName == "e.emp_number") {
                $q->where('e.emp_number = ?', $searchValue);
            } else {

                $q->where($feildName . ' LIKE ?', '%' . trim($searchValue) . '%');
            }
        }

        $q->orderBy($orderField . ' ' . $orderBy);
        $sysConf = new sysConf();
        $resultsPerPage = $sysConf->getRowLimit() ? $sysConf->getRowLimit() : 10;

        // Pager object
        $pagerLayout = new CommonhrmPager(
                        new Doctrine_Pager(
                                $q,
                                $page,
                                $resultsPerPage
                        ),
                        new Doctrine_Pager_Range_Sliding(array(
                            'chunk' => 5
                        )),
                        "?page={%page_number}&mode=search&searchValue={$searchValue}&searchMode={$searchMode}&sort={$orderField}&order={$orderBy}"
        );

        $pager = $pagerLayout->getPager();
        $res = array();
        $res['data'] = $pager->execute();
        $res['pglay'] = $pagerLayout;

        return $res;
    }

    public function searchLeave($searchMode, $searchValue, $culture="en", $orderField = 'b.leave_app_id', $orderBy = 'ASC', $page = 1, $empid) {

        switch ($searchMode) {
            case "emp_name":
                if ($culture == "en")
                    $feildName = "e.emp_display_name";
                else
                    $feildName="e.emp_display_name_" . $culture;
                break;
            case "leave_type_name_":
                if ($culture == "en")
                    $feildName = "c.leave_type_name";
                else
                    $feildName="c.leave_type_name_" . $culture;
        }

        $q = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveApplication b')
                        ->leftJoin('b.Employee e ON b.emp_number = e.emp_number')
                        ->leftJoin('b.LeaveType c ON b.leave_type_id = c.leave_type_id')
                        ->where('b.emp_number = ?', $empid);

        if ($searchValue != "") {
            $q->Andwhere($feildName . ' LIKE ?', '%' . trim($searchValue) . '%');
        }
        $q->orderBy($orderField . ' ' . $orderBy);

        $resultsPerPage = sfConfig::get('app_items_per_page') ? sfConfig::get('app_items_per_page') : 10;

        // Pager object
        $pagerLayout = new CommonhrmPager(
                        new Doctrine_Pager(
                                $q,
                                $page,
                                $resultsPerPage
                        ),
                        new Doctrine_Pager_Range_Sliding(array(
                            'chunk' => 5
                        )),
                        "?page={%page_number}&mode=search&searchValue={$searchValue}&searchMode={$searchMode}&sort={$orderField}&order={$orderBy}&empid={$empid}"
        );

        $pager = $pagerLayout->getPager();
        $res = array();
        $res['data'] = $pager->execute();
        $res['pglay'] = $pagerLayout;

        return $res;
    }

    public function viewall($from, $to, $page=1, $eno=null, $type, $orderField = 'a.leave_app_id', $orderBy = 'ASC', $post) {

        try {
            if ($type == 0) {
                $q = Doctrine_Query::create()
                                ->select('*')
                                ->from('LeaveApplication a')
                                ->leftJoin('a.Employee e ON a.emp_number = e.emp_number')
                                ->leftJoin('a.LeaveType c ON a.leave_type_id = c.leave_type_id')
                                ->Where('a.leave_app_start_date >= ?', $from)
                                ->andWhere('a.leave_app_end_date <= ?', $to);

                switch ($post) {
                    case $post['chkAll'] == "All":
                        break;
                    case $post['chkCanceled'] == "Canceled":
                        $q->andWhere('a.leave_app_status = 0');
                        break;
                    case $post['chkPending'] == "Pending":
                        $q->andWhere('a.leave_app_status = 1');
                        break;
                    case $post['chkApproved'] == "Approved":
                        $q->andWhere('a.leave_app_status = 2');
                        break;
                    case $post['chkRejected'] == "Rejected":
                        $q->andWhere('a.leave_app_status = 3');
                        break;
                    case $post['chkTaken'] == "Taken":
                        $q->andWhere('a.leave_app_status = 2');
                        break;
                    default:
                        $q->andWhere('a.leave_app_status = 10');
                        break;
                }

                $q->orderBy($orderField . ' ' . $orderBy);
            } else {
                $q = Doctrine_Query::create()
                                ->select('*')
                                ->from('LeaveApplication a')
                                ->leftJoin('a.Employee e ON a.emp_number = e.emp_number')
                                ->leftJoin('a.LeaveType c ON a.leave_type_id = c.leave_type_id')
                                ->where('a.emp_number = ?', $eno)
                                ->andWhere('a.leave_app_start_date >= ?', $from)
                                ->andWhere('a.leave_app_end_date <= ?', $to);

                switch ($post) {
                    case $post['chkAll'] == "All":
                        break;
                    case $post['chkCanceled'] == "Canceled":
                        $q->andWhere('a.leave_app_status = 0');
                        break;
                    case $post['chkPending'] == "Pending":
                        $q->andWhere('a.leave_app_status = 1');
                        break;
                    case $post['chkApproved'] == "Approved":
                        $q->andWhere('a.leave_app_status = 2');
                        break;
                    case $post['chkRejected'] == "Rejected":
                        $q->andWhere('a.leave_app_status = 3');
                        break;
                    case $post['chkTaken'] == "Taken":
                        $q->andWhere('a.leave_app_status = 4');
                        break;
                    default:
                        $q->andWhere('a.leave_app_status = 10');
                        break;
                }
                $q->orderBy($orderField . ' ' . $orderBy);
            }
            $resultsPerPage = sfConfig::get('app_items_per_page2') ? sfConfig::get('app_items_per_page2') : 20;

            // Pager object
            $pagerLayout = new CommonhrmPager(
                            new Doctrine_Pager(
                                    $q,
                                    $page,
                                    $resultsPerPage
                            ),
                            new Doctrine_Pager_Range_Sliding(array(
                                'chunk' => 5
                            )),
                            "?page={%page_number}&searchValue={$from}&searchMode={$to}&emp={$eno}&type={$type}&sort={$orderField}&order={$orderBy}&post={$post}"
            );

            $pager = $pagerLayout->getPager();
            $res = array();
            $res['data'] = $pager->execute();
            $res['pglay'] = $pagerLayout;

            return $res;
        } catch (Exception $e) {
            throw new DaoException($e->getMessage());
        }
    }

    public function searchHolyDay($searchMode, $searchValue, $culture="en", $orderField = 'leave_holiday_date', $orderBy = 'ASC', $page = 1) {

        if ($searchMode == "leave_holiday_name_") {
            if ($culture == "en")
                $feildName = "b.leave_holiday_name";
            else
                $feildName="b.leave_holiday_name_" . $culture;
        }
        if ($searchMode == "leave_holiday") {
            $feildName = "b.leave_holiday_date";
        }
        $q = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveHoliday b');

        if ($searchValue != "") {
            $q->where($feildName . ' LIKE ?', '%' . trim($searchValue) . '%');
        }
        $q->orderBy($orderField . ' ' . $orderBy);


        $sysConf = new sysConf();
        $resultsPerPage = $sysConf->getRowLimit() ? $sysConf->getRowLimit() : 10;

        // Pager object
        $pagerLayout = new CommonhrmPager(
                        new Doctrine_Pager(
                                $q,
                                $page,
                                $resultsPerPage
                        ),
                        new Doctrine_Pager_Range_Sliding(array(
                            'chunk' => 5
                        )),
                        "?page={%page_number}&mode=search&searchValue={$searchValue}&searchMode={$searchMode}&sort={$orderField}&order={$orderBy}"
        );

        $pager = $pagerLayout->getPager();
        $res = array();
        $res['data'] = $pager->execute();
        $res['pglay'] = $pagerLayout;

        return $res;
    }

    public function saveHolyday(LeaveHoliday $rte) {
        $rte->save();
        return true;
    }

    public function readHolyday($id) {

        return Doctrine::getTable('LeaveHoliday')->find($id);
    }

    public function deleteHolyDay($id) {

        $q = Doctrine_Query::create()
                        ->delete('LeaveHoliday')
                        ->where('leave_holiday_id =' . $id);

        $numDeleted = $q->execute();
        if ($numDeleted > 0) {
            return true;
        }
        return false;
    }

    public function deleteLeaveconfig($id) {

        $q = Doctrine_Query::create()
                        ->delete('LeaveTypeConfig')
                        ->where('leave_type_id =' . $id);

        $numDeleted = $q->execute();
        if ($numDeleted > 0) {
            return true;
        }
        return false;
    }

        public function getLeaveTypeloadMeternity($id) {
        $q = Doctrine_Query::create()
                        ->select('b.*')
                        ->from('LeaveTypeConfig b')
                ->where('leave_type_id =' . $id);

        return $q->fetchArray();

        }
}

?>
