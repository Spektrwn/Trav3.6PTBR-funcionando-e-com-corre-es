<?php			   
	//gp link
	if($session->gpack == null || GP_ENABLE == false) {
	$gpack= GP_LOCATE;
	} else {
	$gpack= $session->gpack;
	}

	
//de bird
if($displayarray['protect'] > time()){
$secondsDiff = $displayarray['protect'] - time();
$remainingDay     = floor($secondsDiff/60/60/24);
$remainingHour    = floor(($secondsDiff-($remainingDay*60*60))/3600);
$remainingMinutes = floor(($secondsDiff-($remainingDay*60*60)-($remainingHour*60*60))/60);
$remainingSeconds = floor(($secondsDiff-($remainingDay*60*60)-($remainingHour*60*60))-($remainingMinutes*60));
if(strlen($remainingSeconds) <= 1){
$nul1 = "0";}
if(strlen($remainingMinutes) <= 1){
$nul2 = "0";} 
if(strlen($remainingHour) <= 1){ $nul3 = "0"; } 
$left="$nul3$remainingHour:$nul2$remainingMinutes:$nul1$remainingSeconds";
$profiel = preg_replace("/\[#0]/is",'<img src="'.$gpack.'img/t/tn.gif" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>Este leitor tem '.$left.' Horas de proteção iniciantes restante.</td></tr></table>\')">', $profiel, 1);
} else {
$geregistreerd=date('d-m-Y', ($displayarray['regtime']));
$profiel = preg_replace("/\[#0]/is",'<img src="'.$gpack.'img/t/tnd.gif" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>Este jogador registou a sua conta '.$geregistreerd.'.</td></tr></table>\')">', $profiel, 1);
}

//natar image
if($displayarray['username'] == "Natars"){
$profiel = preg_replace("/\[#natars]/is",'<img src="'.$gpack.'img/t/t10_2.jpg" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>Conta Natar oficial</td></tr></table>\')">', $profiel, 1);
$profiel = preg_replace("/\[#WW]/is",'<img src="'.$gpack.'img/t/g40_11-ltr.png" width="250" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>Aldeia da maravilha do mundo oficial</td></tr></table>\')">', $profiel, 1);
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

foreach($varmedal as $medal) {

switch ($medal['categorie']) {
    case "1":
        $titel="Atacantes da semana";
		$woord="Pontos";
        break;
    case "2":
        $titel="Defensor da semana";
 		$woord="Pontos";
       break;
    case "3":
        $titel="Alpinista da semana";
 		$woord="População";
       break;
    case "4":
        $titel="Ladrão da semana";
		$woord="Recursos";
        break;
	 case "5":
        $titel="Receber esta medalha mostra que você está no top 10 de ambos ataque e defensa da semana.";
        $bonus[$medal['id']]=1;
		break;
	 case "6":
        $titel="Receber esta medalha mostra que você estava no top 3 atacantes da semana ".$medal['points']." em sequência";
        $bonus[$medal['id']]=1;
		break;
	 case "7":
        $titel="Receber esta medalha mostra que você estava no top 3 defensor da semana ".$medal['points']." em sequência";
        $bonus[$medal['id']]=1;
		break;
	 case "8":
        $titel="Receber esta medalha mostra que você estava no top 3 Pop alpinista da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
		break;
	 case "9":
        $titel="Receber esta medalha mostra que você estava no top 3 ladrões da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
		break;
     case "10":
        $titel="Alpinistas da semana.";
        $woord="Ranks"; 
        break;
         case "11":
        $titel="Receber esta medalha mostra que você estava no top 3 do aplinista da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;
         case "12":
        $titel="Receber esta medalha mostra que você estava entre os 10 maiores atacantes da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;
        case "13":
        $titel="Receber esta medalha mostra que você estava entre os 10 melhores defensores da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;
        case "14":
        $titel="Receber esta medalha mostra que você estava entre os 10 melhores alpinistas da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;
        case "15":
        $titel="Receber esta medalha mostra que você estava no top 10 ladrões da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;
        case "16":
        $titel="Receber esta medalha mostra que você estava no top 10 alpinistas da semana ".$medal['points']." em sequência.";
        $bonus[$medal['id']]=1;
        break;
        

}

if(isset($bonus[$medal['id']])){
$profiel = preg_replace("/\[#".$medal['id']."]/is",'<img src="'.$gpack.'img/t/'.$medal['img'].'.jpg" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>'.$titel.'<br /><br />Recebida na semana: '.$medal['week'].'</td></tr></table>\')">', $profiel, 1);
} else {
$profiel = preg_replace("/\[#".$medal['id']."]/is",'<img src="'.$gpack.'img/t/'.$medal['img'].'.jpg" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>Categoria:</td><td>'.$titel.'</td></tr><tr><td>Semana:</td><td>'.$medal['week'].'</td></tr><tr><td>Posição:</td><td>'.$medal['plaats'].'</td></tr><tr><td>'.$woord.':</td><td>'.$medal['points'].'</td></tr></table>\')">', $profiel, 1);
}
}



?>

