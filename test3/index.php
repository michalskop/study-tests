<?php

// generate numbers for calculation of binomial models


// put full path to Smarty.class.php
require('/usr/local/lib/php/Smarty/libs/Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir('../smarty/templates');
$smarty->setCompileDir('../smarty/templates_c');
$smarty->setCacheDir('../smarty/cache');
$smarty->setConfigDir('../smarty/configs');

//
$data = array();
$data['w'] = array();
$data['h'] = array();
for ($i = 0; $i < 10; $i++) {
  $data['h'][] = mt_rand(160,200);
  $data['w'][] = $data['h'][$i] - 100 + mt_rand(-15,15);
}

$statistics = array(


  'correlation' => array('name'=>'Korelace mezi výškou a váhou','function' => 'correlation', 'label' => "Jaká je korelace mezi výškou a váhou"),
  
  'regression190' => array('name' => 'Očekávaná váha člověka s 190cm', 'function' => 'estimate190', 'label' => "Jaká je očekávaná váha čĺověka, který měří 190cm"),
  
    'regression10' => array('name' => 'O kolik v průměru jsou těžší lidé v Horní Dolní, kteří jsou o 10cm vyšší než jiní', 'function' => 'estimate10', 'label' => "O kolik jsou průměrně těžší lidé, co jsou o 10cm vyšší"),

);

$smarty->assign('statistics',$statistics);
$smarty->assign('data',$data);
$smarty->display('test3.tpl');

?>
