<?php
//////////////     made by alq0rsan   /////////////////////////
if($session->access != BANNED){
    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

    $MyId = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $uuid = mysql_fetch_array($MyId);


    $MyVilId = mysql_query("SELECT * FROM ".TB_PREFIX."bdata WHERE `wid`='".$village->wid."'") or die(mysql_error());
    $uuVilid = mysql_fetch_array($MyVilId);


    $goldlog = mysql_query("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());

        $today = date("mdHi");
if($session->sit == 0) {
if (mysql_num_rows($MyGold)) {
	if($golds['6'] > 2) {

if (mysql_num_rows($MyGold)) {


if($golds['12'] == 0) {
mysql_query("UPDATE ".TB_PREFIX."users set plus = ('".mktime(date("H"),date("i"), date("s"),date("m") , date("d"), date("Y"))."')+".PLUS_TIME." where `id`='".$session->uid."'") or die(mysql_error());
} else {
mysql_query("UPDATE ".TB_PREFIX."users set plus = '".($golds['12']+PLUS_TIME)."' where `id`='".$session->uid."'") or die(mysql_error());
}


$done1 = "&nbsp;&nbsp;Conta PLUS";
    mysql_query("UPDATE ".TB_PREFIX."users set gold = ".($session->gold-10)." where `id`='".$session->uid."'") or die(mysql_error());
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'Conta PLUS')") or die(mysql_error());

} else {
$done1 = "nadad foi feito";
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'Falhou Conta PLUS')") or die(mysql_error());

}
} else {
		$done1 = "&nbsp;&nbsp;Você precisa de mais ouro";
}
}
}






header("Location: plus.php?id=3");
}else{
header("Location: banned.php");
}
 ?>