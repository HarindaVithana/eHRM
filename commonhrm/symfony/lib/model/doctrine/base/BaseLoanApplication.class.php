<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class BaseLoanApplication extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('hs_ln_application');
        $this->hasColumn('ln_app_number', 'decimal', 10, array(
             'type' => 'decimal',
             'primary' => true,
             'length' => '10',
             ));
        $this->hasColumn('emp_number', 'integer', 7, array(
             'type' => 'integer',
             'notnull' => true,
             'length' => '7',
             ));
        $this->hasColumn('ln_ty_number', 'decimal', 10, array(
             'type' => 'decimal',
             'primary' => true,
             'length' => '10',
             ));
        $this->hasColumn('ln_app_date', 'date', null, array(
             'type' => 'date',
             ));
        $this->hasColumn('ln_app_amount', 'decimal', 18, array(
             'type' => 'decimal',
             'length' => '18',
             'scale' => '2',
             ));
        $this->hasColumn('ln_app_installment', 'decimal', 20, array(
             'type' => 'decimal',
             'length' => '20',
             ));
        $this->hasColumn('ln_app_no_of_Installments', 'integer', 2, array(
             'type' => 'integer',
             'length' => '2',
             ));
        $this->hasColumn('ln_app_elg_amount', 'decimal', 18, array(
             'type' => 'decimal',
             'length' => '18',
             'scale' => '2',
             ));
        $this->hasColumn('ln_app_install_amount', 'decimal', 13, array(
             'type' => 'decimal',
             'length' => '13',
             'scale' => '2',
             ));
        $this->hasColumn('dbgroup_user_id', 'string', 20, array(
             'type' => 'string',
             'length' => '20',
             ));
        $this->hasColumn('ln_app_effective_date', 'date', null, array(
             'type' => 'date',
             ));
        $this->hasColumn('ln_app_user_number', 'string', 100, array(
             'type' => 'string',
             'length' => '100',
             ));
    }

    public function setUp()
    {
        $this->hasOne('LoanType', array(
             'local' => 'ln_ty_number',
             'foreign' => 'ln_ty_number'));

        $this->hasOne('Employee', array(
             'local' => 'emp_number',
             'foreign' => 'emp_number'));

        $this->hasMany('LoanDocument', array(
             'local' => 'ln_app_number',
             'foreign' => 'ln_app_number'));

        $this->hasMany('LoanGuarantee', array(
             'local' => 'ln_app_number',
             'foreign' => 'ln_app_number'));

        $this->hasMany('LoanHeader', array(
             'local' => 'ln_app_number',
             'foreign' => 'ln_app_number'));

        $this->hasMany('LoanProcessed', array(
             'local' => 'ln_app_number',
             'foreign' => 'ln_app_number'));

        $this->hasMany('LoanSchedule', array(
             'local' => 'ln_app_number',
             'foreign' => 'ln_app_number'));
    }
}