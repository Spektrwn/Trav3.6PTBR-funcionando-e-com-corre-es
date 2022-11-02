<h2>Praça dos Torneios</h2>
	<table class="new_building" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<td class="desc">Suas tropas podem aumentar sua resistência na praça do torneio. Quanto mais o edifício for melhorado, mais rapidamente suas tropas estarão além de uma distância mínima de <?php echo TS_THRESHOLD; ?> quadras.</td>
			<td rowspan="3" class="bimg">
				<a href="#" onClick="return Popup(14,4);">
				<img class="building g14" src="img/x.gif" alt="Praça dos Torneios" title="Praça dos Torneios" /></a>
			</td>
		</tr>
		<tr>
		<?php
        $_GET['bid'] = 14;
        include("availupgrade.tpl");
        ?>
		</tr></tbody>
	</table>