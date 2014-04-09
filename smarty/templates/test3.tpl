{extends file="main.tpl"}

{block name=title}Test 3{/block}

{block name=head}

{/block}

{block name=content}
    <script src="./js/test2.js"></script>
    <p>
      <div><em>Úkol máte splněn, pokud alespoň 80 % otázek odpovíte správně, z toho povinné je vaše jméno(-:</em><div>
      <div><em>Úkol můžete vyplňovat opakovaně. Počítá se nejlepší vyplnění.</em></div>
      
    </p>
    <p>
      Změřili jsme 10 lidem z Horní Dolní výšku a váhu: {for $i=0 to 9}{$data['h'][$i]} cm, {$data['w'][$i]} kg{if $i<9}; {/if}{/for}
    
      

    <p>
    Spočítejte:
    <form id="test3">
      {foreach $statistics as $k=>$s}
        <div data-role="fieldcontain">
          <label for="input-{$k}">{$s['label']} :</label>
          <input name="input-{$k}" id="input-{$k}" value="" placeholder="{$s['name']}" type="text">
        </div>
      {/foreach}

        <p><em>(přesnost na jedno desetinné místo, používejte tečku jako desetinný oddělovač, např. 10.1)!</em></p>
        
        <p>Všimněte si (<a href="http://en.wikipedia.org/wiki/Correlation_and_dependence">Wiki</a>), kdy se používá <em>n</em> a kdy <em>n-1</em></p>
        
              
        <div data-role="fieldcontain">
          <label for="input-name">Vaše jméno:</label>
          <input name="input-name" id="input-name" value="" placeholder="Jméno" type="text">
        </div>
        
        <input name="input-data" id="input-data" value="{foreach $data as $row}{foreach $row as $item}{$item}{if !$item@last}:{/if}{/foreach}{if !$row@last};{/if}{/foreach}" type="hidden">
	
	    <button data-theme="b" name="submit" id="submit">Hotovo!</button>
	</form>
	
	
	<!-- popup -->
	<div data-role="popup" id="popupDialog" data-overlay-theme="a" data-theme="c" data-dismissible="false" style="max-width:400px;" class="ui-corner-all">
		<div data-role="header" data-theme="a" class="ui-corner-top">
		    <h1>Výsledky</h1>
		</div>
		<div data-role="content" data-theme="d" class="ui-corner-bottom ui-content">
		    {foreach $statistics as $k=>$s}
		    <div data-role="fieldcontain">
		      <span id="popup-label-{$k}"></span>:
		      <strong><span id="popup-{$k}"></span></strong>
		    </div>
		  {/foreach}
		    <a href="#" data-role="button" data-rel="back" data-theme="c">Zavřít</a>
		</div>
    </div>
    <!-- /popup -->

{/block}
