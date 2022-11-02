<?php
// Temp

$eigen = $database->getCoor($village->wid);

$from = array('x'=>$eigen['x'], 'y'=>$eigen['y']);

$to = array('x'=>$coor['x'], 'y'=>$coor['y']);

      		$artefact = count($database->getOwnUniqueArtefactInfo2($session->uid,2,3,0));
			$artefact1 = count($database->getOwnUniqueArtefactInfo2($village->wid,2,1,1));
			$artefact2 = count($database->getOwnUniqueArtefactInfo2($session->uid,2,2,0));
			if($artefact > 0){
			$fastertroops = 3;
			}else if($artefact1 > 0){
			$fastertroops = 2;
			}else if($artefact2 > 0){
			$fastertroops = 1.5;
			}else{
			$fastertroops = 1;
			}
$time = round($generator->procDistanceTime($from,$to,300,0)/$fastertroops);
$foolartefact = $database->getFoolArtefactInfo(2,$village->wid,$seesion->uid);
if(count($foolartefact) > 0){
foreach($foolartefact as $arte){
if($arte['bad_effect'] == 1){
$time *= $arte['effect2'];
}else{
$time /= $arte['effect2'];
$time = round($time);
}
}
}

// Temp

$ckey= $generator->generateRandStr(6);


 if (!isset($process['t1']) || $process['t1'] == ''){  $t1='0'; }else{  $t1=$process['t1']; }
 if (!isset($process['t2']) || $process['t2'] == ''){  $t2='0'; }else{  $t2=$process['t2']; } 
 if (!isset($process['t3']) || $process['t3'] == ''){  $t3='0'; }else{  $t3=$process['t3']; if ($session->tribe == 3){ $scout=1; } } 
 if (!isset($process['t4']) || $process['t4'] == ''){  $t4='0'; }else{  $t4=$process['t4']; if ($session->tribe == 1 || $session->tribe == 2 || $session->tribe == 4 || $session->tribe == 5){ $scout=1;} } 
 if (!isset($process['t5']) || $process['t5'] == ''){  $t5='0'; }else{  $t5=$process['t5']; } 
 if (!isset($process['t6']) || $process['t6'] == ''){  $t6='0'; }else{  $t6=$process['t6']; } 
 if (!isset($process['t7']) || $process['t7'] == ''){  $t7='0'; }else{  $t7=$process['t7']; } 
 if (!isset($process['t8']) || $process['t8'] == ''){  $t8='0'; }else{  $t8=$process['t8']; } 
 if (!isset($process['t9']) || $process['t9'] == ''){  $t9='0'; }else{  $t9=$process['t9']; } 
 if (!isset($process['t10']) || $process['t10'] == ''){  $t10='0'; }else{  $t10=$process['t10']; } 
 if (!isset($process['t11']) || $process['t11'] == ''){  $t11='0'; }else{  $t11=$process['t11']; $showhero=1;} 
 if ($session->tribe == 3){
 $totalunits =$process['t1']+$process['t2']+$process['t4']+$process['t5']+$process['t6']+$process['t7']+$process['t8']+$process['t9']+$process['t10']+$process['t11'];
 
 }else{
 $totalunits =$process['t1']+$process['t2']+$process['t3']+$process['t5']+$process['t6']+$process['t7']+$process['t8']+$process['t9']+$process['t10']+$process['t11'];
 }
 if ($scout==1 && $totalunits==0) {
if ($process['c'] != 2){
$process['c'] = 1;
}
}
    $id = $database->addA2b($ckey,time(),$process['0'],$t1,$t2,$t3,$t4,$t5,$t6,$t7,$t8,$t9,$t10,$t11,$process['c']);



if ($process['c']==1){

$actionType = "Espiar";

}else if ($process['c']==2){

$actionType = "Reforço";

}elseif ($process['c']==3){

$actionType = "Ataque Normal";

}else{

$actionType = "Assalto";

}

$uid = $session->uid;

$tribe = $session->tribe;
$start = ($tribe-1)*10+1;
$end = ($tribe*10);
?>

<h1><?php echo $actionType." a ".$process[1]; ?></h1>            
<form method="post" action="a2b.php">

            <table id="short_info" cellpadding="1" cellspacing="1">

                <tbody>

                    <tr>

                        <th>Destino:</th>

                        <td><a href="karte.php?d=<?php echo $process[0]; ?>&c=<?php echo $generator->getMapCheck($process[0]); ?>"><?php echo $process[1]; ?> (<?php echo $coor['x']; ?>|<?php echo $coor['y']; ?>)</a></td>

                    </tr>

                    <tr>

                        <th>Proprietário:</th>

                        <td><a href="spieler.php?uid=<?php echo $process['2']; ?>"><?php echo $database->getUserField($process['2'],'username',0); ?></a></td>

                    </tr>

                </tbody>

            </table>



            <table class="troop_details" cellpadding="1" cellspacing="1">

                <thead>

                    <tr>

                        <td><?php echo $process[1]; ?></td>

                        <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>"><?php echo $actionType." a ".$process['1']; ?></td>

                    </tr>

                </thead>

                <tbody class="units">

                    <tr>

                        <td></td>
                 <?php 
                for($i=$start;$i<=($end);$i++) {
                      echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" /></td>";    
                  } if ($process['t11'] != ''){
                  echo "<td><img src=\"img/x.gif\" class=\"unit uhero\" title=\"Hero\" alt=\"Hero\" /></td>";    
                  
                  }?>
                        
                    </tr>

                    <tr>

                        <th>Tropas</th>

                        <td <?php if (!isset($process['t1']) || $process['t1'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t1'];} ?></td>

                        <td <?php if (!isset($process['t2']) || $process['t2'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t2'];} ?></td>

                        <td <?php if (!isset($process['t3']) || $process['t3'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t3'];} ?></td>

                        <td <?php if (!isset($process['t4']) || $process['t4'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t4'];} ?></td>

                        <td <?php if (!isset($process['t5']) || $process['t5'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t5'];} ?></td>

                        <td <?php if (!isset($process['t6']) || $process['t6'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t6'];} ?></td>

                        <td <?php if (!isset($process['t7']) || $process['t7'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t7'];} ?></td>

                        <td <?php if (!isset($process['t8']) || $process['t8'] == ''){ echo "class=\"none\">0"; }else{ $kata='1'; echo ">".$process['t8'];} ?></td>

                        <td <?php if (!isset($process['t9']) || $process['t9'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t9'];} ?></td>

                        <td <?php if (!isset($process['t10']) || $process['t10'] == ''){ echo "class=\"none\">0"; }else{ echo ">".$process['t10'];} ?></td>

                        <?php if (!isset($process['t11']) || $process['t11'] == ''){ echo ""; }else{ echo "<td>".$process['t11']."</td>";} ?>

                     </tr>

                </tbody>
                                         <?php                if ($process['c']==1){

?>
                <tbody class="options">
        <tr>
            <th>Opções</th>
            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>"><input class="radio" name="spy" value="1" checked="checked" type="radio">Espiar recursos e tropas<br>
            <input class="radio" name="spy" value="2" type="radio">Espiar defesas  e tropas                                            </td>
        </tr>
    </tbody>
    <?php } ?>
                

        <?php if(isset($kata) AND $process['c']!='2'){?><tr>

            <?php if($process['c']=='3'){ ?><tbody class="cata">
                <tr>
                    <th>Destino:</th>
                    <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">
                    
                        <select name="ctar1" class="dropdown">
                            <option value="0">Aleatório</option>
                            <?php if($building->getTypeLevel(35) == 0){
							if($building->getTypeLevel(16) >= 5) { ?>
                <optgroup label="Recursos">
                <option value="1">Bosque</option>
                                <option value="2">Poço de barro</option>
                                <option value="3">Mina de ferro</option>
                                <option value="4">Campo de ceral</option>
                                <option value="5">Serraria</option>
                                <option value="6">Alvenaria</option>
                            
                                <option value="7">Fundição</option>
                                <option value="8">Moinho</option>
                                <option value="9">Padaria</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 3) { ?>
                            <optgroup label="Infra-estrutura">
                                <option value="10">Armazém</option>
                                <option value="11">Celeiro</option>
                                <?php if($building->getTypeLevel(16) >= 10) { ?>
                                <option value="15">Edifício Principal</option>
                                <option value="17">Mercado</option>
                                <option value="18">Embaixada</option>
                                <option value="24">Casa do povo</option>
                                <option value="25">Residência</option>
                                <option value="26">Palácio</option>
                                <option value="27">Tesouraria</option>
                                <option value="28">Companhia do Comércio</option>
                                <?php } ?>
                                <option value="38">Grande Armazém</option>
                                <option value="39">Grande Celeiro</option>
                                <option value="40">Maravilha do Mundo</option> 
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 10) { ?>
                            <optgroup label="Militar">
                                <option value="12">Ferreiro</option>
                                <option value="13">Fábrica de Armadura</option>
                                <option value="14">Praça de Torneios</option>
                                <option value="16">Ponto de reunião militar</option>
                                <option value="19">Quartel</option>
                                <option value="20">Cavalaria</option>
                                <option value="21">Oficina</option>
                            
                                <option value="22">Academia</option>
                                <option value="29">Grande Quartel</option>
                                <option value="30">Grande Cavalaria</option>
                                <option value="37">Mansão do Herói</option>
								
								<option value="41">Bebedouro de cavalos</option>
								<option value="42">Grande Oficina</option>
                            </optgroup>
                            <?php } ?>
                        </select>

            <?php if($building->getTypeLevel(16) == 20) { ?>
                     <select name="ctar2" class="dropdown">
                <option value="0">-</option>
                <option value="99">Aleatório</option>
                            <?php if($building->getTypeLevel(16) >= 5) { ?>
                            <optgroup label="Recursos">
                                <option value="1">Bosque</option>
                                <option value="2">Poço de barro</option>
                                <option value="3">Mina de ferro</option>
                                <option value="4">Campo de Cereal</option>
                                <option value="5">Serraria</option>
                                <option value="6">Alvenaria</option>
                            
                                <option value="7">Fundição</option>
                                <option value="8">Moinho</option>
                                <option value="9">Padaria</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 3) { ?>
                            <optgroup label="Infra-estrutura">
                                <option value="10">Armazém</option>
                                <option value="11">Celeiro</option>
                                <?php if($building->getTypeLevel(16) >= 10) { ?>
                                <option value="15">Edifício Principal</option>
                                <option value="17">Mercado</option>
                                <option value="18">Embaixada</option>
                                <option value="24">Casa do povo</option>
                                <option value="25">Residência</option>
                                <option value="26">Palácio</option>
                                
                                <option value="27">Tesouraria</option>
                                <option value="28">Companhia do Comércio</option>
                                <?php } ?>
                                <option value="38">Grande Armazém</option>
                                <option value="39">Grande Celeiro</option>
								<option value="40">Maravilha do Mundo</option>  
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 10) { ?>
                            <optgroup label="Militar">
                                <option value="12">Ferreiro</option>
                                <option value="13">Fábrica de Armadura</option>
                                <option value="14">Praça de Torneios</option>
                                <option value="16">Ponto de reunião militar</option>
                                <option value="19">Quartel</option>
                                <option value="20">Cavalaria</option>
                                <option value="21">Oficina</option>
                                
                                <option value="22">Academia</option>
                                <option value="29">Grande Quartel</option>
                                <option value="30">Grande Cavalaria</option>
                                <option value="37">Mansão do Herói</option>
								
								<option value="41">Bebedouro de cavalos</option>
								<option value="42">Grande Oficina</option>
                            </optgroup>
                            <?php } ?>
                        </select>
                    <?php }?>

                    <span class="info">(Será atacado por catapulta(s))</span>
                     </td>
                </tr>
            </tbody><?PHP  
            }}
            else if($process['c']=='4')
            {
                ?><tbody class="infos">  
                <th>Destino:</th>

            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">
                <?PHP
                
                echo"Atenção: A catapulta <b>SOMENTE</b> atira com um ataque normal (elas não atiram em assalto!)";
                ?>
                </td>

        </tr>
                <?PHP
            }
            ?>

        <?php } ?>



             <tbody class="infos">
    <tr>

   <th>Chegada:</th>

            

            <?php
            $speeds = array();

            $scout = 1;

                //find slowest unit.

                for($i=1;$i<=11;$i++)

                {

                    if (isset($process['t'.$i]))

                    {

                        if( $process['t'.$i] != '' && $process['t'.$i] > 0)

                        {

                            if ($i<11) 
                $speeds[] = ${'u'.(($session->tribe-1)*10+$i)}['speed'];
                else
                {
                //$uid
                $q = "SELECT * FROM ".TB_PREFIX."hero WHERE uid = $uid";
                $result = mysql_query($q);
                $hero_f=mysql_fetch_array($result);
                $hero_unit=$hero_f['unit'];
                $speeds[] = ${'u'.$hero_unit}['speed'];
                }

                            if($i != 4)

                                $scout = 0;

                        }

                        

                    }

                }



            

            if($scout)

                $process['c'] = 1;

            $artefact = count($database->getOwnUniqueArtefactInfo2($session->uid,2,3,0));
			$artefact1 = count($database->getOwnUniqueArtefactInfo2($village->wid,2,1,1));
			$artefact2 = count($database->getOwnUniqueArtefactInfo2($session->uid,2,2,0));
			if($artefact > 0){
			$fastertroops = 3;
			}else if($artefact1 > 0){
			$fastertroops = 2;
			}else if($artefact2 > 0){
			$fastertroops = 1.5;
			}else{
			$fastertroops = 1;
			}
                $time = round($generator->procDistanceTime($from,$to,min($speeds),1)/$fastertroops);
				$foolartefact = $database->getFoolArtefactInfo(2,$village->wid,$seesion->uid);
				if(count($foolartefact) > 0){
				foreach($foolartefact as $arte){
				if($arte['bad_effect'] == 1){
				$time *= $arte['effect2'];
				}else{
				$time /= $arte['effect2'];
				$time = round($time);
				}
				}
				}

            ?>

            

            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">

            <div class="in">em <?php echo $generator->getTimeFormat($time); ?></div>

            <div class="at">ás <span id="tp2"> <?php echo $generator->procMtime(date('U')+$time,9)?></span><span> horas</span></div>

            </td>

        </tr>

    </tbody>

</table>

<input name="timestamp" value="<?php echo time(); ?>" type="hidden"> 

<input name="timestamp_checksum" value="<?php echo $ckey; ?>" type="hidden"> 

<input name="ckey" value="<?php echo $id; ?>" type="hidden"> 

<input name="id" value="39" type="hidden"> 

<input name="a" value="533374" type="hidden">
<input name="c" value="3" type="hidden">

<?php
    if($database->hasBeginnerProtection($process['0'])==1) { 
        echo"<b>Atualmente, o usuário possui proteção para iniciantes</b>";
    } else {
?>
        <p class="btn"><input value="ok" name="s1" id="btn_ok" 

class="dynamic_img " src="img/x.gif" alt="OK" type="image" onclick="if (this.disabled==false) {document.getElementsByTagName('form')[0].submit();} this.disabled=true;" onLoad="this.disabled=false;"></p>

<?php } ?>
</form>
</div>