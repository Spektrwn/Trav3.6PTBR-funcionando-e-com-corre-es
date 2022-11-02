<?php
include("next.tpl");
?>
<div id="build" class="gid36"><h1>Fábrica de armadilhas <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">
	<a href="#" onClick="return Popup(36,4, 'gid');"
		class="build_logo"> <img
		class="building g36"
		src="img/x.gif" alt="Fábrica de Armadilhas"
		title="Fábrica de Armadilhas" /> </a>
	A fábrica de armadilhas protege sua vila com armadilhas bem escondidas. Isso significa que os inimigos imprudentes podem ser aprisionados e não serão capazes de prejudicar mais sua aldeia. </p>

<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Armadilhas máximas atuais para treinar:</th>

		<td><b><?php echo $bid36[$village->resarray['f'.$id]]['attri']; ?></b> Armadilhas</td>
	</tr>
	<tr>
	<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
		<th>Armadilhas máximas para treinar a nível <?php echo $next; ?>:</th>
		<td><b><?php echo $bid36[$next]['attri']; ?></b> Armadilhas</td>
        <?php
            }else{
		?>
		<th>Armadilhas máximas para treinar no nível 20:</th>
		<td><b><?php echo $bid36[20]['attri']; ?></b> Armadilhas</td>
		<?php
			}
			}
        ?>

	</tr>
</table>
<p>Atualmente, você tem <b><?php echo $village->unitarray['u99']; ?></b> armadilhas, <b><?php echo $village->unitarray['u99o']; ?></b> que estão ocupadas.</p>
<?php if ($building->getTypeLevel(36) > 0) { ?>
<form method="POST" name="snd" action="build.php">
				<input type="hidden" name="id" value="<?php echo $id; ?>" />
				<input type="hidden" name="ft" value="t1" />
<table cellpadding="1" cellspacing="1" class="build_details">
	<thead>

		<tr>
			<td>Nome</td>
			<td>Quantidade</td>
			<td>Máximo</td>
		</tr>
	</thead>
	<tbody>

		<tr>
			<td class="desc">
			<div class="tit"><img class="unit u99" src="img/x.gif"
				alt="Trap"
				title="Trap" /> <a href="#"
				onClick="return Popup(36,4,'gid');">Armadilhas</a> <span class="info">(Disponível: <?php echo $village->unitarray['u99']; ?>)</span>
			</div>
			<div class="details">
			<span><img class="r1" src="img/x.gif"
				alt="Madeira" title="Madeira" />20|</span><span><img class="r2" src="img/x.gif"
				alt="Barro" title="Barro" />30|</span><span><img class="r3" src="img/x.gif"
				alt="Ferro" title="Ferro" />10|</span><span><img class="r4" src="img/x.gif"
				alt="Cereal" title="Cereal" />20|</span><span><img class="r5" src="img/x.gif" alt="Consumo de Cereal"
				title="Consumo de cereal" />0|<img class="clock" src="img/x.gif"
				alt="Duração" title="Duração" /><?php $dur=$generator->getTimeFormat(round(${'u99'}['time'] * ($bid19[$village->resarray['f'.$id]]['attri'] / 100) / SPEED)); 
				echo ($dur=="0:00:00")? "0:00:01":$dur; ?></span>

			</div>
			</td>
			<?php
			$trainlist = $technology->getTrainingList(8);
			foreach($trainlist as $train) {
			$train_amt += $train['amt'];
			}
			
			$max = $technology->maxUnit(99,false);
			$max1 = 0;
			for($i=19;$i<41;$i++){
			if($village->resarray['f'.$i.'t'] == 36){
			$max1 += $bid36[$village->resarray['f'.$i]]['attri'];
			}
			}
			if($max > $max1 - ($village->unitarray['u99'] + $train_amt)){
			$max = $max1 - ($village->unitarray['u99'] + $train_amt);
			}
			if($max < 0){
			$max = 0;
			}
			?>
			<td class="val"><input type="text" class="text" name="t99" value="0" maxlength="4"></td>
			<td class="max"><a href="#" onClick="document.snd.t99.value=<?php echo $max; ?>">(<?php echo $max; ?>)</a></td>
		</tr>
	</tbody>
</table>
	<p><input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="train" onclick="this.disabled=true;this.form.submit();"/></p></form>
	<?php
	} else {
		echo "<b>O treinamento pode começar quando a armadilha estiver completo.</b><br>\n";
	}
    if(count($trainlist) > 0) {
    	echo "
    <table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead><tr>
			<td>Treinando</td>
			<td>Duração</td>
			<td>Finalizado</td>
		</tr></thead>
		<tbody>";
		$TrainCount = 0;
        foreach($trainlist as $train) {
			$TrainCount++;
	        echo "<tr><td class=\"desc\">";
			echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".U99."\" title=\"".U99."\" />";
			echo $train['amt']." ".U99."</td><td class=\"dur\">";
			if ($TrainCount == 1 ) {
				$NextFinished = $generator->getTimeFormat(($train['timestamp']-time())-($train['amt']-1)*$train['eachtime']);
				echo "<span id=timer1>".$generator->getTimeFormat($train['timestamp']-time())."</span>";
			} else {
				echo $generator->getTimeFormat($train['eachtime']*$train['amt']);
			}
			echo "</td><td class=\"fin\">";
			$time = $generator->procMTime($train['timestamp']);
			if($time[0] != "today") {
				echo "on ".$time[0]." at ";
            }
			echo $time[1];
		} ?>
		</tr><tr class="next"><td colspan="3">A próxima unidade será concluída em <span id="timer2"><?php echo $NextFinished; ?></span></td></tr>
		</tbody></table>
    <?php }
include("upgrade.tpl");
?>
</p></div>