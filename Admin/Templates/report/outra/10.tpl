<?php
$dataarray = explode(",",$message->readingNotice['data']);
?>
<table cellpadding="1" cellspacing="1" id="report_surround">
			<thead>
				<tr>
					<th>Assunto:</th>
					<th><?php echo $message->readingNotice['topic']; ?></th>
				</tr>

				<tr>
				<?php
                $date = $generator->procMtime($message->readingNotice['time']); ?>
					<td class="sent">Enviado:</td>
					<td>em <?php echo $date[0]."<span> às ".$date[1]; ?></span> <span>horas</span></td>
				</tr>
			</thead>
			<tbody>
				<tr><td colspan="2" class="empty"></td></tr>
				<tr><td colspan="2" class="report_content">
		<table cellpadding="1" cellspacing="1" id="trade"><thead><tr>
<td>&nbsp;</td>
<td><a href="spieler.php?uid=<?php echo $database->getUserField($dataarray[0],"id",0); ?>"><?php echo $database->getUserField($dataarray[0],"username",0); ?></a> da aldeia <a href="karte.php?d=<?php echo $dataarray[1]."&amp;c=".$generator->getMapCheck($dataarray[1]); ?>"><?php echo $database->getVillageField($dataarray[1],"name"); ?></a></td>
</tr></thead><tbody><tr>
<th>Recursos</th>
<td>
	<img class="r1" src="img/x.gif" alt="Madeira" title="Wood" /><?php echo $dataarray[2]; ?> | 
	<img class="r2" src="img/x.gif" alt="Barro" title="Clay" /><?php echo $dataarray[3]; ?> | 
	<img class="r3" src="img/x.gif" alt="Ferro" title="Iron" /><?php echo $dataarray[4]; ?> | 
	<img class="r4" src="img/x.gif" alt="Cereal" title="Crop" /><?php echo $dataarray[5]; ?>
</td></tr></tbody>

</table></td></tr></tbody></table>
