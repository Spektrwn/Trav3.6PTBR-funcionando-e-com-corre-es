<?php

if($_REQUEST["cancel"] == "1") {
if($session->access != BANNED){
	$database->delDemolition($village->wid);
	header("Location: build.php?gid=15&amp;cancel=0&amp;demolish=0");
}else{
header("Location: banned.php"); 
}
}

if(!empty($_REQUEST["demolish"]) && $_REQUEST["c"] == $session->mchecker) {
if($session->access != BANNED){
	if($_REQUEST["type"] != null) 	{
		$type = $_REQUEST['type'];
		$database->addDemolition($village->wid,$type);
		$session->changeChecker();
		header("Location: build.php?gid=15&amp;cancel=0&amp;demolish=0");
	}
}else{
header("Location: banned.php"); 
}
}

if($village->resarray['f'.$id] >= DEMOLISH_LEVEL_REQ) {
	echo "<h2>Demolição do edifício:</h2><p>Se você não precisa mais de um edifício, você pode encomendar a demolição do edifício.</p>";
	$VillageResourceLevels = $database->getResourceLevel($village->wid);
	$DemolitionProgress = $database->getDemolition($village->wid);
	if (!empty($DemolitionProgress)) {
		$Demolition = $DemolitionProgress[0];
		echo "<b>";
		echo "<a href='build.php?id=26&cancel=1'><img src='img/x.gif' class='del' title='cancelar' alt='cancelar'></a> ";
		echo "Demolição de ".$building->procResType($VillageResourceLevels['f'.$Demolition['buildnumber'].'t']).": <span id=timer1>".$generator->getTimeFormat($Demolition['timetofinish']-time())."</span>";
            if($session->gold >= 2) {
			if($session->access!=BANNED){
            ?> <a href="?buildingFinish=1" onclick="return confirm('Acabar todas as ordens de construção e pesquisa nesta vila imediatamente por 2 Ouro?');" title="Acabar todas as ordens de construção e pesquisa nesta vila imediatamente por 2 Ouro?"><img class="clock" alt="Acabar todas as ordens de construção e pesquisa nesta vila imediatamente por 2 Ouro?" src="img/x.gif"/></a>
			<?php
			}else{
            ?> <a href="banned.php" onclick="return confirm('Acabar todas as ordens de construção e pesquisa nesta vila imediatamente por 2 Ouro?');" title="Acabar todas as ordens de construção e pesquisa nesta vila imediatamente por 2 Ouro?"><img class="clock" alt="Acabar todas as ordens de construção e pesquisa nesta vila imediatamente por 2 Ouro?" src="img/x.gif"/></a>
		<?php
			}
            }
		echo "</b>";
	} else {
		echo "
		<form action=\"build.php?gid=15&amp;demolish=1&amp;cancel=0&amp;c=".$session->mchecker."\" method=\"POST\" style=\"display:inline\">
		<select name=\"type\" class=\"dropdown\">";
		for ($i=19; $i<=41; $i++) {
			if ($VillageResourceLevels['f'.$i] >= 1 && !$building->isCurrent($i) && !$building->isLoop($i)) {
				echo "<option value=".$i.">".$i.". ".$building->procResType($VillageResourceLevels['f'.$i.'t'])." (lvl ".$VillageResourceLevels['f'.$i].")</option>";
			}
		}
		echo "</select><input id=\"btn_demolish\" name=\"demolish\" class=\"dynamic_img\" value=\"Demolir\" type=\"image\" src=\"img/x.gif\" alt=\"Demolir\" title=\"Demolir\" /></form>";
	}
}
?>
