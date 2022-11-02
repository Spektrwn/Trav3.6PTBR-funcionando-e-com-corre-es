<div id="build" class="gid16"><a href="#" onClick="return Popup(16,4);" class="build_logo">
	<img class="g16" src="img/x.gif" alt="Ponto de reunião militar" title="Ponto de reunião militar" />
</a>
<h1>Ponto de reunião militar <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">As tropas da vossa aldeia se encontram aqui. A partir daqui você pode enviá-los para conquistar, invadir ou reforçar outras aldeias.</p>

<div id="textmenu">
		<a href="build.php?id=<?php echo $id; ?>">Visão geral</a> |
		<a href="a2b.php">Enviar tropas</a> |
		<a href="warsim.php">Simulador de combate</a> <?php if($session->goldclub==1){ ?>|
		<a href="build.php?id=<?php echo $id; ?>&amp;t=99">Clube Ouro</a>
		<?php } ?>
		</div>
<?php
$units_type = $database->getMovement("34",$village->wid,1);
$settlers = $database->getMovement("7",$village->wid,1);
$units_incoming = count($units_type);
$settlers_incoming = count($settlers);
for($i=0;$i<$units_incoming;$i++){
	if($units_type[$i]['attack_type'] == 1 && $units_type[$i]['sort_type'] == 3)
		$units_incoming -= 1;
}
if($units_incoming > 0 or $settlers_incoming > 0){
?>
<h4>Tropas chegando (<?php echo $units_incoming; ?>)</h4>
	<?php include("16_incomming.tpl"); 
	} 
?>
		
<h4>Tropas na aldeia</h4>
        <table class="troop_details" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td class="role"><a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>"><?php echo $village->vname; ?></a></td><td colspan="<?php if($village->unitarray['hero'] == 0) {echo"10";}else{echo"11";}?>">
            <a href="spieler.php?uid=<?php echo $session->uid; ?>">Próprias tropas </a></td></tr></thead>
            <tbody class="units">
           <?php include("16_troops.tpl"); 
          
           ?>
            </tbody></table>
            
            <?php
            if(count($village->enforcetome) > 0) {
            foreach($village->enforcetome as $enforce) {
			$colspan = 10+$enforce['hero'];
			if($enforce['from']!=0){
                  echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
                  <a href=\"karte.php?d=".$enforce['from']."&c=".$generator->getMapCheck($enforce['from'])."\">".$database->getVillageField($enforce['from'],"name")."</a></td>
                  <td colspan=\"$colspan\">";
                  echo "tropas de <a href=\"spieler.php?uid=".$database->getVillageField($enforce['from'],"owner")."\">".$database->getUserField($database->getVillageField($enforce['from'],"owner"),"username",0)." </a>";
                  echo "</td></tr></thead><tbody class=\"units\">";
                  $tribe = $database->getUserField($database->getVillageField($enforce['from'],"owner"),"tribe",0);
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  echo "<tr><th>&nbsp;</th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
				  if($enforce['hero']!=0){
					echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Herói\" alt=\"Herói\" /></td>";
				  }
                  echo "</tr><tr><th>Tropas</th>";
                  for($i=$start;$i<=($start+9);$i++) {
                  if($enforce['u'.$i] == 0) {
                	echo "<td class=\"none\">";
                       }
                      else {
                     echo "<td>";
                        }
                        echo $enforce['u'.$i]."</td>";
                  }
				  if($enforce['hero']!=0){
					echo "<td>".$enforce['hero']."</td>";
				  }
                  echo "</tr></tbody>
            <tbody class=\"infos\"><tr><th>Consumo</th><td colspan=\"$colspan\"><div class='sup'>".$technology->getUpkeep($enforce,$tribe)."<img class=\"r4\" src=\"img/x.gif\" title=\"Cereal\" alt=\"Cereal\" />por hora</div><div class='sback'><a href='a2b.php?w=".$enforce['id']."'>Devolver</a></div></td></tr>";
            
                  echo "</tbody></table>";
			}else{
                  echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
                  <a>Capataz</a></td>
                  <td colspan=\"$colspan\">";
                  echo "<a> Aldeia das tropas dos anciões</a>";
                  echo "</td></tr></thead><tbody class=\"units\">";
                  $tribe = 4;
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  echo "<tr><th>&nbsp;</th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
				  if($enforce['hero']!=0){
					echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Herói\" alt=\"Herói\" /></td>";
				  }
                  echo "</tr><tr><th>Tropas</th>";
                  for($i=$start;$i<=($start+9);$i++) {
                  if($enforce['u'.$i] == 0) {
                	echo "<td class=\"none\">";
                       }
                      else {
                     echo "<td>";
                        }
                        echo $enforce['u'.$i]."</td>";
                  }
				  if($enforce['hero']!=0){
					echo "<td>".$enforce['hero']."</td>";
				  }
                  echo "</tr></tbody>
            <tbody class=\"infos\"><tr><th>Consumo</th><td colspan=\"$colspan\"><div class='sup'>".$technology->getUpkeep($enforce,$tribe)."<img class=\"r4\" src=\"img/x.gif\" title=\"Ceral\" alt=\"Cereal\" />por hora</div><div class='sback'><span class=none><b>Devolver</b></span></div></td></tr>";
            
                  echo "</tbody></table>";
			}
            }
            }
            if(count($village->enforcetoyou) > 0) {
            echo "<h4>Tropas em outra aldeia</h4>";
            foreach($village->enforcetoyou as $enforce) {
			$colspan = 10+$enforce['hero'];
                  echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
                  <a href=\"karte.php?d=".$enforce['vref']."&c=".$generator->getMapCheck($enforce['vref'])."\">".$database->getVillageField($enforce['vref'],"name")."</a></td>
                  <td colspan=\"$colspan\">";
                  echo "tropas de <a href=\"spieler.php?uid=".$database->getVillageField($enforce['from'],"owner")."\">".$database->getUserField($database->getVillageField($enforce['from'],"owner"),"username",0)." </a>";
                  echo "</td></tr></thead><tbody class=\"units\">";
                  $tribe = $database->getUserField($database->getVillageField($enforce['from'],"owner"),"tribe",0);
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  echo "<tr><th>&nbsp;</th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
				  if($enforce['hero']!=0){
					echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Herói\" alt=\"Herói\" /></td>";
				  }
                  echo "</tr><tr><th>Tropas</th>";
                  for($i=$start;$i<=($start+9);$i++) {
                  if($enforce['u'.$i] == 0) {
                	echo "<td class=\"none\">";
                       }
                      else {
                     echo "<td>";
                        }
                        echo $enforce['u'.$i]."</td>";
                  }
				  if($enforce['hero']!=0){
					echo "<td>".$enforce['hero']."</td>";
				  }
                  echo "</tr></tbody>
            <tbody class=\"infos\"><tr><th>Consumo</th><td colspan=\"$colspan\"><div class='sup'>".$technology->getUpkeep($enforce,$tribe)."<img class=\"r4\" src=\"img/x.gif\" title=\"Cereal\" alt=\"Cereal\" />por hora</div><div class='sback'><a href='a2b.php?r=".$enforce['id']."'>Devolver</a></div></td></tr>";
            
                  echo "</tbody></table>";
            }
            }
            if(count($database->getPrisoners3($village->wid)) > 0) {
            echo "<h4>Prisioneiros</h4>";
            foreach($database->getPrisoners3($village->wid) as $prisoners) {
			$colspan = 10+$prisoners['t11'];
                  echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
                  <a href=\"karte.php?d=".$prisoners['wref']."&c=".$generator->getMapCheck($prisoners['wref'])."\">".$database->getVillageField($prisoners['wref'],"name")."</a></td>
                  <td colspan=\"$colspan\">";
                  echo "<a href=\"karte.php?d=".$prisoners['wref']."&c=".$generator->getMapCheck($prisoners['wref'])."\">prisioneiros em ".$database->getVillageField($prisoners['wref'],"name")."</a>";
                  echo "</td></tr></thead><tbody class=\"units\">";
                  $tribe = $database->getUserField($database->getVillageField($prisoners['from'],"owner"),"tribe",0);
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  echo "<tr><th>&nbsp;</th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
				  if($prisoners['t11']!=0){
					echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Herói\" alt=\"Herói\" /></td>";
				  }
                  echo "</tr><tr><th>Tropas</th>";
                  for($i=1;$i<=10;$i++) {
                  if($prisoners['t'.$i] == 0) {
                	echo "<td class=\"none\">";
                       }
                      else {
                     echo "<td>";
                        }
                        echo $prisoners['t'.$i]."</td>";
                  }
				  if($prisoners['t11']!=0){
					echo "<td>".$prisoners['t11']."</td>";
				  }
                  echo "</tr></tbody>
            <tbody class=\"infos\"><tr><th>Consumo</th><td colspan=\"$colspan\"><div class='sup'>".$technology->getUpkeep($prisoners,$tribe,0,1)."<img class=\"r4\" src=\"img/x.gif\" title=\"Cereal\" alt=\"Cereal\" />por hora</div><div class='sback'><a href='a2b.php?delprisoners=".$prisoners['id']."'>Matar</a></div></td></tr>";
            
                  echo "</tbody></table>";
            }
            }
            if(count($database->getPrisoners($village->wid)) > 0) {
            echo "<h4>Prisioneiros</h4>";
            foreach($database->getPrisoners($village->wid) as $prisoners) {
			$colspan = 10+$prisoners['t11'];
			$colspan2 = 11+$prisoners['t11'];
                  echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><td class=\"role\">
                  <a href=\"karte.php?d=".$prisoners['from']."&c=".$generator->getMapCheck($prisoners['from'])."\">".$database->getVillageField($prisoners['from'],"name")."</a></td>
                  <td colspan=\"$colspan\">";
                  echo "<a href=\"karte.php?d=".$prisoners['from']."&c=".$generator->getMapCheck($prisoners['from'])."\">prisoners from ".$database->getVillageField($prisoners['from'],"name")."</a>";
                  echo "</td></tr></thead><tbody class=\"units\">";
                  $tribe = $database->getUserField($database->getVillageField($prisoners['from'],"owner"),"tribe",0);
                  $start = ($tribe-1)*10+1;
                  $end = ($tribe*10);
                  echo "<tr><th>&nbsp;</th>";
                  for($i=$start;$i<=($end);$i++) {
                  	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";	
                  }
				  if($prisoners['t11']!=0){
					echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Herói\" alt=\"Herói\" /></td>";
				  }
                  echo "</tr><tr><th>Tropas</th>";
                  for($i=1;$i<=10;$i++) {
                  if($prisoners['t'.$i] == 0) {
                	echo "<td class=\"none\">";
                       }
                      else {
                     echo "<td>";
                        }
                        echo $prisoners['t'.$i]."</td>";
                  }
				  if($prisoners['t11']!=0){
					echo "<td>".$prisoners['t11']."</td>";
				  }
                  echo "</tr></tbody>
            <tbody class=\"infos\"><tr><td colspan=\"11\"><div class='sup'><img class=\"r6\" src=\"img/x.gif\" title=\"Cereal\" alt=\"Cereal\" /></div><div class='sback'><a href='a2b.php?delprisoners=".$prisoners['id']."'>Devolver</a></div></td></tr>";
            
                  echo "</tbody></table>";
            }
            }
            ?>

<?php
$units_type = $database->getMovement("3",$village->wid,0);
$settlers = $database->getMovement("5",$village->wid,0);
$units_incoming = count($units_type);
for($i=0;$i<$units_incoming;$i++){
	if($units_type[$i]['vref'] != $village->wid)
		$units_incoming -= 1;
}
$units_incoming += count($settlers);

if($units_incoming >= 1){
	echo "<h4>Suas tropas saindo</h4>";
	include("16_walking.tpl"); 
}

include("upgrade.tpl");
?>
</p></div>
