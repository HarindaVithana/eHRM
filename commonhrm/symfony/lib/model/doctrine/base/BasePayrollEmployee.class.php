<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class BasePayrollEmployee extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('hs_pr_employee');
        $this->hasColumn('emp_number', 'integer', 4, array(
             'type' => 'integer',
             'primary' => true,
             'length' => '4',
             ));
        $this->hasColumn('emp_name_on_cheque', 'string', 500, array(
             'type' => 'string',
             'length' => '500',
             ));
        $this->hasColumn('sal_dtl_year', 'decimal', 10, array(
             'type' => 'decimal',
             'scale' => 0,
             'length' => '10',
             ));
        $this->hasColumn('sal_grd_code', 'string', 6, array(
             'type' => 'string',
             'length' => '6',
             ));
        $this->hasColumn('last_modified_date', 'timestamp', null, array(
             'type' => 'timestamp',
             ));
        $this->hasColumn('emp_update_status', 'decimal', 2, array(
             'type' => 'decimal',
             'scale' => 0,
             'length' => '2',
             ));
        $this->hasColumn('emp_pf_code', 'integer', 4, array(
             'type' => 'integer',
             'length' => '4',
             ));
        $this->hasColumn('vt_sal_code', 'integer', 11, array(
             'type' => 'integer',
             'length' => '11',
             ));
        $this->hasColumn('vt_epf_code', 'integer', 11, array(
             'type' => 'integer',
             'length' => '11',
             ));
        $this->hasColumn('vt_etf_code', 'integer', 11, array(
             'type' => 'integer',
             'length' => '11',
             ));
        $this->hasColumn('dbgroup_user_id', 'string', 20, array(
             'type' => 'string',
             'length' => '20',
             ));
        $this->hasColumn('applied_default_txn', 'decimal', 1, array(
             'type' => 'decimal',
             'scale' => 0,
             'length' => '1',
             ));
        $this->hasColumn('prl_type_code', 'integer', 4, array(
             'type' => 'integer',
             'length' => '4',
             ));
        $this->hasColumn('emp_epf_number', 'string', 25, array(
             'type' => 'string',
             'length' => '25',
             ));
        $this->hasColumn('emp_etf_number', 'string', 25, array(
             'type' => 'string',
             'length' => '25',
             ));
        $this->hasColumn('sal_cash_flag', 'string', 1, array(
             'type' => 'string',
             'length' => '1',
             ));
    }

    public function setUp()
    {
        $this->hasOne('PayrollType as prlTypeCode', array(
             'local' => 'prl_type_code',
             'foreign' => 'vt_inf_type_code'));

        $this->hasOne('PayrollVote as vtEtfCode', array(
             'local' => 'vt_etf_code',
             'foreign' => 'vt_typ_code'));

        $this->hasOne('PayrollVote as vtEpfCode', array(
             'local' => 'vt_epf_code',
             'foreign' => 'vt_typ_code'));

        $this->hasOne('PayrollVote as vtSalCode', array(
             'local' => 'vt_sal_code',
             'foreign' => 'vt_typ_code'));

        $this->hasOne('Employee', array(
             'local' => 'emp_number',
             'foreign' => 'emp_number'));

        $this->hasMany('EmployeeMaster', array(
             'local' => 'emp_number',
             'foreign' => 'emp_number'));
    }
}