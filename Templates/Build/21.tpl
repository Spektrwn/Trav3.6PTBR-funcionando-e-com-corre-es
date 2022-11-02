<div id="build" class="gid21"><a href="#" onClick="return Popup(21,4, 'gid');" class="build_logo"> 
<img class="building g21" src="img/x.gif" alt="Oficina" title="Oficina" /> </a>

<h1>Oficina <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Máquinas de cerco como catapultas e aríetes podem ser construídos na oficina. Quanto maior o seu nível, mais rapidamente as unidades são produzidas.</p>
<?php if ($building->getTypeLevel(21) > 0) { ?>

		<form method="POST" name="snd" action="build.php">
			<input type="hidden" name="id" value="<?php echo $id; ?>" />
            <input type="hidden" name="ft" value="t1" />
			<table cellpadding="1" cellspacing="1" class="build_details">
			<thead>
					<tr>
						<td>Nome</td>
						<td>Quantidade</td>
						<td>Máx</td>
					</tr>
				</thead>
				<tbody>
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
            $start = ($session->tribe == 1)? 7 : (($session->tribe == 2)? 17 : 27);
            if ($session->tribe == 1){
            $start = 7;
            }else if ($session->tribe == 2){
            $start = 17;
            }else if ($session->tribe == 3){
            $start = 27;
			}else if ($session->tribe == 5){
            $start = 47;
            }
			if($session->tribe != 4){
            for($i=$start;$i<=($start+1);$i++) {
                if($technology->getTech($i)) {
                echo "<tr><td class=\"desc\"><div class=\"tit\"><img class=\"unit u$i\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
                    <a href=\"#\" onClick=\"return Popup($i,1);\">".$technology->getUnitName($i)."</a> <span class=\"info\">(Disponível: ".$village->unitarray['u'.$i].")</span></div>";
                    echo "<div class=\"details\">
                                        <img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".${'u'.$i}['wood']."|<img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".${'u'.$i}['clay']."|<img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".${'u'.$i}['iron']."|<img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".${'u'.$i}['crop']."|<img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />".${'u'.$i}['pop']."|<img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />";
                    $dur=round(${'u'.$i}['time'] * ($bid21[$village->resarray['f'.$id]]['attri'] / 100) / SPEED * $artefact_bonus2 / $artefact_bonus);
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
                    if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   echo "|<a href=\"build.php?gid=17&t=3&r1=".((${'u'.$i}['wood'])*$technology->maxUnitPlus($i))."&r2=".((${'u'.$i}['clay'])*$technology->maxUnitPlus($i))."&r3=".((${'u'.$i}['iron'])*$technology->maxUnitPlus($i))."&r4=".((${'u'.$i}['crop'])*$technology->maxUnitPlus($i))."\" title=\"Comércio NPC\"><img class=\"npc\" src=\"img/x.gif\" alt=\"Comércio NPC\" title=\"Comércio NPC\" /></a>";
                 }  
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
			}
            ?>
				</tbody>
			</table>
			<p>
				<input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="train" />

			</p>
		</form>
<?php
	    } else {
			echo "<b>O treinamento pode começar quando a oficina for concluída.</b><br>\n";
		}

    $trainlist = $technology->getTrainingList(3);
    if(count($trainlist) > 0) {
    //$timer = 2*count($trainlist);
    	echo "
    <table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead><tr>
			<td>Treinando</td>
			<td>Duração</td>
			<td>Finaliza em:</td>
		</tr></thead>
		<tbody>";
        $TrainCount = 0;
		foreach($trainlist as $train) {
			$TrainCount++;
			echo "<tr><td class=\"desc\">";
			echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".$train['name']."\" title=\"".$train['name']."\" />";
			echo $train['amt']." ".$train['name']."</td><td class=\"dur\">";
			if ($TrainCount == 1 ) {
				$NextFinished = $generator->getTimeFormat($train['timestamp2']-time());
				echo "<span id=timer1>".$generator->getTimeFormat($train['timestamp']-time())."</span>";
			} else {
				echo $generator->getTimeFormat($train['eachtime']*$train['amt']);
			}
			echo "</td><td class=\"fin\">";
			$time = $generator->procMTime($train['timestamp']);
			if($time[0] != "today") {
				echo "emn ".$time[0]." às ";
            }
            echo $time[1];
		} ?>
		</tr><tr class="next"><td colspan="3">A próxima unidade será concluída em <span id="timer2"><?php echo $NextFinished; ?></span></td></tr>
        </tbody></table>
    <?php }
include("upgrade.tpl");
?>  
    </p></div>


