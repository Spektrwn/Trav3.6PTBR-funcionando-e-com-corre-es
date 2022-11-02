<table cellpadding="1" cellspacing="1" class="build_details">
<thead><tr>
	<td>Academia</td>
	<td>Ação</td>
</tr></thead>
<tbody>

<?php 
$fail = $success = 0;
$acares = $technology->grabAcademyRes();
for($i=2;$i<=9;$i++) {
	if($technology->meetRRequirement($i) && !$technology->getTech($i) && !$technology->isResearch($i,1)) {
    	echo "<tr><td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
						<a href=\"#\" onClick=\"return Popup(".$i.",1);\">".$technology->getUnitName($i)."</a>
					</div>
					<div class=\"details\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".${'r'.$i}['wood']."|<img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".${'r'.$i}['clay']."|<img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".${'r'.$i}['iron']."|<img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".${'r'.$i}['crop']."|<img class=\"clock\" src=\"img/x.gif\" alt=\"duração\" title=\"duração\" />";
                    echo $generator->getTimeFormat(round(${'r'.$i}['time'] * ($bid22[$village->resarray['f'.$id]]['attri'] / 100)/SPEED));
                    if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1) {
                   echo "|<a href=\"build.php?gid=17&t=3&r1=".${'r'.$i}['wood']."&r2=".${'r'.$i}['clay']."&r3=".${'r'.$i}['iron']."&r4=".${'r'.$i}['crop']."\" title=\"Comércio NPC\"><img class=\"npc\" src=\"img/x.gif\" alt=\"Comércio NPC\" title=\"Comércio NPC\" /></a>";
                   }
                   if(${'r'.$i}['wood'] > $village->maxstore || ${'r'.$i}['clay'] > $village->maxstore || ${'r'.$i}['iron'] > $village->maxstore) {
                    echo "<br><span class=\"none\">Aumentar Armazém</span></div></td>";
                    echo "<td class=\"act\">
					<div class=\"none\">Aumentar<br>Armazém</div>
				</td></tr>";
                }
                else if(${'r'.$i}['crop'] > $village->maxcrop) {
                    echo "<br><span class=\"none\">Almentar Celeiro</span></div></td>";
                    echo "<td class=\"act\">
					<div class=\"none\">Aumentar<br>Celeiro</div>
				</td></tr>";
                }
                else if(${'r'.$i}['wood'] > $village->awood || ${'r'.$i}['clay'] > $village->aclay || ${'r'.$i}['iron'] > $village->airon || ${'r'.$i}['crop'] > $village->acrop) {
					if($village->getProd("crop")>0){
						$time = $technology->calculateAvaliable(22,${'r'.$i});
						echo "<br><span class=\"none\">Recursos suficientes ".$time[0]." às ".$time[1]."</span></div></td>";
					} else {
						echo "<br><span class=\"none\">A produção de cereais é negativa para que você nunca alcance os recursos necessários</span></div></td>";
					}
                    echo "<td class=\"act\"><div class=\"none\">Poucos<br>recursos</div></td></tr>";
                }
                else if (count($acares) > 0) {
                echo "</td>";
                    echo "<td class=\"none\">
					Pesquisa em andamento</td></tr>";
                }
				else if($session->access != BANNED){
                echo "</td>";
                    echo "<td class=\"act\">
					<a class=\"research\" href=\"build.php?id=$id&amp;a=$i&amp;c=".$session->mchecker."\">Pesquisar</a></td></tr>";
                }else{
                echo "</td>";
                    echo "<td class=\"act\">
					<a class=\"research\" href=\"banned.php\">Pesquisa</a></td></tr>";
					}
                $success += 1;
    }
    else {
    $fail += 1;
    }
}
if($success == 0) {
echo "<td colspan=\"2\"><div class=\"none\" align=\"center\">Não existem pesquisas disponíveis</div></td>";
}
?>
</tbody>
            </table>
<?php
if($fail > 0) { 
	echo "<p class=\"switch\"><a id=\"researchFutureLink\" href=\"#\" onclick=\"return $('researchFuture').toggle();\">mostrar mais</a></p>
		<table id=\"researchFuture\" class=\"build_details hide\" cellspacing=\"1\" cellpadding=\"1\">
			<thead><tr><td colspan=\"2\">Pré-requisitos</td></tr><tbody>";
      if(!$technology->meetRRequirement(2) && !$technology->getTech(2)) {
     echo"<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u2\" title=\"Pretoriano\" alt=\"Pretoriano\" src=\"img/x.gif\"/>
			<a onclick=\"return Popup(2, 1);\" href=\"#\">Pretoriano</a></div></td><td class=\"cond\"><a href=\"#\" onclick=\"return Popup(22, 1);\">Academia</a>
			<span title=\"+2\">&nbsp;Nível 1</span><br /><a href=\"#\" onclick=\"return Popup(13, 4);\">Fábrica de armadura </a><span title=\"+1\">&nbsp;Nível 1</span></td></tr>";
     }
     if(!$technology->meetRRequirement(3) && !$technology->getTech(3)) {
     echo"<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u3\" title=\"Imperiano\" alt=\"Imperiano\" src=\"img/x.gif\"/>
			<a onclick=\"return Popup(3, 1);\" href=\"#\">Imperiano</a></div></td><td class=\"cond\"><a href=\"#\" onclick=\"return Popup(22, 4);\">Academia</a>
			<span title=\"+2\">&nbsp;Nível 5</span><br /><a href=\"#\" onclick=\"return Popup(12, 4);\">Ferreiro </a><span title=\"+1\">&nbsp;Nível 1</span>	</td></tr>";
     }
     if(!$technology->meetRRequirement(4) && !$technology->getTech(4)) {
     echo "<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u4\" title=\"Equites Legati\" alt=\"Equites Legati\" src=\"img/x.gif\"/>
		 	<a onclick=\"return Popup(4, 1);\" href=\"#\">Equites Legati</a></div></td><td class=\"cond\">
            <a href=\"#\" onclick=\"return Popup(22, 4);\">Academia</a><span title=\"+2\">&nbsp;Nível 5</span><br /><a href=\"#\" onclick=\"return Popup(20, 4);\">Cavalaria</a><span title=\"+1\">&nbsp;Nível 1</span>	</td></tr>";
     }
     if(!$technology->meetRRequirement(5) && !$technology->getTech(5)) {
     echo "<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u5\" title=\"Equites Imperatoris\" alt=\"Equites Imperatoris\" src=\"img/x.gif\"/>
			<a onclick=\"return Popup(5, 1);\" href=\"#\">Equites Imperatoris</a></div></td><td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(22, 4);\">Academia</a><span title=\"+2\">&nbsp;Nível 5</span><br /><a href=\"#\" onclick=\"return Popup(20, 4);\">Cavalaria</a><span title=\"+5\">&nbsp;Nível 5</span>	</td></tr>";
     }
     if(!$technology->meetRRequirement(6) && !$technology->getTech(6)) {
     echo "<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u6\" title=\"Equites Caesaris\" alt=\"Equites Caesaris\" src=\"img/x.gif\"/>
			<a onclick=\"return Popup(6, 1);\" href=\"#\">Equites Caesaris</a></div></td><td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(22, 4);\">Academia</a><span title=\"+12\">&nbsp;Nível 15</span><br /><a href=\"#\" onclick=\"return Popup(20, 4);\">
            Cavalaria</a><span title=\"+10\">&nbsp;Nível 10</span>	</td></tr>";
     }
     if(!$technology->meetRRequirement(7) && !$technology->getTech(7)) {
     echo "
			<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u7\" title=\"Aríete\" alt=\"Aríete\" src=\"img/x.gif\"/>
			<a onclick=\"return Popup(7, 1);\" href=\"#\">Aríete</a></div></td><td class=\"cond\"><a href=\"#\" onclick=\"return Popup(22, 4);\">Academia</a>
			<span title=\"+7\">&nbsp;Nível 10</span><br /><a href=\"#\" onclick=\"return Popup(21, 4);\">Oficina</a><span title=\"+1\">&nbsp;Nível 1</span></td></tr>";
     }
     if(!$technology->meetRRequirement(8) && !$technology->getTech(8)) {
     echo "<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u8\" title=\"Catapulta de fogo\" alt=\"Catapulta de fogo\" src=\"img/x.gif\"/>
            <a onclick=\"return Popup(8, 1);\" href=\"#\">Catapulta de fogo</a></div></td><td class=\"cond\"><a href=\"#\" onclick=\"return Popup(21, 4);\">Oficina</a>
            <span title=\"+10\">&nbsp;Nível 10</span><br /><a href=\"#\" onclick=\"return Popup(22, 4);\">Academia</a><span title=\"+12\">&nbsp;Nível 15</span>	</td>
			</tr>";
     }
     if(!$technology->meetRRequirement(9) && !$technology->getTech(9)) {
     echo "	<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u9\" title=\"Senador\" alt=\"Senador\" src=\"img/x.gif\"/>
			<a onclick=\"return Popup(9, 1);\" href=\"#\">Senador</a></div></td><td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(16, 4);\">Ponto de Reunião Militar</a><span title=\"+9\">&nbsp;Nível 10</span><br /><a href=\"#\" onclick=\"return Popup(22, 4);\">
            Academia</a><span title=\"+17\">&nbsp;Nível 20</span></td></tr>";
     }
     echo "<script type=\"text/javascript\">
		//<![CDATA[
			$(\"researchFuture\").toggle = (function()
			{
				this.toggleClass(\"hide\");

				$(\"researchFutureLink\").set(\"text\",
					this.hasClass(\"hide\")
					?	\"mostrar mais\"
					:	\"esconder\"
				);

				return false;
			}).bind($(\"researchFuture\"));
		//]]>
		</script>";
     echo "</tbody></table>";
}
//$acares = $technology->grabAcademyRes();
if(count($acares) > 0) {
	echo "<table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\"><thead><tr><td>Pesquisando</td><td>Duração</td><td>Completo em:</td></tr>
	</thead><tbody>";
			$timer = 1;
	foreach($acares as $aca) {
		$unit = substr($aca['tech'],1,2);
		echo "<tr><td class=\"desc\"><img class=\"unit u$unit\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($unit)."\" title=\"".$technology->getUnitName($unit)."\" />".$technology->getUnitName($unit)."</td>";
			echo "<td class=\"dur\"><span id=\"timer$timer\">".$generator->getTimeFormat($aca['timestamp']-time())."</span></td>";
			$date = $generator->procMtime($aca['timestamp']);
		    echo "<td class=\"fin\"><span>".$date[1]."</span><span> hrs</span></td>";
		echo "</tr>";
		$timer +=1;
	}
	echo "</tbody></table>";
}
?>
