<?php

/**
 * Description of NoticeDao
 *
 * @author Givantha
 */
require_once '../../lib/common/LocaleUtil.php';

class NoticeDao extends BaseDao {

    public function getNotice($searchMode, $searchValue, $userCulture="en",  $page = 1,$orderField = 'no.notice_code', $orderBy = 'ASC') {

              if ($searchMode == "notice_name") {
                if($userCulture=="en"){
                   $feildName = "no.notice_name";
                }else{
                    $feildName = "no.notice_name_" . $userCulture;
                }
              }
            $q = Doctrine_Query::create()
                            ->select('no.*')
                            ->from('Notice no');

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

    public function saveNotice(Notice $notice) {

        $notice->save();
        return true;
    }

    public function deleteNotice($id) {

        $q = Doctrine_Query::create()
                        ->delete('Notice')
                        ->where('notice_code=?', $id);

        $numDeleted = $q->execute();
        if ($numDeleted > 0) {
            return true;
        }
        return false;
    }

    public function readNotice($id) {
        return Doctrine::getTable('Notice')->find($id);
    }

    public function getAllNotice($today) {

            $q = Doctrine_Query::create()
                            ->select('n.*')
                            ->from('Notice n')
                            ->Where('n.from_date <= ?', $today)
                            ->andWhere('n.to_date >= ?', $today);
            return $q->execute();

    }

}