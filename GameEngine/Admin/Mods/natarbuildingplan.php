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
		$desc = 'Com este plano de construção antiga você será capaz de construir Maravilha d Mundo até o nível 50. para construir mais, sua aliança deve manter pelo menos dois planos.';
		$database->addArtefact($wid, 3, 11, 1, 'Antigo plano de construção', $desc, '', 'typeww.gif');
}
		$myFile = "../../../Templates/text.tpl";
		$fh = fopen($myFile, 'w') or die("<br/><br/><br/>Não é possível abrir o arquivo: templates/text.tpl");
		$text = file_get_contents("../../../Templates/text_format.tpl");
		$text = preg_replace("'%TEKST%'","Planos de construção da maravilha do mundo


Há muitas luas, as tribos do Travian foram surpreendidas pelo retorno imprevisto dos Natars. Esta tribo de tempos imemoriais superando tudo em sabedoria, poder e glória estava prestes a incomodar os livres novamente. Assim, eles puseram todos os seus esforços na preparação de uma última guerra contra os Natars e em vencê-los para sempre. Muitos pensaram sobre as assim chamadas 'Maravilhas do Mundo', uma construção de muitas lendas, como a única solução. Disseram-lhe que tornaria alguém invencível uma vez completado. Em última análise, tornando os construtores os governantes e conquistadores de todos conhecidos Travian.

No entanto, também foi dito que seria necessário planos de construção para construir um edifício. Devido a este fato, os arquitetos inventaram planos astutos sobre como armazená-los com segurança. Depois de um tempo, podia-se ver edifícios semelhantes a templos em muitas cidades e metrópoles - as Câmeras dos Tesouros (Tesourarias).

Infelizmente, ninguém - nem mesmo o sábio e versado - sabia onde encontrar esses planos de construção. As pessoas mais espertas tentaram localizá-los, mais parecia que eles eram apenas lendas.

Hoje, no entanto, este último segredo será revelado. As privações e esforços do passado não terão sido em vão, como hoje espiões de várias tribos têm obtido com sucesso o paradeiro dos planos de construção. Bem guardados pelos Natars, eles ficam escondidos em vários oásis que podem ser encontrados em Travian. Apenas os heróis mais valentes serão capazes de garantir tal plano e trazê-lo para casa em segurança, para que a construção possa começar.

No final, veremos se as tribos livres do Travian podem mais uma vez ultrapassar os Natars e vencê-los de uma vez por todas. Não seja tão tolo a ponto de assumir que os Natars vão embora sem luta!



Para roubar um conjunto de planos de construção dos Natars, as seguintes coisas devem acontecer:
» Você deve atacar a aldeia (NÃO Assaltar!)
» Você deve ganhar o ataque
» Você deve DESTRUIR a Câmara do Tesouro (Tesouraria)
» Seu herói deve estar no ataque, como ele é o único que pode levar os planos de construção
» Um nível vazio Câmara do Tesouro a nível 10 (Tesouraria) deve estar na aldeia de onde esse ataque veio
NOTA: Se os critérios acima não forem cumpridos durante o ataque, o próximo ataque a essa aldeia que satisfaça os critérios acima tomará os Planos de Construção.



Para construir uma Câmara do Tesouro (Tesouro), você vai precisar de um edifício principal nível 10 e a aldeia não deve ser uma capital ou conter uma maravilha do mundo.

Para construir uma maravilha do mundo, você deve possuir os planos da construção você mesmo (você = o proprietário da aldeia da maravilha do mundo) do nível 0 a 50, e então do nível 51 a 100 você necessitará um plano adicional de plantas da construção em sua aliança! Dois conjuntos de planos de construção na mesma Conta com a Aldeia da Maravilha do Mundo não funcionarão!" ,$text);
		$text = utf8_encode($text);
		fwrite($fh, $text);

			$query="SELECT * FROM ".TB_PREFIX."users ORDER BY id + 0 DESC";
			$result=mysql_query($query) or die (mysql_error());
			for ($i=0; $row=mysql_fetch_row($result); $i++) {
					$updateattquery = mysql_query("UPDATE ".TB_PREFIX."users SET ok = '1' WHERE id = '".$row[0]."'")
					or die(mysql_error());
			}

	mysql_query("Insert into ".TB_PREFIX."admin_log values (0,$id,'Added <b>$amt</b> Aldeias da WW com Plano de Construção',".time().")");


header("Location: ../../../Admin/admin.php?p=natarbuildingplan&g");
?>