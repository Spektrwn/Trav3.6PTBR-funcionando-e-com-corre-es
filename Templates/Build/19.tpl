<div id="build" class="gid19"><a href="#" onClick="return Popup(19,4);" class="build_logo">
	<img class="building g19" src="img/x.gif" alt="Quartel" title="Quartel" />
</a>
<h1>Quartel <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Todos os soldados de infantaria são treinados no quartel. Quanto maior o nível dos quartéis, mais rapidamente as tropas são treinadas.</p>

<?php if ($building->getTypeLevel(19) > 0) { ?>
<form method="POST" name="snd" action="build.php">
				<input type="hidden" name="id" value="<?php echo $id; ?>" />
				<input type="hidden" name="ft" value="t1" />
				<table cellpadding="1" cellspacing="1" class="build_details">
				<thead><tr>
					<td>Nome</td>
					<td>Quantidade</td>
					<td>Máx</td>
				</tr></thead><tbody>
                <?php
	                include("19_train.tpl");
                ?></table>
	<p><input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="train" onclick="this.disabled=true;this.form.submit();"/></form></p>
    <?php
	} else {
		echo "<b>O treinamento pode começar quando o quartel for concluído.</b><br>\n";
	}
    $trainlist = $technology->getTrainingList(1);
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
				echo "em ".$time[0]." às ";
            }
			echo $time[1];
		} ?>
		</tr><tr class="next"><td colspan="3">A próxima unidade será concluída em <span id="timer2"><?php echo $NextFinished; ?></span></td></tr>
		</tbody></table>
    <?php }
include("upgrade.tpl");
?>
</p></div>
