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
				// criação de unidades de natars por aldeia
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

		$desc = 'Todos os edifícios na área de efeito são mais fortes. Isso significa que você vai precisar de mais catapultas para danificar edifícios protegidos por esses poderes artefatos.';


		$vname = 'Formão de diamante';
		$effect = '(4x)';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 1, 1, 'O pequeno segredo dos arquitetos', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type1.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Martelo de Mármore Gigante';
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
			Artefact($uid, 1, 3, 'O arquiteto único segredo', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type1.gif');
		}

/**
 * MILITARY HASTE
 */


		$desc = 'Todas as tropas na área de efeito se movem mais rapidamente.';

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Ferradura de opala';
		$effect = '(2x)';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 2, 1, 'As ligeiras botas de titã', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type2.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Carruagem de ouro';
		$effect = '(1.5x)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 2, 2, 'As grandes botas de titã', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type2.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Sandálias de Feidípides';
		$effect = '(3x)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 2, 3, 'As únicas botas de titã', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type2.gif');
		}

/**
 * HAWK'S EYESIGHT
 */


		$desc = 'Todos os espiões (Espião [Escoteiros], Batedores [Desbravadores] e Equites Legati) aumentam sua capacidade de espionagem. Além disso, com todas as versões deste artefato você pode ver o tipo de tropas entrantes, mas não quantos há.';

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Conto de um rato';
		$effect = '(5x)';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 3, 1, 'Os olhos de águias pequenos', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type3.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Carta dos generais';
		$effect = '(3x)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 3, 2, 'Os olhos de águias grandes ', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type3.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Diário de Sun Tzu';
		$effect = '(10x)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 3, 3, 'Os olhos de águias único', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type3.gif');
		}

/**
 * THE DIET
 */


		$desc = 'Todas as tropas na gama de artefatos consomem menos trigo, tornando possível manter um exército maior.';

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
		$vname = 'Arco de Caça Sagrado';
		$effect = '(25%)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 4, 2, 'Grande controle de dieta', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type4.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Cálice do Rei Arthurs';
		$effect = '(50%)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 4, 3, 'Controle de dieta único', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type4.gif');
		}


/**
 * ACADEMIC ADVANCEMENT
 */


		$desc = 'As tropas são construídas uma certa percentagem mais rapidamente dentro da área do artefato.';

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
		$vname = 'Declaração de Guerra';
		$effect = '(25%)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 5, 2, 'Os treinadores grande talento', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type5.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Memórias de Alexandre o Grande';
		$effect = '(50%)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 5, 3, 'Os treinadores de talento único', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type5.gif');
		}


/**
 * STORAGE MASTER PLAN
 */


		$desc = 'Com este plano de construção você é capaz de construir o Grande Celeiro ou Grande Armazem na Vila com o artefato, ou toda a conta dependendo do artefato. Contanto que você possui esse artefato você é capaz de construir e ampliar esses edifícios.';

		unset($i);
		unset($vname);
		unset($effect);;
		$vname = 'Esboço de construtores';
		$effect = '';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 6, 1, 'Pequeno plano de armazenamento', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type6.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Tábua da babilônia';
		$effect = '';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 6, 2, 'Grande plano de armazenamento', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type6.gif');
		}


/**
 * RIVAL'S CONFUSION
 */


		$desc = 'A capacidade do esconderijo é aumentada em certa quantidade para cada tipo de artefato. Catapultas só podem atirar aleatoriamente em aldeias dentro deste poder artefatos. As exceções são a WW que sempre pode ser direcionada e a câmara do tesouro que sempre pode ser direcionada, exceto com o artefato único. Ao apontar para um campo de recurso apenas os campos de recursos aleatórios podem ser atingidos, ao apontar para um edifício apenas edifícios aleatórios podem ser atingidos.';

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Mapa da Caverna Escondida';
		$effect = '(200)';
		for($i > 1; $i < 6; $i++) {
			Artefact($uid, 7, 1, 'Confusão ligeira dos rivais', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type7.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Mochila sem fundo';
		$effect = '(100)';
		for($i > 1; $i < 4; $i++) {
			Artefact($uid, 7, 2, 'Grande confusão dos rivais', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type7.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Cavalo de Tróia';
		$effect = '(500)';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 7, 3, 'Confusão única dos rivais', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type7.gif');
		}


/**
 * ARTEFACT OF THE FOOL
 */


		$desc = 'A cada 24 horas, obtém um efeito aleatório, bônus ou penalidade (todos são possíveis com exceção de grande armazém, celeiro e planos de construção WW). Eles mudam de efeito e abrangência a cada 24 horas. O artefato único sempre terá bônus positivos.';

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Pingente de malícia';
		for($i > 1; $i < 5; $i++) {
			Artefact($uid, 8, 1, 'Artefato pequeno do tolo', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type8.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Pingente de malícia';
		for($i > 1; $i < 5; $i++) {
			Artefact($uid, 8, 2, 'Artefato do grande tolo', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type8.gif');
		}

		unset($i);
		unset($vname);
		unset($effect);
		$vname = 'Manuscrito perdido';
		for($i > 1; $i < 1; $i++) {
			Artefact($uid, 8, 3, 'Artefato único do tolo', '' . $vname . '', '' . $desc . '', '' . $effect . '', 'type8.gif');
		}
		$myFile = "Templates/text.tpl";
		$fh = fopen($myFile, 'w') or die("<br/><br/><br/>Can't open file: templates/text.tpl");
		$text = file_get_contents("Templates/text_format.tpl");
		$text = preg_replace("'%TEKST%'","Planos de construção



Inúmeros dias se passaram desde as primeiras batalhas nas muralhas das aldeias amaldiçoadas dos pavorosos Natars, muitos exércitos dos livres e do império Natarian lutaram e morreram diante das muralhas das muitas fortalezas de onde os Natars haviam governado uma vez toda a criação . Agora com a poeira assentada e uma calma relativa se estabelecendo, os exércitos começaram a contar suas perdas e recolher seus mortos, o fedor de combate ainda persistente no ar noturno, um cheiro de uma matança inesquecível em sua extensão e brutalidade, senão por outros ainda. Os maiores exércitos dos libertos e dos Impreadores Natars estavam se preparando para mais um novo ataque contra as antigas fortalezas cobiçadas do Império Natariano.

Logo os escuteiros chegaram dizendo de uma visão mais impressionante e um lembrete arrepiante, um exército temível de um tamanho insondável tinha sido manchado marshalling no fim do mundo, a capital de Natarian, uma força tão grande e imparável que a poeira de sua marcha iria sufocar Fora de toda a luz, uma força tão brutal e implacável que esmagaria toda a esperança. Os povos livres souberam que tiveram que competir agora, a raça contra o tempo e as hordas infinitas do império Natariano para levantar uma maravilha do mundo para restaurar o mundo à paz e para derrotar a ameaça Natariana.

Mas criar uma maravilha tão grande não seria uma tarefa fácil, seria necessário planos de construção criados no passado distante, planos de natureza tão arcana que até os mais sábios dos sábios não conheciam seus conteúdos ou locais.

Dezenas de milhares de escoteiros percorriam toda a existência procurando em vão esses planos místicos, olhando em todos os lugares, exceto a temida Capital Natária, mas não conseguindo encontrá-los. Hoje no entanto, eles retornam com boas notícias, eles retornam descobrindo a localização dos planos, escondidos pelos exércitos dos Natars dentro de fortalezas secretas construídas para ser escondido dos olhos do homem.

Agora começa o trecho final, quando os maiores exércitos do povo Livre e os Natars choque em todo o mundo pelo destino de tudo o que está debaixo do céu. Esta é a guerra que vai ecoar através dos tempos, esta é a sua guerra, e aqui você gravará seu nome através da história, aqui você se tornará lenda.


Fatos:
Para roubar um, as seguintes coisas devem acontecer:
Você deve atacar a aldeia (Não Assaltar!)
Ganhar o ataque
Destruir a tesouraria
Uma tesouraria vazia a nível 10 DEVE estar na aldeia de onde veio esse ataque
Ter um herói em um ataque

Se não, o próximo ataque a essa aldeia, vencendo com um herói e um tesouro vazio levará o plano de construção.

Para construir um WW, você deve possuir um plano você mesmo (você = o proprietário da vila WW) de lvl 0 a 49, de 50 a 100 você precisa de um plano adicional em sua aliança! Dois planos na conta da vila WW não funcionarão!

Os planos de construção são conquistáveis imediatamente quando aparecem para o servidor. 

Haverá uma contagem regressiva no jogo, mostrando a hora exata do lançamento, 5 dias antes do lançamento." ,$text);
		$text = utf8_encode($text);
		fwrite($fh, $text);

			$query="SELECT * FROM ".TB_PREFIX."users ORDER BY id + 0 DESC";
			$result=mysql_query($query) or die (mysql_error());
			for ($i=0; $row=mysql_fetch_row($result); $i++) {
					$updateattquery = mysql_query("UPDATE ".TB_PREFIX."users SET ok = '1' WHERE id = '".$row[0]."'")
					or die(mysql_error());
			}

		echo "Próximo";
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