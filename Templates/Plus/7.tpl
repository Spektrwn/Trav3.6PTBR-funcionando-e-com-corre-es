<?php
//////////////     made by alq0rsan MADE BETER BY advocaite   /////////////////////////
if($session->access != BANNED){
    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

    $MyId = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $uuid = mysql_fetch_array($MyId);


    $MyVilId = mysql_query("SELECT * FROM ".TB_PREFIX."bdata WHERE `wid`='".$village->wid."'") or die(mysql_error());
    $uuVilid = mysql_fetch_array($MyVilId);
    $MyVilId2 = mysql_query("SELECT * FROM ".TB_PREFIX."research WHERE `vref`='".$village->wid."'") or die(mysql_error());
    $uuVilid2 = mysql_fetch_array($MyVilId2);


    $goldlog = mysql_query("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());

        $today = date("mdHi");
if($session->sit == 0) {
if (mysql_num_rows($MyGold)) {
    if($golds['6'] > 2) {

if (mysql_num_rows($MyVilId) || mysql_num_rows($MyVilId2)) {

mysql_query("UPDATE ".TB_PREFIX."bdata set timestamp = '1' where wid = ".$village->wid." AND type != '25' OR type != '26'") or die(mysql_error());
mysql_query("UPDATE ".TB_PREFIX."research set timestamp = '1' where vref = '".$village->wid."'") or die(mysql_error());



$done1 = "&nbsp;&nbsp; Todas as construções e pesquisas nesta aldeia foram concluídas";
    mysql_query("UPDATE ".TB_PREFIX."users set gold = ".($session->gold-3)." where `id`='".$session->uid."'") or die(mysql_error());
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'Concluir a construção e pesquisa com ouro')") or die(mysql_error());

} else {
$done1 = "&nbsp;&nbsp; Nada foi Completado";
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'Falha na construção e pesquisa com ouro')") or die(mysql_error());

}
} else {
        $done1 = "&nbsp;&nbsp;Você precisa de mais Ouro";
}
}
}






header("Location: plus.php?id=3");
}else{
header("Location: banned.php");
}
 ?>