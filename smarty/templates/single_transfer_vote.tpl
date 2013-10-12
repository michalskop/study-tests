			<!-- single transfer vote -->
			<h2>Moje preference prezidentských kandidátů</h2>
			<p>Seřaďte, prosím, prezidentské kandidáty dle Vašich preferencí, <b>od nejvíce preferovaného k nejméně</b>.</p>
			
	     	<div data-role="fieldcontain">
	     	  
	     	   {for $i=1 to $count_candidates}
				<label for="select-choice-{$i}" class="select">Vyberte svého {$i}. kandidáta:</label>
				<select name="select-choice-{$i}" id="select-choice-{$i}" class="select-choice" {if $i>1}disabled="disabled"{/if}>
				    <option selected="selected">---</option>
				    {foreach $candidates as $candidate}
					<option id="option-{$i}-{$candidate[0]}" value="{$candidate[0]}">{$candidate[1]}</option>
					{/foreach}
				</select>
				{/for}
				
			</div> <!-- /fieldcontain -->
