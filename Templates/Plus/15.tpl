<?php
//////////////     made by alq0rsan   /////////////////////////
if($session->access != BANNED){
if($session->gold >= 500 && $session->sit == 0 && $session->goldclub == 0) {
mysql_query("UPDATE ".TB_PREFIX."users set goldclub = 1, gold = gold - 500 where `id`='".$session->uid."'");
}
header("Location: plus.php?id=3");

}else{
header("Location: banned.php");
}
 ?>