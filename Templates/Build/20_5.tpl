<?php
			$artefact = count($database->getOwnUniqueArtefactInfo2($session->uid,5,3,0));
			$artefact1 = count($database->getOwnUniqueArtefactInfo2($village->wid,5,1,1));
			$artefact2 = count($database->getOwnUniqueArtefactInfo2($session->uid,5,2,0));
			if($artefact > 0){
			$artefact_bonus = 2;
			$artefact_bonus2 = 1;
			}else if($artefact1 > 0){
			$artefact_bonus = 2;
			$artefact_bonus2 = 1;
			}else if($artefact2 > 0){
			$artefact_bonus = 4;
			$artefact_bonus2 = 3;
			}else{
			$artefact_bonus = 1;
			$artefact_bonus2 = 1;
			}
$success = 0;
for($i=45;$i<=46;$i++) {
	if($technology->getTech($i)) {
    echo "<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u$i\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
		<a href=\"#\" onClick=\"return Popup($i,1);\">".$technology->getUnitName($i)."</a> <span class=\"info\">(Disponível: ".$village->unitarray['u'.$i].")</span></div>";
        echo "<div class=\"details\">
							<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".${'u'.$i}['wood']."|<img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".${'u'.$i}['clay']."|<img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".${'u'.$i}['iron']."|<img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".${'u'.$i}['crop']."|<img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />".${'u'.$i}['pop']."|<img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />";
		$dur=round(${'u'.$i}['time'] * ($bid20[$village->resarray['f'.$id]]['attri'] / 100) / SPEED * $artefact_bonus2 / $artefact_bonus);
					$foolartefact = $database->getFoolArtefactInfo(5,$village->wid,$session->uid);
					if(count($foolartefact) > 0){
					foreach($foolartefact as $arte){
					if($arte['bad_effect'] == 1){
					$dur *= $arte['effect2'];
					}else{
					$dur /= $arte['effect2'];
					$dur = round($dur);
					}
					}
					}
					$dur=$generator->getTimeFormat($dur);
		echo ($dur=="0:00:00")? "0:00:01":$dur;
        echo "</div></td>
					<td class=\"val\">
						<input type=\"text\" class=\"text\" name=\"t$i\" value=\"0\" maxlength=\"$i\">
					</td>

					<td class=\"max\">
						<a href=\"#\" onClick=\"document.snd.t$i.value=".$technology->maxUnit($i)."; return false;\">(".$technology->maxUnit($i).")</a>
					</td>
				</tr>";
          $success += 1;
    }
}
if($success == 0) {
	echo "<tr><td class=\"none\" colspan=\"3\">Não há unidades disponíveis. Pesquisa na academia</td></tr>";
}
?>