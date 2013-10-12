{extends file="main.tpl"}

{block name=title}Test 1{/block}

{block name=head}

{/block}

{block name=content}
    <script src="./js/test1.js"></script>
    <p>
      <div><em>Úkol máte splněn, pokud alespoň 80 % otázek odpovíte správně, z toho povinné je vaše jméno(-:</em><div>
      <div><em>Úkol můžete vyplňovat opakovaně. Počítá se nejlepší vyplnění.</em></div>
      
    </p>
    <p>
      Provedli jsme {$data|@count} nezávislých výzkumů veřejného mínění a získali jsme odhady podpory pro <em>Nejlepší stranu</em>:
    </p>
    {foreach $data as $item}
      {$item}{if !$item@last}, {/if}
    {/foreach}
    </p>
    <p>
    Spočítejte por těchto {$data|@count} odhadů podpory:
    <form id="test1">
      {foreach $statistics as $k=>$s}
        <div data-role="fieldcontain">
          <label for="input-{$k}">{$s['name']}:</label>
          <input name="input-{$k}" id="input-{$k}" value="" placeholder="{$s['name']}" type="text">
        </div>
      {/foreach}

        <em>(přesnost na jedno desetinné místo, používejte tečku jako desetinný oddělovač, např. 10.1)</em>
        
        <div data-role="fieldcontain">
          <label for="input-name">Vaše jméno:</label>
          <input name="input-name" id="input-name" value="" placeholder="Jméno" type="text">
        </div>
        
        <input name="input-data" id="input-data" value="{foreach $data as $item}{$item}{if !$item@last};{/if}{/foreach}" type="hidden">
	
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
		      <span id="popup-{$k}"></span>
		    </div>
		  {/foreach}
		    <a href="#" data-role="button" data-rel="back" data-theme="c">Zavřít</a>
		</div>
    </div>
    <!-- /popup -->

{/block}
