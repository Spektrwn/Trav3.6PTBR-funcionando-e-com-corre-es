<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       natarbuildingplan.php                                       ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
include_once("../../config.php");
include_once("../../Session.php");
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);

$id = $_POST['id'];
$amt = $_POST['vill_amount'];

for($i=1;$i<=$amt;$i++) {

		$kid = $_POST['kid'];
		$wid = $database->generateBase($kid);
		$database->setFieldTaken($wid);
		$time = time();
		$q = "insert  into ".TB_PREFIX."vdata (`wref`,`owner`,`name`,`capital`,`pop`,`cp`,`celebration`,`type`,`wood`,`clay`,`iron`,`maxstore`,`crop`,`maxcrop`,`lastupdate`,`loyalty`,`exp1`,`exp2`,`exp3`,`created`) values ('$wid','3','WW Buildingplan',0,0,0,0,0,80000.00,80000.00,80000.00,80000,80000.00,80000,1314974534,100,0,0,0,1314968914)";
		mysql_query($q) or die(mysql_error());
		$q = "insert  into ".TB_PREFIX."fdata (`vref`,`f1`,`f1t`,`f2`,`f2t`,`f3`,`f3t`,`f4`,`f4t`,`f5`,`f5t`,`f6`,`f6t`,`f7`,`f7t`,`f8`,`f8t`,`f9`,`f9t`,`f10`,`f10t`,`f11`,`f11t`,`f12`,`f12t`,`f13`,`f13t`,`f14`,`f14t`,`f15`,`f15t`,`f16`,`f16t`,`f17`,`f17t`,`f18`,`f18t`,`f19`,`f19t`,`f20`,`f20t`,`f21`,`f21t`,`f22`,`f22t`,`f23`,`f23t`,`f24`,`f24t`,`f25`,`f25t`,`f26`,`f26t`,`f27`,`f27t`,`f28`,`f28t`,`f29`,`f29t`,`f30`,`f30t`,`f31`,`f31t`,`f32`,`f32t`,`f33`,`f33t`,`f34`,`f34t`,`f35`,`f35t`,`f36`,`f36t`,`f37`,`f37t`,`f38`,`f38t`,`f39`,`f39t`,`f40`,`f40t`,`f99`,`f99t`,`wwname`) values ($wid,0,1,0,4,0,1,0,3,0,2,0,2,0,3,0,4,0,4,0,3,0,3,0,4,0,4,0,1,0,4,0,2,0,1,0,2,20,17,20,11,10,27,20,10,10,22,10,25,0,0,20,15,10,19,0,0,0,0,0,0,10,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,16,0,0,0,0,'Maravilha do Mundo')";
		mysql_query($q);
		$pop = $automation->recountPop($wid);
		$cp = $automation->recountPop($wid);
		$database->addUnits($wid);
		$database->addTech($wid);
		$database->addABTech($wid);
		$q = "UPDATE ".TB_PREFIX."units SET u41 = u41 + '150000', u42 = u42 + '150000', u43 = u43 + '150000', u44 = u44 + '150000', u45 = u45 + '150000', u46 = u46 + '150000', u47 = u47 + '150000', u48 = u48 + '150000' , u49 = u49 + '150000', u50 = u50 + '150000' WHERE vref = '".$wid."'";
		mysql_query($q);
		$desc = 'Com este plano de constru��o antiga voc� ser� capaz de construir Maravilha d Mundo at� o n�vel 50. para construir mais, sua alian�a deve manter pelo menos dois planos.';
		$database->addArtefact($wid, 3, 11, 1, 'Antigo plano de constru��o', $desc, '', 'typeww.gif');
}
		$myFile = "../../../Templates/text.tpl";
		$fh = fopen($myFile, 'w') or die("<br/><br/><br/>N�o � poss�vel abrir o arquivo: templates/text.tpl");
		$text = file_get_contents("../../../Templates/text_format.tpl");
		$text = preg_replace("'%TEKST%'","Planos de constru��o da maravilha do mundo


H� muitas luas, as tribos do Travian foram surpreendidas pelo retorno imprevisto dos Natars. Esta tribo de tempos imemoriais superando tudo em sabedoria, poder e gl�ria estava prestes a incomodar os livres novamente. Assim, eles puseram todos os seus esfor�os na prepara��o de uma �ltima guerra contra os Natars e em venc�-los para sempre. Muitos pensaram sobre as assim chamadas 'Maravilhas do Mundo', uma constru��o de muitas lendas, como a �nica solu��o. Disseram-lhe que tornaria algu�m invenc�vel uma vez completado. Em �ltima an�lise, tornando os construtores os governantes e conquistadores de todos conhecidos Travian.

No entanto, tamb�m foi dito que seria necess�rio planos de constru��o para construir um edif�cio. Devido a este fato, os arquitetos inventaram planos astutos sobre como armazen�-los com seguran�a. Depois de um tempo, podia-se ver edif�cios semelhantes a templos em muitas cidades e metr�poles - as C�meras dos Tesouros (Tesourarias).

Infelizmente, ningu�m - nem mesmo o s�bio e versado - sabia onde encontrar esses planos de constru��o. As pessoas mais espertas tentaram localiz�-los, mais parecia que eles eram apenas lendas.

Hoje, no entanto, este �ltimo segredo ser� revelado. As priva��es e esfor�os do passado n�o ter�o sido em v�o, como hoje espi�es de v�rias tribos t�m obtido com sucesso o paradeiro dos planos de constru��o. Bem guardados pelos Natars, eles ficam escondidos em v�rios o�sis que podem ser encontrados em Travian. Apenas os her�is mais valentes ser�o capazes de garantir tal plano e traz�-lo para casa em seguran�a, para que a constru��o possa come�ar.

No final, veremos se as tribos livres do Travian podem mais uma vez ultrapassar os Natars e venc�-los de uma vez por todas. N�o seja t�o tolo a ponto de assumir que os Natars v�o embora sem luta!



Para roubar um conjunto de planos de constru��o dos Natars, as seguintes coisas devem acontecer:
� Voc� deve atacar a aldeia (N�O Assaltar!)
� Voc� deve ganhar o ataque
� Voc� deve DESTRUIR a C�mara do Tesouro (Tesouraria)
� Seu her�i deve estar no ataque, como ele � o �nico que pode levar os planos de constru��o
� Um n�vel vazio C�mara do Tesouro a n�vel 10 (Tesouraria) deve estar na aldeia de onde esse ataque veio
NOTA: Se os crit�rios acima n�o forem cumpridos durante o ataque, o pr�ximo ataque a essa aldeia que satisfa�a os crit�rios acima tomar� os Planos de Constru��o.



Para construir uma C�mara do Tesouro (Tesouro), voc� vai precisar de um edif�cio principal n�vel 10 e a aldeia n�o deve ser uma capital ou conter uma maravilha do mundo.

Para construir uma maravilha do mundo, voc� deve possuir os planos da constru��o voc� mesmo (voc� = o propriet�rio da aldeia da maravilha do mundo) do n�vel 0 a 50, e ent�o do n�vel 51 a 100 voc� necessitar� um plano adicional de plantas da constru��o em sua alian�a! Dois conjuntos de planos de constru��o na mesma Conta com a Aldeia da Maravilha do Mundo n�o funcionar�o!" ,$text);
		$text = utf8_encode($text);
		fwrite($fh, $text);

			$query="SELECT * FROM ".TB_PREFIX."users ORDER BY id + 0 DESC";
			$result=mysql_query($query) or die (mysql_error());
			for ($i=0; $row=mysql_fetch_row($result); $i++) {
					$updateattquery = mysql_query("UPDATE ".TB_PREFIX."users SET ok = '1' WHERE id = '".$row[0]."'")
					or die(mysql_error());
			}

	mysql_query("Insert into ".TB_PREFIX."admin_log values (0,$id,'Added <b>$amt</b> Aldeias da WW com Plano de Constru��o',".time().")");


header("Location: ../../../Admin/admin.php?p=natarbuildingplan&g");
?>