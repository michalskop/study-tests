<?php

// generate n numbers and space for calculation of basic statistics

$n = 10;

// put full path to Smarty.class.php
require('/usr/local/lib/php/Smarty/libs/Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir('../smarty/templates');
$smarty->setCompileDir('../smarty/templates_c');
$smarty->setCacheDir('../smarty/cache');
$smarty->setConfigDir('../smarty/configs');

//
$data = array();
for ($i = 1; $i <= $n; $i++) {
  $data[] = mt_rand(15,25);
}

$statistics = array(
  'mean' => array('name'=>'Průměr','function' => 'mean'),
  'median' => array('name' => 'Median', 'function' => 'median'),
  'variance' => array('name' => 'Rozptyl', 'function' => 'stats_variance'),
  'stdev' => array('name' => 'Standardní (směrodatná) odchylka', 'function' => 'stats_standard_deviation'),
);

$smarty->assign('statistics',$statistics);
$smarty->assign('data',$data);
$smarty->display('test1.tpl');

?>
