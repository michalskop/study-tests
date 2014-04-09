<?php

//error_reporting(0);

$statistics = array(


  'correlation' => array('name'=>'Korelace mezi výškou a váhou','function' => 'correlation', 'label' => "Jaká je korelace mezi výškou a váhou"),
  
  'regression190' => array('name' => 'Očekávaná váha člověka s 190cm', 'function' => 'regression190', 'label' => "Jaká je očekávaná váha čĺověka, který měří 190cm"),
  
    'regression10' => array('name' => 'O kolik v průměru jsou těžší lidé v Horní Dolní, kteří jsou o 10cm vyšší než jiní', 'function' => 'regression10', 'label' => "O kolik jsou průměrně těžší lidé, co jsou o 10cm vyšší"),

);


//calculate
$out = array();
if (isset($_REQUEST['input-data'])) {
  $data_ar = explode(';',$_REQUEST['input-data']);
  $data = array(
    explode(':',$data_ar[0]),  //weight
    explode(':',$data_ar[1])   //heigth
  );
  
  //print_r(correlation($data));
  //print_r(standard_deviation($data[0]));
  //print_r(regression($data));
  //echo '==';
  $result = array();
  foreach ($statistics as $k=>$s) {
    if (isset($_REQUEST['input-'.$k])) {
      $val1 = (float) trim(trim($_REQUEST['input-'.$k],'%'));
      //print_r($s['function']); echo "\n";
      $val2 = $s['function']($data);
      //print_r($val2);
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

function regression190($array) {
  $regression = regression($array);
  return $regression[0] + 190*$regression[1];
}

function regression10($array) {
  $regression = regression($array);
  return $regression[1] * 10;
}
 
function regression($array) {
  $b = correlation($array)*standard_deviation($array[0])/standard_deviation($array[1]);
  $a = mean($array[0]) - $b * mean($array[1]);
  return array($a,$b);
}

function correlation($array) {
  $mean = array(mean($array[0]),mean($array[1]));
  $sd = standard_deviation($array[0]) * standard_deviation($array[1]);
  $sum = 0;
  $i = 0;
  foreach($array[0] as $row) {
    $sum += ($row-$mean[0])*($array[1][$i]-$mean[1]);
    $i++;
    //print($sum);
  }
  return $sum/(count($array[0])-1)/$sd;
}

function mean ($array) {
  $sum = 0;
  foreach ($array as $row) {
    $sum += $row;
  }
  return $sum/count($array);
}

function variance($array) {
  $sum = 0;
  $mean = mean($array);
  foreach ($array as $row) {
    $sum += ($row - $mean)*($row - $mean);
  }
  return $sum / (count($array) - 1);
}

function standard_deviation($array) {
  return sqrt(variance($array));
}

?>
