<?php
$bid = $_GET['bid'];
unset($_GET['bid']);
$bindicator = $building->canBuild($id,$bid);
$loopsame = ($building->isCurrent($id) || $building->isLoop($id))?1:0;
$doublebuild = ($building->isCurrent($id) && $building->isLoop($id))?1:0;
$uprequire = $building->resourceRequired($id,$bid);
$mastertime = $uprequire['time'];
?>
<td class="res">
			<img class="r1" src="img/x.gif" alt="Madeira" title="Madeira" /><?php echo $uprequire['wood']; ?> | <img class="r2" src="img/x.gif" alt="Barro" title="Barro" /><?php echo $uprequire['clay']; ?> | <img class="r3" src="img/x.gif" alt="Ferro" title="Ferro" /><?php echo $uprequire['iron']; ?> | <img class="r4" src="img/x.gif" alt="Cereal" title="Cereal" /><?php echo $uprequire['crop']; ?> | <img class="r5" src="img/x.gif" alt="Consumo de cereal" title="Consumo de cereal" /><?php echo $uprequire['pop']; ?> | <img class="clock" src="img/x.gif" alt="duração" title="duração" /><?php echo $generator->getTimeFormat($uprequire['time']);

                   if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
                   echo "|<a href=\"build.php?gid=17&t=3&r1=".$uprequire['wood']."&r2=".$uprequire['clay']."&r3=".$uprequire['iron']."&r4=".$uprequire['crop']."\" title=\"Comércio NPC\"><img class=\"npc\" src=\"img/x.gif\" alt=\"Comércio NPC\" title=\"Comércio NPC\" /></a>";
                 } ?></td>
		</tr>
		<tr>
			<td class="link">
<?php
     if($bindicator == 2) {
     echo "<span class=\"none\">Os trabalhadores já estão trabalhando.</span>";
	if($session->goldclub == 1){
?>	</br>
<?php
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime\">Construir com o mestre-construtor </a>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}else{
		echo "<span class=\"none\">Construindo com o mestre-construtor</span>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}
	}
     }
     else if($bindicator == 3) {
     echo "<span class=\"none\">Os trabalhadores já estão trabalhando. (Fila de espera)</span>";
	if($session->goldclub == 1){
?>	</br>
<?php
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime\">Construir com o mestre-construtor </a>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}else{
		echo "<span class=\"none\">Construir com o mestre-construtor</span>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}
	}
     }
     else if($bindicator == 4) {
     echo "<span class=\"none\">Não comida suficiente. Expandir campos de cereal.</span>";
     }
     else if($bindicator == 5) {
     echo "<span class=\"none\">Aumentar Armazém.</span>";
     }
     else if($bindicator == 6) {
     echo "<span class=\"none\">Aumentar Celeiro.</span>";
     }
     else if($bindicator == 7) {
    	$neededtime = $building->calculateAvaliable($id,$bid);
    	echo "<span class=\"none\">Recursos suficientes ".$neededtime[0]." às  ".$neededtime[1]."</span>";
	if($session->goldclub == 1){
?>	</br>
<?php
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime\">Construir com o mestre-construtor </a>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}else{
		echo "<span class=\"none\">Construir com o mestre-construtor</span>";
		echo '<font color="#B3B3B3">(costs: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}
	}
     }
     else if($bindicator == 8) {
	 if($session->access!=BANNED){
     	echo "<a class=\"build\" href=\"dorf2.php?a=$bid&id=$id&c=".$session->checker."\">Construir edifício.</a>";
	 }else{
		echo "<a class=\"build\" href=\"banned.php\">Construir edifício.</a>";
	 }
     }
     else if($bindicator == 9) {
	 if($session->access!=BANNED){
     	echo "<a class=\"build\" href=\"dorf2.php?a=$bid&id=$id&c=".$session->checker."\">Construir edifício. (Fila de espera)</a>";
	 }else{
		echo "<a class=\"build\" href=\"banned.php?a=$bid&id=$id&c=".$session->checker."\">Construir edifício. (Fila de espera)</a>";
	 }
     }
            ?>	
</td>