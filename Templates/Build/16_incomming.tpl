<?php
include_once("GameEngine/Data/unitdata.php");

$units = $database->getMovement("34",$village->wid,1);
$total_for = count($units);
$send = $database->getMovement("1",$village->wid,1);
$total_for2 = count($send);
for($y=0;$y < $total_for;$y++){
for($i=0;$i < $total_for2;$i++){
if($units[$y]['ref'] == $send[$i]['ref2']){
$res1 = mysql_query("SELECT * FROM " . TB_PREFIX . "send where id = ".$send[$i]['ref']."");
$res = mysql_fetch_array($res1);
}
}
$timer = $y+1;
if ($units[$y]['sort_type']==3){
	if ($units[$y]['attack_type']==3){
		$actionType = "Attack on ";
	} else if ($units[$y]['attack_type']==4){
		$actionType = "Raid on ";
	}
	$reinfowner = $database->getVillageField($units[$y]['from'],"owner");
	if($units[$y]['attack_type'] != 1){
	if($units[$y]['from'] != 0){
				  if($units[$y]['t11'] != 0 && $reinfowner == $session->uid) {
                  $colspan = 11;
				  }else{
				  $colspan = 10;
				  }
		echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
                  <a href=\"karte.php?d=".$units[$y]['from']."&c=".$generator->getMapCheck($units[$y]['from'])."\">".$database->getVillageField($units[$y]['from'],"name")."</a></td>
                  <td colspan=\"$colspan\">";
                  echo "<a href=\"spieler.php?uid=".$database->getVillageField($units[$y]['from'],"owner")."\">".$database->getUserField($database->getVillageField($units[$y]['from'],"owner"),"username",0)."'s troops</a>";
                  echo "</td></tr></thead><tbody class=\"units\">";
                  $tribe = $database->getUserField($database->getVillageField($units[$y]['from'],"owner"),"tribe",0);
                  $start = ($tribe-1)*10+1;
				  $end = ($tribe*10);
                  echo "<tr><th>&nbsp;</th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
				  if($units[$y]['t11'] != 0 && $reinfowner == $session->uid) {
                   echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Her??i\" alt=\"Her??i\" /></td>";    
                  }
                  echo "</tr><tr><th>Tropas</th>";
                  for($i=1;$i<=$colspan;$i++) {
				  $totalunits = $units[$y]['t1']+$units[$y]['t2']+$units[$y]['t3']+$units[$y]['t4']+$units[$y]['t5']+$units[$y]['t6']+$units[$y]['t7']+$units[$y]['t8']+$units[$y]['t9']+$units[$y]['t10']+$units[$y]['t11'];
				  if($units[$y]['attack_type'] == 2){
				  if($reinfowner != $session->uid){
						echo "<td class=\"none\">?</td>";
				  }else{


            	if($units[$y]['t'.$i] == 0) {
                	echo "<td class=\"none\">0</td>";
                }
                else {
                echo "<td>";
                echo $units[$y]['t'.$i]."</td>";
				}
				  }}else{
				$artefact = count($database->getOwnUniqueArtefactInfo2($session->uid,3,3,0));
				$artefact1 = count($database->getOwnUniqueArtefactInfo2($village->wid,3,1,1));
				$artefact2 = count($database->getOwnUniqueArtefactInfo2($session->uid,3,2,0));
				$total_artefact = $artefact + $artefact1 + $artefact2;
				  if($totalunits > $building->getTypeLevel(16) && $total_artefact == 0){
                 		echo "<td class=\"none\">?</td>";
                  }else{
				  if($units[$y]['t'.$i] == 0) {
                    echo "<td class=\"none\">0</td>";
				  }else{
					echo "<td>?</td>";
                  }	
				  }
				  }
				  }
                  echo "</tr></tbody>";
                  echo '
                  <tbody class="infos">
									<tr>
										<th>Chegada</th>
										<td colspan="10">
										<div class="in small"><span id=timer'.$timer.'>'.$generator->getTimeFormat($units[$y]['endtime']-time()).'</span> h</div>';
										    $datetime = $generator->procMtime($units[$y]['endtime']);
										    echo "<div class=\"at small\">";
										    if($datetime[0] != "today") {
										    echo "em ".$datetime[0]." ";
										    }
										    echo "??s ".$datetime[1]." horas</div>
											</div>
										</td>
									</tr>
								</tbody>";
		echo "</table>";
		}else{
		echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
                  <a>Aldeia dos anci??os</a></td>
                  <td colspan=\"10\">";
                  echo "<a>Tropas do Taskmaster</a>";
                  echo "</td></tr></thead><tbody class=\"units\">";
                  $tribe = $session->tribe;
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  echo "<tr><th>&nbsp;</th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
                  echo "</tr><tr><th>Tropas</th>";
                  for($i=1;$i<=10;$i++) {
                 		echo "<td class=\"none\">?</td>";
				  }
                  echo "</tr></tbody>";
                  echo '
                  <tbody class="infos">
									<tr>
										<th>Arrival</th>
										<td colspan="10">
										<div class="in small"><span id=timer'.$timer.'>'.$generator->getTimeFormat($units[$y]['endtime']-time()).'</span> h</div>';
										    $datetime = $generator->procMtime($units[$y]['endtime']);
										    echo "<div class=\"at small\">";
										    if($datetime[0] != "today") {
										    echo "em ".$datetime[0]." ";
										    }
										    echo "??s ".$datetime[1]."</div>
											</div>
										</td>
									</tr>
								</tbody>";
		echo "</table>";
		}
	}
}else if ($units[$y]['sort_type']==4){
	if ($units[$y]['attack_type']==1){
		$actionType = "Voltando de ";
	} else if ($units[$y]['attack_type']==2){
		$actionType = "Refor??o para ";
	} else if ($units[$y]['attack_type']==3){
		$actionType = "Voltando de ";
	} else if ($units[$y]['attack_type']==4){
		$actionType = "Voltando de ";
	}


$to = $database->getMInfo($units[$y]['vref']);
?>
<table class="troop_details" cellpadding="1" cellspacing="1">            
	<thead>
		<tr>
			<td class="role"><a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>"><?php echo $village->vname; ?></a></td>
			<td colspan="<?php if($units[$y]['t11'] != 0) {echo"11";}else{echo"10";}?>"><a href="karte.php?d=<?php echo $to['wref']."&c=".$generator->getMapCheck($to['wref']); ?>"><?php echo "Voltando para ".$to['name']; ?></a></td>
		</tr>
	</thead>
	<tbody class="units">
			<?php
				  $tribe = $session->tribe;
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  echo "<tr><th>&nbsp;</th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
                  if($units[$y]['t11'] != 0) {
                   echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Her??i\" alt=\"Her??i\" /></td>";    
                  }
			?>
			</tr>
 <tr><th>Tropas</th>
            <?php
            for($i=1;$i<($units[$y]['t11'] != 0?12:11);$i++) {
            	if($units[$y]['t'.$i] == 0) {
                	echo "<td class=\"none\">0</td>";
                }
                else {
                echo "<td>";
                echo $units[$y]['t'.$i]."</td>";
                }
			}
            ?>
           </tr>
            <?php
			$totalres = $res['wood']+$res['clay']+$res['iron']+$res['crop'];
			if($units[$y]['attack_type']!=2 and $units[$y]['attack_type']!=1 and $totalres != ""){?>
 <tr><th>Recompensa</th>

			<td colspan="<?php if($units[$y]['t11'] == 0) {echo"10";}else{echo"11";}?>">
			<?php
			$totalcarry = $units[$y]['t1']*${'u'.$start.''}['cap']+$units[$y]['t2']*${'u'.($start+1).''}['cap']+$units[$y]['t3']*${'u'.($start+2).''}['cap']+$units[$y]['t4']*${'u'.($start+3).''}['cap']+$units[$y]['t5']*${'u'.($start+4).''}['cap']+$units[$y]['t6']*${'u'.($start+5).''}['cap']+$units[$y]['t7']*${'u'.($start+6).''}['cap']+$units[$y]['t8']*${'u'.($start+7).''}['cap']+$units[$y]['t9']*${'u'.($start+8).''}['cap']+$units[$y]['t10']*${'u'.($start+9).''}['cap'];
			echo "<div class=\"in small\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$res['wood']."<img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$res['clay']."<img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$res['iron']."<img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$res['crop']."</div>";
			echo "<div class=\"in small\"><img class=\"car\" src=\"gpack/travian_default/img/a/car.gif\" alt=\"carregando\" title=\"carregando\"/>".$totalres."/".$totalcarry."</div>";
            ?>
           </tr>
		   <?php } ?>
		   				    
		<tbody class="infos">
			<tr>
				<th>Chegada</th>
				<td colspan="<?php if($units[$y]['t11'] == 0) {echo"10";}else{echo"11";}?>">
				<?php
				    echo "<div class=\"in small\"><span id=timer".$timer.">".$generator->getTimeFormat($units[$y]['endtime']-time())."</span> h</div>";
				    $datetime = $generator->procMtime($units[$y]['endtime']);
				    echo "<div class=\"at small\">";
				    if($datetime[0] != "today") {
				    echo "em ".$datetime[0]." ";
				    }
				    echo "??s ".$datetime[1]."</div>";
    		?>
					</div>
				</td>
			</tr>
		</tbody>
</table>
<?php
	}
	}

$settlers = $database->getMovement("7",$village->wid,1);
$total_for3 = count($settlers);
for($x=0;$x < $total_for3;$x++){
$timer = $x+1;
$to = $database->getMInfo($settlers[$x]['to']);
?>
<table class="troop_details" cellpadding="1" cellspacing="1">            
	<thead>
		<tr>
			<td class="role"><a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>"><?php echo $village->vname; ?></a></td>
			<td colspan="10"><a href="karte.php?d=<?php echo $to['wref']."&c=".$generator->getMapCheck($to['wref']); ?>"><?php echo "Voltando para ".$to['name']; ?></a></td>
		</tr>
	</thead>
	<tbody class="units">
			<?php
				  $tribe = $session->tribe;
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  echo "<tr><th>&nbsp;</th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
			?>
			</tr>
 <tr><th>Tropas</th>
            <?php
			for($z=1;$z<=9;$z++) {
			$settlers[$x]['t'.$z]=0;
			}
            $settlers[$x]['t10']=3;
            for($i=1;$i<11;$i++) {
            	if($settlers[$x]['t'.$i] == 0) {
                	echo "<td class=\"none\">0</td>";
                }
                else {
                echo "<td>";
                echo $settlers[$x]['t'.$i]."</td>";
                }
			}
            ?>
           </tr>
		   				    
		<tbody class="infos">
			<tr>
				<th>Chegada</th>
				<td colspan="10">
				<?php
				    echo "<div class=\"in small\"><span id=timer".$timer.">".$generator->getTimeFormat($settlers[$x]['endtime']-time())."</span> h</div>";
				    $datetime = $generator->procMtime($settlers[$x]['endtime']);
				    echo "<div class=\"at small\">";
				    if($datetime[0] != "today") {
				    echo "em ".$datetime[0]." ";
				    }
				    echo "??s ".$datetime[1]."</div>";
    		?>
					</div>
				</td>
			</tr>
		</tbody>
</table>
<?php } ?>