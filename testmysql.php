<?php
$link = mysql_connect('hostname','dbuser','dbpassword');
if (!$link) {
	die('Não pôde se conectar ao MySQL: ' . mysql_error());
}
echo 'Conexão OK'; mysql_close($link);
?>