<table cellpadding="1" cellspacing="1" class="build_details">
	<thead>
		<tr>
			<td>Ferreiro</td>
			<td>Ação</td>
		</tr>
	</thead>
	<tbody>
		<tr>
		<?php
		$abdata = $database->getABTech($village->wid);
		$ABups = $technology->getABUpgrades('b');
		for($i=($session->tribe*10-9);$i<=($session->tribe*10-2);$i++) {
			$j = $i % 10 ;
			if ( $technology->getTech($i) || $j == 1 ) {
				echo "<tr><td class=\"desc\"><div class=\"tit\">
<img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
<a href=\"#\" onClick=\"return Popup(".$i.",1);\">".$technology->getUnitName($i)."</a> (Level ".$abdata['b'.$j].")
</div>";
				if($abdata['b'.$j] != 20) {
echo "<div class=\"details\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".${'ab'.$i}[$abdata['b'.$j]+1]['wood']."|<img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".${'ab'.$i}[$abdata['b'.$j]+1]['clay']."|<img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".${'ab'.$i}[$abdata['b'.$j]+1]['iron']."|<img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".${'ab'.$i}[$abdata['b'.$j]+1]['crop']."|<img class=\"clock\" src=\"img/x.gif\" alt=\"duração\" title=\"duração\" />";
				echo $generator->getTimeFormat(round(${'ab'.$i}[$abdata['b'.$j]+1]['time']*($bid12[$building->getTypeLevel(12)]['attri'] / 100)/SPEED));
					if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
					echo "|<a href=\"build.php?gid=17&t=3&r1=".${'ab'.$i}[$abdata['b'.$j]+1]['wood']."&r2=".${'ab'.$i}[$abdata['b'.$j]+1]['clay']."&r3=".${'ab'.$i}[$abdata['b'.$j]+1]['iron']."&r4=".${'ab'.$i}[$abdata['b'.$j]+1]['crop']."\" title=\"Comércio NPC\"><img class=\"npc\" src=\"img/x.gif\" alt=\"Comércio NPC\" title=\"Comércio NPC\" /></a>";
					}
				}
		        if($abdata['b'.$j] == 20) {
					echo "<td class=\"act\"><div class=\"none\">Nível<br>máximo</div></td></tr>";
				}
				else if(${'ab'.$i}[$abdata['b'.$j]+1]['wood'] > $village->maxstore || ${'ab'.$i}[$abdata['b'.$j]+1]['clay'] > $village->maxstore || ${'ab'.$i}[$abdata['b'.$j]+1]['iron'] > $village->maxstore) {
					echo "<td class=\"act\"><div class=\"none\">Aumentar<br>armazém</div></td></tr>";
				}
				else if (${'ab'.$i}[$abdata['b'.$j]+1]['crop'] > $village->maxcrop) {
					echo "<td class=\"act\"><div class=\"none\">Aumentar<br>celeiro</div></td></tr>";
				}
				else if (${'ab'.$i}[$abdata['b'.$j]+1]['wood'] > $village->awood || ${'ab'.$i}[$abdata['b'.$j]+1]['clay'] > $village->aclay || ${'ab'.$i}[$abdata['b'.$j]+1]['iron'] > $village->airon || ${'ab'.$i}[$abdata['b'.$j]+1]['crop'] > $village->acrop) {
					if($village->getProd("crop")>0 || $village->acrop > ${'ab'.$i}[$abdata['b'.$j]+1]['crop']){
						$time = $technology->calculateAvaliable(12,${'ab'.$i}[$abdata['b'.$j]+1]);
			            echo "<br><span class=\"none\">Recursos insuficientes ".$time[0]." at ".$time[1]."</span></div></td>";
					} else {
						echo "<br><span class=\"none\">A produção de cereais é negativa para que você nunca alcance os recursos necessários</span></div></td>";
					}
		            echo "<td class=\"act\"><div class=\"none\">Muito poucos<br>recursos</div></td></tr>";
				}
				else if ($building->getTypeLevel(12) <= $abdata['b'.$j]) {
					echo "<td class=\"act\"><div class=\"none\">Aumentar<br>ferreiro</div></td></tr>";
				}
				else if (count($ABups) > 0) {
					echo "<td class=\"act\"><div class=\"none\">Melhoramento em <br>progresso</div></td></tr>";
				}
				else if($session->access != BANNED){
					echo "<td class=\"act\"><a class=\"research\" href=\"build.php?id=$id&amp;a=$j&amp;c=".$session->mchecker."\">Melhorar</a></td></tr>";
				}else{
					echo "<td class=\"act\"><a class=\"research\" href=\"banned.php\">Melhorar</a></td></tr>";
				}
			}
		}
		?>
	</tbody>
</table>

<?php
	if(count($ABups) > 0) {
		echo "<table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\"><thead><tr><td>Melhorando</td><td>Duração</td><td>Completo</td></tr>
</thead><tbody>";
		$timer = 1;
		foreach($ABups as $black) {
			$unit = ($session->tribe-1)*10 + substr($black['tech'],1,2);
			echo "<tr><td class=\"desc\"><img class=\"unit u$unit\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($unit)."\" title=\"".$technology->getUnitName($unit)."\" />".$technology->getUnitName($unit)."</td>";
			echo "<td class=\"dur\"><span id=\"timer$timer\">".$generator->getTimeFormat($black['timestamp']-time())."</span></td>";
			$date = $generator->procMtime($black['timestamp']);
			echo "<td class=\"fin\"><span>".$date[1]."</span><span> hrs</span></td>";
			echo "</tr>";
			$timer +=1;
		}
		echo "</tbody></table>";
	}
?>
