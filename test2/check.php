<?php

error_reporting(0);

$statistics = array(
  'number_model' => array('name'=>'Počet respondentů v modelu','function' => 'number_model', 'label' => "Kolik respondentů bylo zahrnuto do modelu"),
  
  'number_respondents' => array('name' => 'Počet respondentů volících Nejlepší stranu', 'function' => 'number_respondents', 'label' => "Kolik respondentů řeklo, že budou volit Nejlepší stranu (a jsou zahrnuti v modelu)"),
  
    'standard_deviation' => array('name' => 'Standardní (směrodatná) odchylka', 'function' => 'standard_deviation', 'label' => "Jaká je standardní (směrodatná) odchylka rozdělení <strong> počtu respondentů</strong>, kteří podpořili Nejlepší stranu (a jsou zahrnuti v modelu) - při použití binomického rozdělení"),
  
  'statistical_error' => array('name' => 'Statistická chyba +- ? %', 'function' => 'statistical_error', 'label' => "Jaká je 'statistická chyba' údaje pro Nejlepší stranu, +-"),
  
  'real_error' => array('name' => 'Skutečná chyba +- ? %', 'function' => 'real_error', 'label' => "Jaká je 'skutečná chyba' údaje pro Nejlepší stranu, +-"),
);


//calculate
$out = array();
if (isset($_REQUEST['input-data'])) {
  $data = explode(';',$_REQUEST['input-data']);
  $result = array();
  foreach ($statistics as $k=>$s) {
    if (isset($_REQUEST['input-'.$k])) {
      $val1 = (float) trim(trim($_REQUEST['input-'.$k],'%'));
      $val2 = $s['function']($data);
      //echo $val1 . '**' . $val2 . "<br/>";
	  if (($val2>=0.9*$val1) and ($val2<=1.1*$val1)) {
	    $out[$k] = array(
	      'name' => $s['name'], 'result' => 'OK'
	    );
	  } else {
	    $out[$k] = array(
	      'name' => $s['name'], 'result' => 'Špatně'
	    );
	  }
	    
    } else {
      $out[$k] = array(
	      'name' => $s['name'], 'result' => 'Chybí'
	  );
    }
  }
}
//write to file

$fout = fopen("./result.csv","a+");
$print = array();
$print[] = $_SERVER['REMOTE_ADDR'];
$print[] = date('Y-m-d H:i:s');
$print[] = (isset($_REQUEST['input-name']) ? $_REQUEST['input-name'] : '-');
foreach ($out as $key=>$row) {
  $print[] = $key;
  $print[] = (isset($_REQUEST['input-'.$key]) ? $_REQUEST['input-'.$key] : '-');
  $print[] = $row['result'];
}
$print[] = (isset($_REQUEST['input-data']) ? $_REQUEST['input-data'] : '-');
fputcsv($fout,$print);
fclose($fout);


echo json_encode($out);

function number_model($array) {
  return $array[1];
}

function number_respondents($array) {
  return $array[2];
}

function standard_deviation($array) {
  $n = $array[1];
  $p = $array[2]/$array[1];
  return sqrt($n*$p*(1-$p));
}

function statistical_error($array) {
  $n = $array[1];
  $p = $array[2]/$array[1];
  $stdev = sqrt($n*$p*(1-$p));
  return  1.96*$stdev/$n*100;
}

function real_error($array) {
  $n = $array[1];
  $p = $array[2]/$array[1];
  $stdev = sqrt($n*$p*(1-$p));
  return 2*1.96*$stdev/$n*100;
}

?>
