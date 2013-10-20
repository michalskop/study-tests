{extends file="main.tpl"}

{block name=title}Test 2{/block}

{block name=head}

{/block}

{block name=content}
    <script src="./js/test2.js"></script>
    <p>
      <div><em>Úkol máte splněn, pokud alespoň 80 % otázek odpovíte správně, z toho povinné je vaše jméno(-:</em><div>
      <div><em>Úkol můžete vyplňovat opakovaně. Počítá se nejlepší vyplnění.</em></div>
      
    </p>
    <p>
      <em>Českomoravská televize</em> reportuje, že dle volebního modelu má <em>Nejlepší strana</em> podporu: <strong>{math equation="x / y * 100" x=$data['m'] y=$data['n'] format="%.1f"} %</strong>
    </p>
    <p>
      Dále reportuje, že průzkumu se zúčastnilo <strong>{$data['n0']}</strong> respondentů a <strong>{math equation="(1 - (x / y)) * 100" x=$data['n'] y=$data['n0'] format="%.1f"} %</strong> odpovědělo, že se voleb nezúčastní (a nebyli tedy bráni do úvahy při konstrukci modelu).
    </p>
      

    <p>
    Spočítejte:
    <form id="test2">
      {foreach $statistics as $k=>$s}
        <div data-role="fieldcontain">
          <label for="input-{$k}">{$s['label']} :</label>
          <input name="input-{$k}" id="input-{$k}" value="" placeholder="{$s['name']}" type="text">
        </div>
      {/foreach}

        <em>(přesnost na jedno desetinné místo, používejte tečku jako desetinný oddělovač, např. 10.1)</em>
        
        <p>
          Hint: Binomické rozdělení počtu respondentů v modelu hlasících se k Nejlepší straně (v otázce 3) má střední hodnotu číslo z 2.otázky
        </p>
        <p>
          'Skutečná chyba' je chyba při zahrnutí dalších vlivů, které se v průzkumech projevit (nereprezentativnost, non-response, atd.). Použijte odhad, že je <strong>2</strong>x větší než statistická.
        </p>
        <p>
          Používejte běžnou 95% hladinu spolehlivosti pro odhady statistické chyby a skutečné chyby (tj. "na 95 % bude odhad ..."). Použijte aproximaci binomického rozdělení rozdělením normálním.
        </p>

        
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
		      <strong><span id="popup-{$k}"></span></strong>
		    </div>
		  {/foreach}
		    <a href="#" data-role="button" data-rel="back" data-theme="c">Zavřít</a>
		</div>
    </div>
    <!-- /popup -->

{/block}
