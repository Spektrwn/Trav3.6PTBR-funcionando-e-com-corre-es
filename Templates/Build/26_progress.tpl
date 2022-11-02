 <?php
    $trainlist = $technology->getTrainingList(4);
    if(count($trainlist) > 0) {
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
?>
