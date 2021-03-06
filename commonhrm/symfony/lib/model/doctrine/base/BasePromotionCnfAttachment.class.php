<?php

/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
abstract class BasePromotionCnfAttachment extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('hs_hr_prm_cnf_attachment');
        $this->hasColumn('prm_cnf_attach_id', 'integer', 20, array(
             'type' => 'integer',
             'primary' => true,
             'length' => '20',
             ));
        $this->hasColumn('prm_id', 'integer', 20, array(
             'type' => 'integer',
             'primary' => true,
             'length' => '20',
             ));
        $this->hasColumn('prm_cnf_attach_filename', 'string', 200, array(
             'type' => 'string',
             'length' => '200',
             ));
        $this->hasColumn('prm_cnf_attach_size', 'integer', 11, array(
             'type' => 'integer',
             'length' => '11',
             ));
        $this->hasColumn('prm_cnf_attach_attachment', 'blob', 2147483647, array(
             'type' => 'blob',
             'length' => '2147483647',
             ));
        $this->hasColumn('prm_cnf_attach_type', 'string', 50, array(
             'type' => 'string',
             'length' => '50',
             ));
    }

    public function setUp()
    {
        $this->hasOne('Promotion', array(
             'local' => 'prm_id',
             'foreign' => 'prm_id'));
    }
}