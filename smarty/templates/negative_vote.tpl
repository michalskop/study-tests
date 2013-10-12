			<!-- negative vote -->
			<h2>Toho / tu určitě ne!</h2>
			<p>Pokud byste měl/a možnost udělit záporný hlas jednomu kandidátovi, který by to byl?</p>
			<div data-role="fieldcontain">
				<label for="select-choice-minus" class="select">Vyberte kandidáta, komu byste dal/a záporný hlas:</label>
				<select name="select-choice-minus" id="select-choice-minus" class="select-choice-minus">
				<option selected="selected">---</option>
				    {foreach $candidates as $candidate}
					<option id="option-minus-{$candidate[0]}" value="{$candidate[0]}">{$candidate[1]}</option>
					{/foreach}
				</select>
			</div> <!-- /fieldcontain -->
