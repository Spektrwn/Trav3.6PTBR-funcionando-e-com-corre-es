<?php			   
	//gp link
	if($session->gpack == null || GP_ENABLE == false) {
	$gpack= GP_LOCATE;
	} else {
	$gpack= $session->gpack;
	}


  
//de lintjes
/******************************
INDELING CATEGORIEEN:
===============================
== 1. Aanvallers top 10      ==
== 2. Defence top 10         ==
== 3. Klimmers top 10        ==
== 4. Overvallers top 10     ==
== 5. In att en def tegelijk ==
== 6. in top 3 - aanval      ==
== 7. in top 3 - verdediging ==
== 8. in top 3 - klimmers    ==
== 9. in top 3 - overval     ==
******************************/
$geregistreerd=date('d-m-Y', ($allianceinfo['timestamp']));

$profiel = preg_replace("/\[war]/s",'Em guerra com<br>'.$database->getAllianceWar($aid), $profiel, 1); 
$profiel = preg_replace("/\[ally]/s",'Confederações<br>'.$database->getAllianceDipProfile($aid,1), $profiel, 1); 
$profiel = preg_replace("/\[nap]/s",'PñAs<br>'.$database->getAllianceDipProfile($aid,2), $profiel, 1); 
$profiel = preg_replace("/\[diplomatie]/s",'Confederações<br>'.$database->getAllianceDipProfile($aid,1).'<br>PñAs<br>'.$database->getAllianceDipProfile($aid,2).'<br>Em guerra com<br>'.$database->getAllianceWar($aid), $profiel, 1); 


foreach($varmedal as $medal) {

switch ($medal['categorie']) {
    case "1":
        $titel="Atacante da Semana";
		$woord="Pontos";
        break;
    case "2":
        $titel="Defensor da Semana";
 		$woord="Pontos";
       break;
    case "3":
        $titel="Alpinista da Semana(Ranque)";
 		$woord="Ranque";
       break;
    case "4":
        $titel="Ladrão da Semana";
		$woord="Recursos";
        break;
	 case "5":
        $titel="Receber esta medalha mostra que sua aliança estava no top 3 de ambos atacantes e defensores da semana.";
        $bonus[$medal['id']]=1;
		break;
	 case "6":
        $titel="Receber esta medalha mostra que sua aliança estava no top 3 dos atacantes da semana ".$medal['points']." em sequência";
        $bonus[$medal['id']]=1;
		break;
	 case "7":
        $titel="Recebendo sua medalha mostra que sua aliança estava no top 3 dos defensores da semana ".$medal['points']." em sequência";
        $bonus[$medal['id']]=1;
		break;
	 case "8":
        $titel="Receber esta medalha mostra que sua aliança estava entre os 3 melhores escaladores da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
		break;
	 case "9":
        $titel="Receber esta medalha mostra que sua aliança estava no top 3 dos ladrões da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
		break;
    case "11":
        $titel="Receber esta medalha mostra que você estava no top 3 dos escaladores da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;
         case "12":
        $titel="Receber esta medalha mostra que você estava entre os 10 principais atacantes da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;
        case "13":
        $titel="Receber esta medalha mostra que você estava entre os 10 melhores defensores da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;
        case "15":
        $titel="Recebendo esta medalha mostra que você estava no top 10 ladrões da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;
        case "16":
        $titel="Receber esta medalha mostra que você estava entre os 10 melhores escaladores da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;

}

if(isset($bonus[$medal['id']])){
$profiel = preg_replace("/\[#".$medal['id']."]/is",'<img src="'.$gpack.'img/t/'.$medal['img'].'.jpg" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>'.$titel.'<br /><br />Recebido na semana: '.$medal['week'].'</td></tr></table>\')">', $profiel, 1);
} else {
$profiel = preg_replace("/\[#".$medal['id']."]/is",'<img src="'.$gpack.'img/t/'.$medal['img'].'.jpg" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>Categoria:</td><td>'.$titel.'</td></tr><tr><td>Semana:</td><td>'.$medal['week'].'</td></tr><tr><td>Ranque:</td><td>'.$medal['plaats'].'</td></tr><tr><td>'.$woord.':</td><td>'.$medal['points'].'</td></tr></table>\')">', $profiel, 1);
}
}



?>

