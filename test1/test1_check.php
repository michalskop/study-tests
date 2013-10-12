<?php

error_reporting(0);

$statistics = array(
  'mean' => array('name'=>'Průměr','function' => 'mean'),
  'median' => array('name' => 'Median', 'function' => 'median'),
  'variance' => array('name' => 'Rozptyl', 'function' => 'stats_variance'),
  'stdev' => array('name' => 'Standardní (směrodatná) odchylka', 'function' => 'stats_standard_deviation'),
);


//calculate
$out = array();
if (isset($_REQUEST['input-data'])) {
  $data = explode(';',$_REQUEST['input-data']);
  $result = array();
  foreach ($statistics as $k=>$s) {
    if (isset($_REQUEST['input-'.$k])) {
      $val1 = (float) $_REQUEST['input-'.$k];
      $val2 = $s['function']($data);
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

$fout = fopen("./test1_result.csv","a+");
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

function mean($array) {
    $count = count($array);
    $sum = array_sum($array);
    if ($count > 0)
      return ($sum / $count);
    else
      return false; 
}

function median($array) {
    rsort($array);
    if (count($array) % 2 === 0)
      return ($array[count($array) / 2] + $array[count($array) / 2 - 1 ])/2;
    else
      return  $array[floor(count($array) / 2)];
}

?>
