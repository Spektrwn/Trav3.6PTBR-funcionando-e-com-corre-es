<?php
$dataarray = explode(",",$message->readingNotice['data']);
if(isset($dataarray[147]) and $dataarray[147] != 0){$colspan="11";}else{$colspan="10";}
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
                    <td>em <?php echo $date[0]."<span> às ".$date[1]; ?></span> <span>horas&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<?php
					$allres = ($dataarray[23]+$dataarray[24]+$dataarray[25]+$dataarray[26]);
    $carry = $dataarray[27];
    
    if ($dataarray[23]+$dataarray[24]+$dataarray[25]+$dataarray[26] == 0) {
    echo "<img title=\"Recompensa: ".$allres." Carregando o máximo de recursos: ".$carry." recursos.\" src=\"gpack/travian_default/img/r/5b.gif\" class=\"Carregamento vazio\">";
    
    } elseif ($dataarray[23]+$dataarray[24]+$dataarray[25]+$dataarray[26] != $dataarray[27]) {
    echo "<img title=\"Recompensa: ".$allres." Carregando o máximo de recursos: ".$carry." recursos.\" src=\"img/un/a/car.gif\" class=\"Carregandmento pela metade\">";
    
    } else {
    echo "<img title=\"Recompensa: ".$allres." Carregando o máximo de recursos: ".$carry." recursos.\" src=\"gpack/travian_default/img/r/4b.gif\" class=\"Carregamento CHEIO\">";
    }?></span></td>
                </tr>
            </thead>
            <tbody>
                <tr><td colspan="2" class="empty"></td></tr>
                <tr><td colspan="2" class="report_content">
        <table cellpadding="1" cellspacing="1" id="attacker"><thead>
<tr>
<td class="role">Atacante</td>
<td colspan="<?php echo $colspan; ?>"><a href="spieler.php?uid=<?php echo $database->getUserField($dataarray[0],"id",0); ?>"><?php echo $database->getUserField($dataarray[0],"username",0); ?></a> da aldeia <a href="karte.php?d=<?php echo $dataarray[1]."&amp;c=".$generator->getMapCheck($dataarray[1]); ?>"><?php echo $database->getVillageField($dataarray[1],"name"); ?></a></td>
</tr>
</thead>
<tbody class="units">
<tr>
<td>&nbsp;</td>
<?php
$tribe = $dataarray[2];
$start = ($tribe-1)*10+1;
for($i=$start;$i<=($start+9);$i++) {
    echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
if (isset($dataarray[147]) and $dataarray[147] != 0){
    echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Herói\" alt=\"Herói\" /></td>";
}
echo "</tr><tr><th>Tropas</th>";
for($i=3;$i<=12;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
if (isset($dataarray[147]) and $dataarray[147] != 0){
    echo "<td>$dataarray[147]</td>";
}
echo "<tr><th>Mortes</th>";
for($i=13;$i<=22;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
if (isset($dataarray[147]) and $dataarray[147] != 0){
    if ($dataarray[148]==0){$tdclass='class="none"';}
    echo "<td $tdclass>$dataarray[148]</td>";
}
if($dataarray[151] != 0 or $dataarray[152] != 0 or $dataarray[153] != 0 or $dataarray[154] != 0 or $dataarray[155] != 0 or $dataarray[156] != 0 or $dataarray[157] != 0 or $dataarray[158] != 0 or $dataarray[159] != 0 or $dataarray[160] != 0){
echo "</tr><tr><th>Prisioneiros</th>";
for($i=151;$i<=160;$i++) {
	if($dataarray[$i] == 0) {
    	echo "<td class=\"none\">0</td>";
    }
    else {
    	echo "<td>".$dataarray[$i]."</td>";
    }
}
if(isset($dataarray[147]) and $dataarray[147]!=0){
	if ($dataarray[161]==0){$tdclass='class="none"';}
	echo "<td $tdclass>$dataarray[161]</td>";
}
}
echo "</tr></tbody>";
if ($dataarray[139]!='' and $dataarray[140]!=''){ //ram
?>
    <tbody class="goods"><tr><th>Informação</th><td colspan="<?php echo $colspan; ?>">
    <img class="unit u<?php echo $dataarray[139]; ?>" src="img/x.gif" alt="Ariete" title="Ariete" />
    <?php echo $dataarray[140]; ?>
    </td></tr></tbody>
<?php } 
if ($dataarray[141]!='' and $dataarray[142]!=''){ //cata
?>
    <tbody class="goods"><tr><th>Informação</th><td colspan="<?php echo $colspan; ?>">
    <img class="unit u<?php echo $dataarray[141]; ?>" src="img/x.gif" alt="Catapulta" title="Catapulta" />
    <?php echo $dataarray[142]; ?>
    </td></tr></tbody>
<?php }
if ($dataarray[143]!='' and $dataarray[144]!=''){ //chief
?>
    <tbody class="goods"><tr><th>Informação</th><td colspan="<?php echo $colspan; ?>">
    <img class="unit u<?php echo $dataarray[143]; ?>" src="img/x.gif" alt="Chefe" title="Chefe" />
    <?php echo $dataarray[144]; ?>
    </td></tr></tbody>
<?php } ?>
<?php if ($dataarray[145]!='' and $dataarray[146]!=''){ //spy
?>
    <tbody class="goods"><tr><th>Informação</th><td colspan="<?php echo $colspan; ?>">
    
    <?php echo $dataarray[146]; ?>
    </td></tr></tbody>
<?php } 
if ($dataarray[162]!='' and $dataarray[162]!=''){ //release prisoners
?>
    <tbody class="goods"><tr><th>Informação</th><td colspan="<?php echo $colspan; ?>">
    
    <?php echo $dataarray[162]; ?>
    </td></tr></tbody>
<?php } ?>
    <tbody class="goods"><tr><th>Recompensa</th><td colspan="<?php echo $colspan; ?>">
    <div class="res"><img class="r1" src="img/x.gif" alt="Madeira" title="Madeira" /><?php echo $dataarray[23]; ?> | <img class="r2" src="img/x.gif" alt="Barro" title="?Barro" /><?php echo $dataarray[24]; ?> | <img class="r3" src="img/x.gif" alt="Ferro" title="Ferro" /><?php echo $dataarray[25]; ?> | <img class="r4" src="img/x.gif" alt="Cereal" title="Cereal" /><?php echo $dataarray[26]; ?></div><div class="carry"><img class="car" src="img/x.gif" alt="carregando" title="carregando" /><?php echo ($dataarray[23]+$dataarray[24]+$dataarray[25]+$dataarray[26])."/".$dataarray[27]; ?></div>
    </td></tr></tbody></table>
    
<?php
$targettribe=$dataarray['31'];


if ($dataarray[34]=='1'){
$start=1; ?>    
    <table cellpadding="1" cellspacing="1" class="defender">
    <thead>
    <tr>
    <td class="role">Defender</th>
    <td colspan="10"><?php if($targettribe=='1'){ echo'<a href="spieler.php?uid='.$database->getUserField($dataarray[28],"id",0).'">'.$database->getUserField($dataarray[28],"username",0).'</a> da aldeia <a href="karte.php?d='.$dataarray[29].'&amp;c='.$generator->getMapCheck($dataarray[29]).'">'.stripslashes($dataarray[30]).'</a>'; } else { echo"Reforço"; } ?></td>
    </tr></thead>
    <tbody class="units">
    <tr>
    <td>&nbsp;</td>
    
    
    <?php
for($i=$start;$i<=($start+9);$i++) {
    echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr><tr><th>Tropas</th>";
for($i=35;$i<=44;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
echo "<tr><th>Mortes</th>";
for($i=45;$i<=54;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
?>
</tr></tbody></table>

<?php } 
if ($dataarray[55]=='1'){ 
$start=11;?>    
    <table cellpadding="1" cellspacing="1" class="defender">
    <thead>
    <tr>
    <td class="role">Defensor</th>
    <td colspan="10"><?php if($targettribe=='2'){ echo'<a href="spieler.php?uid='.$database->getUserField($dataarray[28],"id",0).'">'.$database->getUserField($dataarray[28],"username",0).'</a> da aldeia <a href="karte.php?d='.$dataarray[29].'&amp;c='.$generator->getMapCheck($dataarray[29]).'">'.stripslashes($dataarray[30]).'</a>'; } else { echo"Reforço"; } ?></td>
    </tr></thead>
    <tbody class="units">
    <tr>
    <td>&nbsp;</td>
    
    
<?php
for($i=$start;$i<=($start+9);$i++) {
    echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr><tr><th>Tropas</th>";
for($i=56;$i<=65;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
echo "<tr><th>Mortes</th>";
for($i=66;$i<=75;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
?>
</tr></tbody></table>
<?php } ?>
<?php  if ($dataarray[76]=='1'){
$start=21; ?>    
    <table cellpadding="1" cellspacing="1" class="defender">
    <thead>
    <tr>
    <td class="role">Defensor</th>
    <td colspan="10"><?php if($targettribe=='3'){ echo'<a href="spieler.php?uid='.$database->getUserField($dataarray[28],"id",0).'">'.$database->getUserField($dataarray[28],"username",0).'</a> da aldeia <a href="karte.php?d='.$dataarray[29].'&amp;c='.$generator->getMapCheck($dataarray[29]).'">'.stripslashes($dataarray[30]).'</a>'; } else { echo"Reforço"; } ?></td>
    </tr></thead>
    <tbody class="units">
    <tr>
    <td>&nbsp;</td>
    
    
    <?php
for($i=$start;$i<=($start+9);$i++) {
    echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr><tr><th>Tropas</th>";
for($i=77;$i<=86;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
echo "<tr><th>Mortes</th>";
for($i=87;$i<=96;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
?>
</tr></tbody></table>

<?php }
if($dataarray[98]==1 and $dataarray[31]!=4){
if ($dataarray[97]=='1'){ 
$start=31; ?>    
    <table cellpadding="1" cellspacing="1" class="defender">
    <thead>
    <tr>
    <td class="role">Defensor</th>
    <td colspan="10"><?php if($targettribe=='4'){ echo'<a href="spieler.php?uid='.$database->getUserField($dataarray[28],"id",0).'">'.$database->getUserField($dataarray[28],"username",0).'</a> da aldeia <a href="karte.php?d='.$dataarray[29].'&amp;c='.$generator->getMapCheck($dataarray[29]).'">'.stripslashes($dataarray[30]).'</a>'; } else { echo"Reforço"; } ?></td>
    </tr></thead>
    <tbody class="units">
    <tr>
    <td>&nbsp;</td>
    
    
    <?php
for($i=$start;$i<=($start+9);$i++) {
    echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr><tr><th>Tropas</th>";
for($i=98;$i<=107;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
echo "<tr><th>Mortes</th>";
for($i=118;$i<=127;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
?>
</tr></tbody></table>

<?php } ?>
<?php  if ($dataarray[128]=='1'){
$start=41; ?>    
    <table cellpadding="1" cellspacing="1" class="defender">
    <thead>
    <tr>
    <td class="role">Defensor</th>
    <td colspan="10"><?php if($targettribe=='5'){ echo'<a href="spieler.php?uid='.$database->getUserField($dataarray[28],"id",0).'">'.$database->getUserField($dataarray[28],"username",0).'</a> da aldeia <a href="karte.php?d='.$dataarray[29].'&amp;c='.$generator->getMapCheck($dataarray[29]).'">'.stripslashes($dataarray[30]).'</a>'; } else { echo"Reforço"; } ?></td>
    </tr></thead>
    <tbody class="units">
    <tr>
    <td>&nbsp;</td>
    
    
    <?php
for($i=$start;$i<=($start+9);$i++) {
    echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr><tr><th>Tropas</th>";
for($i=129;$i<=138;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
echo "<tr><th>Mortes</th>";
for($i=139;$i<=148;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
?>
</tr></tbody></table>

<?php }
    }else{
if ($dataarray[97]=='1'){ 
$start=31; ?>    
    <table cellpadding="1" cellspacing="1" class="defender">
    <thead>
    <tr>
    <td class="role">Defensor</th>
    <td colspan="10"><?php if($targettribe=='4'){ echo'<a href="spieler.php?uid='.$database->getUserField($dataarray[28],"id",0).'">'.$database->getUserField($dataarray[28],"username",0).'</a> da aldeia <a href="karte.php?d='.$dataarray[29].'&amp;c='.$generator->getMapCheck($dataarray[29]).'">'.stripslashes($dataarray[30]).'</a>'; } else { echo"Reforço"; } ?></td>
    </tr></thead>
    <tbody class="units">
    <tr>
    <td>&nbsp;</td>
    
    
    <?php
for($i=$start;$i<=($start+9);$i++) {
    echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr><tr><th>Tropas</th>";
for($i=98;$i<=107;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
echo "<tr><th>Mortes</th>";
for($i=108;$i<=117;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
?>
</tr></tbody></table>

<?php } ?>
<?php  if ($dataarray[118]=='1'){
$start=41; ?>    
    <table cellpadding="1" cellspacing="1" class="defender">
    <thead>
    <tr>
    <td class="role">Defensor</th>
    <td colspan="10"><?php if($targettribe=='5'){ echo'<a href="spieler.php?uid='.$database->getUserField($dataarray[28],"id",0).'">'.$database->getUserField($dataarray[28],"username",0).'</a> da aldeia <a href="karte.php?d='.$dataarray[29].'&amp;c='.$generator->getMapCheck($dataarray[29]).'">'.stripslashes($dataarray[30]).'</a>'; } else { echo"Reforço"; } ?></td>
    </tr></thead>
    <tbody class="units">
    <tr>
    <td>&nbsp;</td>
    
    
    <?php
for($i=$start;$i<=($start+9);$i++) {
    echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";
}
echo "</tr><tr><th>Tropas</th>";
for($i=119;$i<=128;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
echo "<tr><th>Mortes</th>";
for($i=129;$i<=138;$i++) {
    if($dataarray[$i] == 0) {
        echo "<td class=\"none\">0</td>";
    }
    else {
        echo "<td>".$dataarray[$i]."</td>";
    }
}
?>
</tr></tbody></table>

<?php }} ?>
</td></tr></tbody></table>