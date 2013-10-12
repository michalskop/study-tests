<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Volba prezidenta ČR 2013</title>
	<link rel="stylesheet"  href="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
	<!--<link rel="stylesheet" href="../_assets/css/jqm-docs.css"/>-->

	<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<!--<script src="../../docs/_assets/js/jqm-docs.js"></script>-->
	<script src="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.js"></script>


<script>
  $('.select-choice').ready(function() { 
    $('.select-choice').change( function() {  //see http://api.jquery.com/change/  SmittyDesign's note
    
      number = $('select.select-choice').length;
      //get rank
      ar = $(this).attr( 'id').split('-');
      //rank
      rank = parseInt(ar[ar.length-1]);
      //enable next select
      if (rank < number) {
        i = rank+1;
        $('#select-choice-'+i).removeAttr('disabled');
        $('#select-choice-'+i).parent().removeClass('ui-disabled');
      }
      //disable values
      for (j = i; j <= number; j++) {
        //enable all
        $('#select-choice-'+j+' option').removeAttr('disabled');
        for (k=1;k<i;k++) {
          //disable already selected
          v = $('#select-choice-'+k).val();
          $('#option-'+j+'-'+v).attr('disabled','disabled');
        }
      }
    });
  });
</script>
</head>
<body>


<div data-role="page" id="page">

	<div data-role="header">
		<h2>Volba prezidenta ČR 2013</h2>
	</div><!-- /header -->

	<div data-role="content">	
	
	<!-- Here is the form -->
		<form action="thanks.php" method="post">
		  <h1>Anonymní výzkum preferencí k prezidentským volbám 2013</h1>
		  <p>Tento dotazník slouží jako podklad pro miniprojekt na kurz Analýza dat na Filozofické fakultě UHK. Jeho cílem je porovnání dvou volebních metod - metody <a href="http://en.wikipedia.org/wiki/Single_transferable_vote">jednoho přenosného hlasu</a> a metody <a href="http://www.pozitivnievoluce.cz/cs-CZ/projekty/navrh-volebniho-zakona.html">záporného hlasu</a> propagovaného Karlem Janečkem.</p>
		  <p>Děkujeme za spolupráci<br/>
		  Tereza Černá, Petra Rothová (autorky)</p>
		  <div style="height:1em"></div>
			<ul data-role="listview"><li data-role="list-divider">Základní údaje o Vás</li></ul><div style="height:1em"></div>
			
			<input type="hidden" name="order" value="{$rand}" />
		    
		    <fieldset data-role="controlgroup" data-type="horizontal" > 
		      <legend>Pohlaví:</legend>
         	  <input type="radio" name="radio-choice-1" id="radio-choice-11" value="female" />
         	  <label for="radio-choice-11">Žena</label>
         	  <input type="radio" name="radio-choice-1" id="radio-choice-12" value="male" />
         	  <label for="radio-choice-12">Muž</label>
		    </fieldset>
		    
		    <fieldset data-role="controlgroup" data-type="horizontal" > 
		      <legend>Věk:</legend>
         	  <input type="radio" name="radio-choice-2" id="radio-choice-21" value="0-17" />
         	  <label for="radio-choice-21">0-17</label>
         	  <input type="radio" name="radio-choice-2" id="radio-choice-22" value="18-24" />
         	  <label for="radio-choice-22">18-24</label>
         	  <input type="radio" name="radio-choice-2" id="radio-choice-23" value="25-34" />
         	  <label for="radio-choice-23">25-34</label>
         	  <input type="radio" name="radio-choice-2" id="radio-choice-24" value="35-44" />
         	  <label for="radio-choice-24">35-44</label>
         	  <input type="radio" name="radio-choice-2" id="radio-choice-25" value="45-54" />
         	  <label for="radio-choice-25">45-54</label>
         	  <input type="radio" name="radio-choice-2" id="radio-choice-26" value="55-64" />
         	  <label for="radio-choice-26">55-64</label>
         	  <input type="radio" name="radio-choice-2" id="radio-choice-27" value="65-100" />
         	  <label for="radio-choice-27">65 a více</label>
		    </fieldset>
		    
		    <fieldset data-role="controlgroup" data-type="horizontal" > 
		      <legend>Z následujících kategorií mi nejlépe odpovídá:</legend>
         	  <input type="radio" name="radio-choice-3" id="radio-choice-31" value="student" />
         	  <label for="radio-choice-31">Student/ka</label>
         	  <input type="radio" name="radio-choice-3" id="radio-choice-32" value="employee" />
         	  <label for="radio-choice-32">Zaměstnanec/-kyně</label>
         	  <input type="radio" name="radio-choice-3" id="radio-choice-33" value="enterpreneur" />
         	  <label for="radio-choice-33">Podnikatel/ka</label>
         	  <input type="radio" name="radio-choice-3" id="radio-choice-34" value="unemployed" />
         	  <label for="radio-choice-34">Nezaměstnaný/-á</label>
         	  <input type="radio" name="radio-choice-3" id="radio-choice-25" value="retired" />
         	  <label for="radio-choice-25">Důchodce</label>
		    </fieldset>
		    
		    <fieldset data-role="controlgroup" data-type="horizontal" > 
		      <legend>Počet obyvatel Vašeho bydliště:</legend>
         	  <input type="radio" name="radio-choice-4" id="radio-choice-41" value="0-5000" />
         	  <label for="radio-choice-41">3000 a méně</label>
         	  <input type="radio" name="radio-choice-4" id="radio-choice-42" value="3001-20000" />
         	  <label for="radio-choice-42">3001 až 20000</label>
         	  <input type="radio" name="radio-choice-4" id="radio-choice-43" value="20001-100000" />
         	  <label for="radio-choice-43">20001 až 100000</label>
         	  <input type="radio" name="radio-choice-4" id="radio-choice-44" value="100000-2000000" />
         	  <label for="radio-choice-44">100001 a více</label>
		    </fieldset>
	
			<div style="height:1em"></div>	
			<ul data-role="listview"><li data-role="list-divider">Volební preference</li></ul>	
			<h2>Půjdete volit?</h2>
			<fieldset data-role="controlgroup" data-type="horizontal" > 
		      <legend>Půjdete volit prezidenta?</legend>
         	  <input type="radio" name="radio-choice-0" id="radio-choice-01" value="yes" />
         	  <label for="radio-choice-01">Ano</label>
         	  <input type="radio" name="radio-choice-0" id="radio-choice-02" value="no" />
         	  <label for="radio-choice-02">Ne</label>
		    </fieldset>
			
			<!-- 2 methods -->
			{if $rand==1}
			  {include file='single_transfer_vote.tpl'}
			  {include file='negative_vote.tpl'}
			{else}
			  {include file='negative_vote.tpl'}
			  {include file='single_transfer_vote.tpl'}
			{/if}

			
<div style="height:1em"></div>
			<ul data-role="listview"><li data-role="list-divider">Už jen odeslat:</li></ul><div style="height:1em"></div>			
			
			<button type="submit" data-theme="e" name="submit">Hotovo!</button>
	    </form>
	</div> <!-- /content -->
</div> <!-- /page -->
</body>
</html>
