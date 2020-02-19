<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class BaseLoanDocument extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('hs_ln_document');
        $this->hasColumn('ln_doc_number', 'numeric', null, array(
             'type' => 'numeric',
             'primary' => true,
             ));
        $this->hasColumn('ln_app_number', 'decimal', 10, array(
             'type' => 'decimal',
             'notnull' => true,
             'length' => '10',
             ));
        $this->hasColumn('ln_ty_number', 'decimal', 10, array(
             'type' => 'decimal',
             'notnull' => true,
             'length' => '10',
             ));
        $this->hasColumn('ln_doc_source', 'blob', 2147483647, array(
             'type' => 'blob',
             'length' => '2147483647',
             ));
        $this->hasColumn('ln_doc_ext', 'string', 10, array(
             'type' => 'string',
             'length' => '10',
             ));
        $this->hasColumn('ln_chk_number', 'numeric', null, array(
             'type' => 'numeric',
             ));
        $this->hasColumn('ln_chk_cat_number', 'numeric', null, array(
             'type' => 'numeric',
             ));
        $this->hasColumn('dbgroup_user_id', 'varchar', 20, array(
             'type' => 'varchar',
             'length' => '20',
             ));
    }

    public function setUp()
    {
        $this->hasOne('LoanCheckList', array(
             'local' => 'ln_chk_number',
             'foreign' => 'ln_chk_number'));

        $this->hasOne('LoanCheckListCatagory', array(
             'local' => 'ln_chk_cat_number',
             'foreign' => 'ln_chk_cat_number'));

        $this->hasOne('LoanType', array(
             'local' => 'ln_ty_number',
             'foreign' => 'ln_ty_number'));

        $this->hasOne('LoanApplication', array(
             'local' => 'ln_app_number',
             'foreign' => 'ln_app_number'));
    }
}