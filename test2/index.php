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
$data = array(
  'n0' => mt_rand(1000,1100),
  'n' => mt_rand(400,600),
  'm' => mt_rand(50,200),
);

$statistics = array(
  'number_model' => array('name'=>'Počet respondentů v modelu','function' => 'mean', 'label' => "Kolik respondentů bylo zahrnuto do modelu"),
  
  'number_respondents' => array('name' => 'Počet respondentů volících Nejlepší stranu', 'function' => 'number_respondents', 'label' => "Kolik respondentů řeklo, že budou volit Nejlepší stranu (a jsou zahrnuti v modelu)"),
  
    'standard_deviation' => array('name' => 'Standardní (směrodatná) odchylka', 'function' => 'stats_variance', 'label' => "Jaká je standardní (směrodatná) odchylka rozdělení <strong> počtu respondentů</strong>, kteří podpořili Nejlepší stranu (a jsou zahrnuti v modelu) - při použití binomického rozdělení"),
  
  'statistical_error' => array('name' => 'Statistická chyba +- ? %', 'function' => 'stats_variance', 'label' => "Jaká je 'statistická chyba' údaje pro Nejlepší stranu, +-"),
  
  'real_error' => array('name' => 'Skutečná chyba +- ? %', 'function' => 'stats_variance', 'label' => "Jaká je 'skutečná chyba' údaje pro Nejlepší stranu, +-"),
);

$smarty->assign('statistics',$statistics);
$smarty->assign('data',$data);
$smarty->display('test2.tpl');

?>
