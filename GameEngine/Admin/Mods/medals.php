<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       medals.php                                                  ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
#################################################################################

include_once("../../Account.php");

mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);

if ($session->access < ADMIN) die("Acesso negado: você não é administrador!");

$medalid = $_POST['medalid'];
$uid = $_POST['uid'];

mysql_query("UPDATE ".TB_PREFIX."medal set del = 1 WHERE id = ".$medalid."");

$name = mysql_query("SELECT name FROM ".TB_PREFIX."users WHERE id= ".$uid."");
$name = mysql_result($name, 0);

mysql_query("Insert into ".TB_PREFIX."admin_log values (0,$admid,'ID da medalha eliminada [#".$medalid."] do usuário <a href=\'admin.php?p=player&uid=$uid\'>$name</a> ',".time().")");


$deleteweek = $_POST['medalweek'];
mysql_query("UPDATE ".TB_PREFIX."medal set del = 1 WHERE week = ".$deleteweek."");

header("Location: ../../../Admin/admin.php?p=player&uid=".$uid."");
?>