<?php

/** --------------------------------------------------- **\
| ********* DO NOT REMOVE THIS COPYRIGHT NOTICE ********* |
+---------------------------------------------------------+
| Credits:     All the developers including the leaders:  |
|              Advocaite & Dzoki & Donnchadh              |
|                                                         |
| Copyright:   TravianX Project All rights reserved       |
\** --------------------------------------------------- **/


		include_once ("GameEngine/Session.php");
		include_once ("GameEngine/config.php");

		mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
		mysql_select_db(SQL_DB);

/**
 * If user is not administrator, access is denied!
 */
		if($session->access < ADMIN){
			die("Access Denied: You are not Admin!");
			}else{

$start = $generator->pageLoadTimeStart();

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title><?php echo SERVER_NAME ?></title>
	<link REL="shortcut icon" HREF="favicon.ico"/>
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="mt-full.js?0faaa" type="text/javascript"></script>
	<script src="unx.js?0faaa" type="text/javascript"></script>
	<script src="new.js?0faaa" type="text/javascript"></script>
	<link href="<?php echo GP_LOCATE; ?>lang/en/compact.css?e21d2" rel="stylesheet" type="text/css" />
	<link href="<?php echo GP_LOCATE; ?>lang/en/lang.css?e21d2" rel="stylesheet" type="text/css" />
	<?php
	if($session->gpack == null || GP_ENABLE == false) {
	echo "
	<link href='".GP_LOCATE."travian.css?e21d2' rel='stylesheet' type='text/css' />
	<link href='".GP_LOCATE."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	} else {
	echo "
	<link href='".$session->gpack."travian.css?e21d2' rel='stylesheet' type='text/css' />
	<link href='".$session->gpack."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	}
	?>
	<script type="text/javascript">
	window.addEvent('domready', start);
	</script>
</head>


<body class="v35 ie ie8">
<div class="wrapper">
<img style="filter:chroma();" src="img/x.gif" id="msfilter" alt="" />
<div id="dynamic_header">
	</div>
<?php include("Templates/header.tpl"); ?>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>
<div id="content"  class="village1">
<?php
/**
 * Functions
 */
if($_POST['password'] != ""){
		function generateBase($kid, $uid, $username) {
			global $database, $message;
			if($kid == 0) {
				$kid = rand(1, 4);
			} else {
				$kid = $_POST['kid'];
			}

			$wid = $database->generateBase($kid);
			$database->setFieldTaken($wid);
			$database->addVillage($wid, $uid, $username, 1);
			$database->addResourceFields($wid, $database->getVillageType($wid));
			$database->addUnits($wid);
			$database->addTech($wid);
			$database->addABTech($wid);
			$database->updateUserField($uid, "access", USER, 1);
			$message->sendWelcome($uid, $username);
		}

/**
 * Creating account & capital village
 */
		$username = "Natars";
		$password = md5($_POST['password']);
		$email = "natars@noreply.com";
		$tribe = 5;
		$desc = "********************
					[#natars]
				********************";

		$q = "INSERT INTO " . TB_PREFIX . "users (id,username,password,access,email,timestamp,tribe,location,act,protect) VALUES (3, '$username', '$password', " . USER . ", '$email', ".time().", $tribe, '', '', 0)";
		mysql_query($q);
		unset($q);
		$uid = $database->getUserField($username, 'id', 1);
		generateBase(0, $uid, $username);
		$wid = mysql_fetch_assoc(mysql_query("SELECT * FROM " . TB_PREFIX . "vdata WHERE owner = $uid"));
		$q = "UPDATE " . TB_PREFIX . "vdata SET pop = 834 WHERE owner = $uid";
		mysql_query($q) or die(mysql_error());
		$q2 = "UPDATE " . TB_PREFIX . "users SET access = 2 WHERE id = $uid";
		mysql_query($q2) or die(mysql_error());
		if(SPEED > 3) {
			$speed = 5;
		} else {
			$speed = SPEED;
		}
		$q3 = "UPDATE " . TB_PREFIX . "units SET u41 = " . (64700 * $speed) . ", u42 = " . (295231 * $speed) . ", u43 = " . (180747 * $speed) . ", u44 = " . (20000 * $speed) . ", u45 = " . (364401 * $speed) . ", u46 = " . (217602 * $speed) . ", u47 = " . (2034 * $speed) . ", u48 = " . (1040 * $speed) . " , u49 = " . (1 * $speed) . ", u50 = " . (9 * $speed) . " WHERE vref = " . $wid['wref'] . "";
		mysql_query($q3) or die(mysql_error());
		$q4 = "UPDATE " . TB_PREFIX . "users SET desc2 = '$desc' WHERE id = $uid";
		mysql_query($q4) or die(mysql_error());


/**
 * SMALL ARTEFACTS
 */
		function Artefact($uid, $type, $size, $art_name, $village_name, $desc, $effect, $img) {
			global $database;
			$kid = rand(1, 4);
			$wid = $database->generateBase($kid);
			$database->addArtefact($wid, $uid, $type, $size, $art_name, $desc, $effect, $img);
			$database->setFieldTaken($wid);
			$database->addVillage($wid, $uid, $village_name, '0');
			$database->addResourceFields($wid, $database->getVillageType($wid));
			$database->addUnits($wid);
			$database->addTech($wid);
			$database->addABTech($wid);
			mysql_query("UPDATE " . TB_PREFIX . "vdata SET pop = 163 WHERE wref = $wid");
			mysql_query("UPDATE " . TB_PREFIX . "vdata SET name = '$village_name' WHERE wref = $wid");
			if(SPEED > 3) {
				$speed = 5*SPEED;
			} else {
				$speed = SPEED;
			}
			if($size == 1) {
				// cria��o de unidades de natars por aldeia
				mysql_query("UPDATE " . TB_PREFIX . "units SET u41 = " . (rand(1000, 2000) * $speed) . ", u42 = " . (rand(1500, 2000) * $speed) . ", u43 = " . (rand(2300, 2800) * $speed) . ", u44 = " . (rand(25, 75) * $speed) . ", u45 = " . (rand(1200, 1900) * $speed) . ", u46 = " . (rand(1500, 2000) * $speed) . ", u47 = " . (rand(500, 900) * $speed) . ", u48 = " . (rand(100, 300) * $speed) . " , u49 = " . (rand(1, 5) * $speed) . ", u50 = " . (rand(1, 5) * $speed) . " WHERE vref = " . $wid . "");
				mysql_query("UPDATE " . TB_PREFIX . "fdata SET f22t = 27, f22 = 10, f28t = 25, f28 = 10, f19t = 23, f19 = 10, f32t = 23, f32 = 10 WHERE vref = $wid");
			} elseif($size == 2) {
				mysql_query("UPDATE " . TB_PREFIX . "units SET u41 = " . (rand(2000, 4000) * $speed) . ", u42 = " . (rand(3000, 4000) * $speed) . ", u43 = " . (rand(4600, 5600) * $speed) . ", u44 = " . (rand(50, 150) * $speed) . ", u45 = " . (rand(2400, 3800) * $speed) . ", u46 = " . (rand(3000, 4000) * $speed) . ", u47 = " . (rand(1000, 1800) * $speed) . ", u48 = " . (rand(200, 600) * $speed) . " , u49 = " . (rand(2, 10) * $speed) . ", u50 = " . (rand(2, 10) * $speed) . " WHERE vref = " . $wid . "");
				//												tesouraria			Residencia			esconderijo
				mysql_query("UPDATE " . TB_PREFIX . "fdata SET f22t = 27, f22 = 10, f28t = 25, f28 = 20, f19t = 23, f19 = 10, f32t = 23, f32 = 10 WHERE vref = $wid");
			} elseif($size == 3) {
				mysql_query("UPDATE " . TB_PREFIX . "units SET u41 = " . (rand(4000, 8000) * $speed) . ", u42 = " . (rand(6000, 8000) * $speed) . ", u43 = " . (rand(9200, 11200) * $speed) . ", u44 = " . (rand(100, 300) * $speed) . ", u45 = " . (rand(4800, 7600) * $speed) . ", u46 = " . (rand(6000, 8000) * $speed) . ", u47 = " . (rand(2000, 3600) * $speed) . ", u48 = " . (rand(400, 1200) * $speed) . " , u49 = " . (rand(4, 20) * $speed) . ", u50 = " . (rand(4, 20) * $speed) . " WHERE vref = " . $wid . "");
				mysql_query("UPDATE " . TB_PREFIX . "fdata SET f22t = 27, f22 = 10, f28t = 25, f28 = 20, f19t = 23, f19 = 10, f32t = 23, f32 = 10 WHERE vref = $wid");
			}
		}

/**
 * THE ARCHITECTS
 */

		$desc = 'Todos os edif�cios na �rea de efeito s�o mais fortes. Isso significa que voc� vai precisar de mais catapultas para danificar edif�cios protegidos por esses poderes artefatos.';


		$vname = 'Form�o de diamante';
		$effect = '(4x)';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 1, 1, 'O pequeno segredo dos arquitetos', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type1.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Martelo de M�rmore Gigante';
		$effect = '(3x)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 1, 2, 'O grande segredo dos arquitetos', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type1.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Pergaminhos de masons';
		$effect = '(5x)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 1, 3, 'O arquiteto �nico segredo', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type1.gif');
		}

/**
 * MILITARY HASTE
 */


		$desc = 'Todas as tropas na �rea de efeito se movem mais rapidamente.';

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Ferradura de opala';
		$effect = '(2x)';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 2, 1, 'As ligeiras botas de tit�', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type2.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Carruagem de ouro';
		$effect = '(1.5x)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 2, 2, 'As grandes botas de tit�', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type2.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Sand�lias de Feid�pides';
		$effect = '(3x)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 2, 3, 'As �nicas botas de tit�', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type2.gif');
		}

/**
 * HAWK'S EYESIGHT
 */


		$desc = 'Todos os espi�es (Espi�o [Escoteiros], Batedores [Desbravadores] e Equites Legati) aumentam sua capacidade de espionagem. Al�m disso, com todas as vers�es deste artefato voc� pode ver o tipo de tropas entrantes, mas n�o quantos h�.';

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Conto de um rato';
		$effect = '(5x)';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 3, 1, 'Os olhos de �guias pequenos', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type3.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Carta dos generais';
		$effect = '(3x)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 3, 2, 'Os olhos de �guias grandes ', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type3.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Di�rio de Sun Tzu';
		$effect = '(10x)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 3, 3, 'Os olhos de �guias �nico', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type3.gif');
		}

/**
 * THE DIET
 */


		$desc = 'Todas as tropas na gama de artefatos consomem menos trigo, tornando poss�vel manter um ex�rcito maior.';

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Bandeja de prata';
		$effect = '(50%)';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 4, 1, 'Leve controle de dieta', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type4.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Arco de Ca�a Sagrado';
		$effect = '(25%)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 4, 2, 'Grande controle de dieta', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type4.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'C�lice do Rei Arthurs';
		$effect = '(50%)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 4, 3, 'Controle de dieta �nico', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type4.gif');
		}


/**
 * ACADEMIC ADVANCEMENT
 */


		$desc = 'As tropas s�o constru�das uma certa percentagem mais rapidamente dentro da �rea do artefato.';

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Juramento dos Soldados Inscritos';
		$effect = '(50%)';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 5, 1, 'Os treinadores ligeiro talento', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type5.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Declara��o de Guerra';
		$effect = '(25%)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 5, 2, 'Os treinadores grande talento', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type5.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Mem�rias de Alexandre o Grande';
		$effect = '(50%)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 5, 3, 'Os treinadores de talento �nico', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type5.gif');
		}


/**
 * STORAGE MASTER PLAN
 */


		$desc = 'Com este plano de constru��o voc� � capaz de construir o Grande Celeiro ou Grande Armazem na Vila com o artefato, ou toda a conta dependendo do artefato. Contanto que voc� possui esse artefato voc� � capaz de construir e ampliar esses edif�cios.';

		unset($i);
		unset($vname);
		unset($effect);;
		$vname = 'Esbo�o de construtores';
		$effect = '';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 6, 1, 'Pequeno plano de armazenamento', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type6.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'T�bua da babil�nia';
		$effect = '';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 6, 2, 'Grande plano de armazenamento', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type6.gif');
		}


/**
 * RIVAL'S CONFUSION
 */


		$desc = 'A capacidade do esconderijo � aumentada em certa quantidade para cada tipo de artefato. Catapultas s� podem atirar aleatoriamente em aldeias dentro deste poder artefatos. As exce��es s�o a WW que sempre pode ser direcionada e a c�mara do tesouro que sempre pode ser direcionada, exceto com o artefato �nico. Ao apontar para um campo de recurso apenas os campos de recursos aleat�rios podem ser atingidos, ao apontar para um edif�cio apenas edif�cios aleat�rios podem ser atingidos.';

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Mapa da Caverna Escondida';
		$effect = '(200)';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 7, 1, 'Confus�o ligeira dos rivais', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type7.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Mochila sem fundo';
		$effect = '(100)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 7, 2, 'Grande confus�o dos rivais', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type7.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Cavalo de Tr�ia';
		$effect = '(500)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 7, 3, 'Confus�o �nica dos rivais', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type7.gif');
		}


/**
 * ARTEFACT OF THE FOOL
 */


		$desc = 'A cada 24 horas, obt�m um efeito aleat�rio, b�nus ou penalidade (todos s�o poss�veis com exce��o de grande armaz�m, celeiro e planos de constru��o WW). Eles mudam de efeito e abrang�ncia a cada 24 horas. O artefato �nico sempre ter� b�nus positivos.';

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Pingente de mal�cia';
		for($i > 1; $i < 5; $i++) {
			Artefact($uid, 8, 1, 'Artefato pequeno do tolo', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type8.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Pingente de mal�cia';
		for($i > 1; $i < 5; $i++) {
			Artefact($uid, 8, 2, 'Artefato do grande tolo', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type8.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Manuscrito perdido';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 8, 3, 'Artefato �nico do tolo', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type8.gif');
		}
		$myFile = "Templates/text.tpl";
		$fh = fopen($myFile, 'w') or die("<br/><br/><br/>Can't open file: templates/text.tpl");
		$text = file_get_contents("Templates/text_format.tpl");
		$text = preg_replace("'%TEKST%'","Planos de constru��o



In�meros dias se passaram desde as primeiras batalhas nas muralhas das aldeias amaldi�oadas dos pavorosos Natars, muitos ex�rcitos dos livres e do imp�rio Natarian lutaram e morreram diante das muralhas das muitas fortalezas de onde os Natars haviam governado uma vez toda a cria��o . Agora com a poeira assentada e uma calma relativa se estabelecendo, os ex�rcitos come�aram a contar suas perdas e recolher seus mortos, o fedor de combate ainda persistente no ar noturno, um cheiro de uma matan�a inesquec�vel em sua extens�o e brutalidade, sen�o por outros ainda. Os maiores ex�rcitos dos libertos e dos Impreadores Natars estavam se preparando para mais um novo ataque contra as antigas fortalezas cobi�adas do Imp�rio Natariano.

Logo os escuteiros chegaram dizendo de uma vis�o mais impressionante e um lembrete arrepiante, um ex�rcito tem�vel de um tamanho insond�vel tinha sido manchado marshalling no fim do mundo, a capital de Natarian, uma for�a t�o grande e impar�vel que a poeira de sua marcha iria sufocar Fora de toda a luz, uma for�a t�o brutal e implac�vel que esmagaria toda a esperan�a. Os povos livres souberam que tiveram que competir agora, a ra�a contra o tempo e as hordas infinitas do imp�rio Natariano para levantar uma maravilha do mundo para restaurar o mundo � paz e para derrotar a amea�a Natariana.

Mas criar uma maravilha t�o grande n�o seria uma tarefa f�cil, seria necess�rio planos de constru��o criados no passado distante, planos de natureza t�o arcana que at� os mais s�bios dos s�bios n�o conheciam seus conte�dos ou locais.

Dezenas de milhares de escoteiros percorriam toda a exist�ncia procurando em v�o esses planos m�sticos, olhando em todos os lugares, exceto a temida Capital Nat�ria, mas n�o conseguindo encontr�-los. Hoje no entanto, eles retornam com boas not�cias, eles retornam descobrindo a localiza��o dos planos, escondidos pelos ex�rcitos dos Natars dentro de fortalezas secretas constru�das para ser escondido dos olhos do homem.

Agora come�a o trecho final, quando os maiores ex�rcitos do povo Livre e os Natars choque em todo o mundo pelo destino de tudo o que est� debaixo do c�u. Esta � a guerra que vai ecoar atrav�s dos tempos, esta � a sua guerra, e aqui voc� gravar� seu nome atrav�s da hist�ria, aqui voc� se tornar� lenda.


Fatos:
Para roubar um, as seguintes coisas devem acontecer:
Voc� deve atacar a aldeia (N�o Assaltar!)
Ganhar o ataque
Destruir a tesouraria
Uma tesouraria vazia a n�vel 10 DEVE estar na aldeia de onde veio esse ataque
Ter um her�i em um ataque

Se n�o, o pr�ximo ataque a essa aldeia, vencendo com um her�i e um tesouro vazio levar� o plano de constru��o.

Para construir um WW, voc� deve possuir um plano voc� mesmo (voc� = o propriet�rio da vila WW) de lvl 0 a 49, de 50 a 100 voc� precisa de um plano adicional em sua alian�a! Dois planos na conta da vila WW n�o funcionar�o!

Os planos de constru��o s�o conquist�veis imediatamente quando aparecem para o servidor. 

Haver� uma contagem regressiva no jogo, mostrando a hora exata do lan�amento, 5 dias antes do lan�amento." ,$text);
		$text = utf8_encode($text);
		fwrite($fh, $text);

			$query="SELECT * FROM ".TB_PREFIX."users ORDER BY id + 0 DESC";
			$result=mysql_query($query) or die (mysql_error());
			for ($i=0; $row=mysql_fetch_row($result); $i++) {
					$updateattquery = mysql_query("UPDATE ".TB_PREFIX."users SET ok = '1' WHERE id = '".$row[0]."'")
					or die(mysql_error());
			}

		echo "Pr�ximo";
}else{
?>
<form action="create_account.php" method="post">

<p>
	<span>Escolha a senha</span>
		<table>
			<tr><td>Senha:</td><td><input type="text" name="password" value=""></td></tr>
		</table>
</p>

	<center>
	<input type="submit" name="Submit" id="Submit" value="Submit"></center>
</form>
<?php } ?>
</div>
</br></br></br></br><div id="side_info">
<?php
include("Templates/multivillage.tpl");
include("Templates/links.tpl");
?>
</div>
<div class="clear"></div>
</div>
<div class="footer-stopper"></div>
<div class="clear"></div>

<?php
include("Templates/res.tpl")
?>
<div id="stime">
<div id="ltime">
<div id="ltimeWrap">
<?php echo CALCULATED_IN;?> <b><?php
echo round(($generator->pageLoadTimeEnd()-$start)*1000);
?></b> ms

<br /><?php echo SEVER_TIME;?> <span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
</div>
	</div>
</div>

<div id="ce"></div>
</body>
</html>
<?php
}
?>