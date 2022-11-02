<?php
$bid = $village->resarray['f'.$id.'t'];
$bindicate = $building->canBuild($id,$bid);
if($bindicate == 1) {
	echo "<p><span class=\"none\">Edifício já no nível máximo</span></p>";
} else if($bindicate == 10) {
	echo "<p><span class=\"none\">Em construção do nível máximo</span></p>";
} else if($bindicate == 11) {
	echo "<p><span class=\"none\">Edifício atualmente sendo demolido</span></p>";
} else {
	$loopsame = ($building->isCurrent($id) || $building->isLoop($id))?1:0;
	$doublebuild = ($building->isCurrent($id) && $building->isLoop($id))?1:0;
	$master = count($database->getMasterJobsByField($village->wid,$id));
	$uprequire = $building->resourceRequired($id,$village->resarray['f'.$id.'t'],1+$loopsame+$doublebuild+$master);
	$mastertime = $uprequire['time'];
?>
<p id="contract"><b>Custos</b> atualizar para o nível <?php echo $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master; ?>:<br />
<img class="r1" src="img/x.gif" alt="Madeira" title="Madeira" /><span class="little_res"><?php echo $uprequire['wood']; ?></span> | <img class="r2" src="img/x.gif" alt="Barro" title="Barro" /><span class="little_res"><?php echo $uprequire['clay']; ?></span> | <img class="r3" src="img/x.gif" alt="Ferro" title="Ferro" /><span class="little_res"><?php echo $uprequire['iron']; ?></span> | <img class="r4" src="img/x.gif" alt="Cereal" title="Cereal" /><span class="little_res"><?php echo $uprequire['crop']; ?></span> | <img class="r5" src="img/x.gif" alt="Consumo de cereal" title="Consumo de cereal" /><?php echo $uprequire['pop']; ?> | <img class="clock" src="img/x.gif" alt="duração" title="duração" /><?php echo $generator->getTimeFormat($uprequire['time']); 
if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1) {
    echo "|<a href=\"build.php?gid=17&t=3&r1=".$uprequire['wood']."&r2=".$uprequire['clay']."&r3=".$uprequire['iron']."&r4=".$uprequire['crop']."\" title=\"Comércio NPC\"><img class=\"npc\" src=\"img/x.gif\" alt=\"Comércio NPC\" title=\"Comércio NPC\" /></a>";
                 } ?><br />
<?php
    if($bindicate == 2) {
   		echo "<span class=\"none\">Os trabalhadores já estão construindo.</span>";
	if($session->goldclub == 1){
?>	</br>
<?php
	if($id <= 18) {
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf1.php?master=$bid&id=$id&time=$mastertime\">Construindo com o mestre-construtor </a>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}else{
		echo "<span class=\"none\">Construindo com o mestre-construtor</span>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}
	}else{
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime\">Construindo com o mestre-construtor </a>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="ouro"/>1)</font>';
	}else{
		echo "<span class=\"none\">Construindo com o mestre-construtor</span>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}
	}
	}
    }
    else if($bindicate == 3) {
    	echo "<span class=\"none\">Os trabalhadores já estão construindo. (fila de espera)</span>";
	if($session->goldclub == 1){
?>	</br>
<?php
	if($id <= 18) {
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf1.php?master=$bid&id=$id&time=$mastertime\">Construindo com o mestre-construtor </a>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}else{
		echo "<span class=\"none\">Construindo com o mestre-construtor</span>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}
	}else{
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime\">Construindo com o mestre-construtor </a>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}else{
		echo "<span class=\"none\">Construindo com o mestre-construtor</span>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}
	}
	}
    }
    else if($bindicate == 4) {
    	echo "<span class=\"none\">Não possui cereal suficiente. Expandir campos de cereal.</span>";
    }
    else if($bindicate == 5) {
    	echo "<span class=\"none\">Aumentar Armazém.</span>";
    }
    else if($bindicate == 6) {
    	echo "<span class=\"none\">Aumentar Celeiro.</span>";
    }
    else if($bindicate == 7) {
	if($village->allcrop > 0){
    	$neededtime = $building->calculateAvaliable($id,$village->resarray['f'.$id.'t'],1+$loopsame+$doublebuild+$master);
    	echo "<span class=\"none\">Recursos suficientes ".$neededtime[0]." às  ".$neededtime[1]."</span>";
	}else{
		echo "<span class=\"none\">Sua produção de cereais é negativa, você nunca obterá os recursos necessários.</span>";
	}
	if($session->goldclub == 1){
?>	</br>
<?php
	if($id <= 18) {
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf1.php?master=$bid&id=$id&time=$mastertime\">Construir com o mestre-construtor </a>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}else{
		echo "<span class=\"none\">Construir com o mestre-construtor</span>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}
	}else{
	if($session->gold >= 1 && $village->master == 0){
	    echo "<a class=\"build\" href=\"dorf2.php?master=$bid&id=$id&time=$mastertime\">Construir com o mestre-construtor </a>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}else{
		echo "<span class=\"none\">Construir com o mestre-construtor</span>";
		echo '<font color="#B3B3B3">(custos: <img src="'.GP_LOCATE.'img/a/gold_g.gif" alt="Ouro" title="Ouro"/>1)</font>';
	}
	}
	}
    }
    else if($bindicate == 8) {
		if($session->access==BANNED){
    	echo "<a class=\"build\" href=\"banned.php\">Atualizar para nível ";
		}
		else if($id <= 18) {
    	echo "<a class=\"build\" href=\"dorf1.php?a=$id&c=$session->checker\">Atualizar para nível ";
        }
        else {
        echo "<a class=\"build\" href=\"dorf2.php?a=$id&c=$session->checker\">Atualizar para nível ";
        }
		echo $village->resarray['f'.$id]+1;
		echo ".</a>";
		}
    else if($bindicate == 9) {
		if($session->access==BANNED){
    	echo "<a class=\"build\" href=\"banned.php\">Atualizar para nível ";
		}
    	else if($id <= 18) {
    	echo "<a class=\"build\" href=\"dorf1.php?a=$id&c=$session->checker\">Atualizar para nível ";
        }
        else {
        echo "<a class=\"build\" href=\"dorf2.php?a=$id&c=$session->checker\">Atualizar para nível ";
        }
		echo $village->resarray['f'.$id]+($loopsame > 0 ? 2:1);
		echo ".</a> <span class=\"none\">(fila de espera)</span> ";
    }
}

?>
