<?php
//reinforcement is underattack
$dataarray = explode(",",$message->readingNotice['data']);
if(isset($dataarray[24]) and $dataarray[24]!=0){$colspan="11";}else{$colspan="10";}
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
		<table cellpadding="1" cellspacing="1" class="defender"><thead>
<tr>
<td class="role">Defensor</td>
<td colspan="<?php echo $colspan ?>"><a href="spieler.php?uid=<?php echo $database->getUserField($dataarray[0],"id",0); ?>"><?php echo $database->getUserField($dataarray[0],"username",0); ?></a> da aldeia <a href="karte.php?d=<?php echo $dataarray[1]."&amp;c=".$generator->getMapCheck($dataarray[1]); ?>"><?php echo $database->getVillageField($dataarray[1],"name"); ?></a></td>
</tr>
</thead>
<tbody class="units">
<tr>
<td>&nbsp;</td>
<?php
$tribe = $dataarray[3];
$start = ($tribe-1)*10+1;
for($i=$start;$i<=($start+9);$i++) {
	echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
if(isset($dataarray[24]) and $dataarray[24]!=0){
	echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Hero\" alt=\"Herói\" /></td>";
}
echo "</tr><tr><th>Tropas</th>";
for($i=4;$i<=13;$i++) {
	if($dataarray[$i] == 0) {
    	echo "<td class=\"none\">0</td>";
    }
    else {
    	echo "<td>".$dataarray[$i]."</td>";
    }
}
if(isset($dataarray[24]) and $dataarray[24]!=0){
	echo "<td>$dataarray[24]</td>";
}
echo "<tr><th>Mortes</th>";
for($i=14;$i<=23;$i++) {
	if($dataarray[$i] == 0) {
    	echo "<td class=\"none\">0</td>";
    }
    else {
    	echo "<td>".$dataarray[$i]."</td>";
    }
}
if(isset($dataarray[24]) and $dataarray[24]!=0){
	if ($dataarray[25]==0){$tdclass='class="none"';}
	echo "<td $tdclass>$dataarray[25]</td>";
}
?>
</tr></tbody>
</table>
</td></tr></tbody></table>