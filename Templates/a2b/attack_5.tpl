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
 if (!isset($process['t3']) || $process['t3'] == ''){  $t3='0'; }else{  $t3=$process['t3']; $scout=1; } 
 if (!isset($process['t4']) || $process['t4'] == ''){  $t4='0'; }else{  $t4=$process['t4']; } 
 if (!isset($process['t5']) || $process['t5'] == ''){  $t5='0'; }else{  $t5=$process['t5']; } 
 if (!isset($process['t6']) || $process['t6'] == ''){  $t6='0'; }else{  $t6=$process['t6']; } 
 if (!isset($process['t7']) || $process['t7'] == ''){  $t7='0'; }else{  $t7=$process['t7']; } 
 if (!isset($process['t8']) || $process['t8'] == ''){  $t8='0'; }else{  $t8=$process['t8']; } 
 if (!isset($process['t9']) || $process['t9'] == ''){  $t9='0'; }else{  $t9=$process['t9']; } 
 if (!isset($process['t10']) || $process['t10'] == ''){  $t10='0'; }else{  $t10=$process['t10']; } 
 if (!isset($process['t11']) || $process['t11'] == ''){  $t11='0'; }else{  $t11=$process['t11']; } 
 $totalunits =$process['t1']+$process['t2']+$process['t4']+$process['t5']+$process['t6']+$process['t7']+$process['t8']+$process['t9']+$process['t10']+$process['t11'];
     if ($scout==1 && $totalunits==0) {

$process['c'] = 1;

}  
    $id = $database->addA2b($ckey,time(),$process['0'],$t1,$t2,$t3,$t4,$t5,$t6,$t7,$t8,$t9,$t10,$t11,$process['c']);



if ($process['c']==1){

$actionType = "Espiar";

}else if ($process['c']==2){


$actionType = "Araque normal";

}else{

$actionType = "Assalto";

}

?>

<h1><?php echo $actionType." to ".$process[1]; ?></h1>			

<form method="post" action="a2b.php">

			<table id="short_info" cellpadding="1" cellspacing="1">

				<tbody>

					<tr>

						<th>Destino:</th>

                        <td><a href="karte.php?d=<?php echo $process[0]; ?>&c=<?php echo $generator->getMapCheck($process[0]); ?>"><?php echo $process[1]; ?> (<?php echo $coor['x']; ?>|<?php echo $coor['y']; ?>)</a></td>

					</tr>

					<tr>

						<th>Propriet??rio:</th>

						<td><a href="spieler.php?uid=<?php echo $process['2']; ?>"><?php echo $database->getUserField($process['2'],'username',0); ?></a></td>

					</tr>

				</tbody>

			</table>





			<table class="troop_details" cellpadding="1" cellspacing="1">

				<thead>

					<tr>

						<td><?php echo $process[1]; ?></td>

						<td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>"><?php echo $actionType." to ".$process['1']; ?></td>

					</tr>

				</thead>

				
				<tbody class="units">

					<tr>

						<td></td>

						<td><img src="img/x.gif" class="unit u41" title="Piqueiro" alt="Piqueiro"></td>

                        <td><img src="img/x.gif" class="unit u42" title="Espinhudo" alt="Espinhudo"></td>

                        <td><img src="img/x.gif" class="unit u43" title="Guardi??o" alt="Guardi??o"></td>

                        <td><img src="img/x.gif" class="unit u44" title="Ave de Rapina" alt="Ave de Rapina"></td>

                        <td><img src="img/x.gif" class="unit u45" title="Cavaleiro Negro" alt="Cavaleiro Negro"></td>

                        <td><img src="img/x.gif" class="unit u46" title="Cavaleiro Natar" alt="Cavaleiro Natar"></td>

                        <td><img src="img/x.gif" class="unit u47" title="Elefante de Guerra" alt="Elefante de Guerra"></td>

                        <td><img src="img/x.gif" class="unit u48" title="Balista" alt="Balista"></td>

                        <td><img src="img/x.gif" class="unit u49" title="Imperador Natariano" alt="Imperador Natariano"></td>

                        <td><img src="img/x.gif" class="unit u50" title="Colonizador" alt="Colonizador"></td>

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

                     </tr>

				</tbody>
                                     <?php                if ($process['c']==1){

?>
                <tbody class="options">
        <tr>
            <th>Op????es</th>
            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>"><input class="radio" name="spy" value="1" checked="checked" type="radio">Espiar recursos e tropas<br>
            <input class="radio" name="spy" value="2" type="radio">Espiar Defesas e tropas                                            </td>
        </tr>
    </tbody>
    <?php } ?>
                

        <?php if(isset($kata) AND $process['c']!='2'){?><tr>

            <?php if($process['c']=='3'){ ?><tbody class="cata">
                <tr>
                    <th>Destino:</th>
                    <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">
                    <?php if($building->getTypeLevel(16) == 20) { ?>
                     <select name="ctar2" class="dropdown">
                            <option value="0">Aleat??rio</option>
                            <?php if($building->getTypeLevel(16) >= 5) { ?>
                            <optgroup label="Recursos">
                                <option value="0">Bosque</option>
                                <option value="0">Po??o de Barro</option>
                                <option value="0">Mina de Ferro</option>
                                <option value="0">Campo de Cereal</option>
                                <option value="5">Serraria</option>
                                <option value="6">Alvenaria</option>
                            
                                <option value="7">Fundi????o</option>
                                <option value="8">Moinho</option>
                                <option value="9">Padaria</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 3) { ?>
                            <optgroup label="Infra-estrutura">
                                <option value="10">Armaz??m</option>
                                <option value="11">Celeiro</option>
                                <?php if($building->getTypeLevel(16) >= 10) { ?>
                                <option value="15">Edif??cio Principal</option>
                                <option value="17">Mercado</option>
                                <option value="18">Embaixada</option>
                                <option value="24">Casa do Povo</option>
                                <option value="25">Residencia</option>
                                <option value="26">Pal??cio</option>
                                
                                <option value="27">Tesouraria</option>
                                <option value="28">Companhia do Com??rcio</option>
                                <?php } ?>
                                <option value="38">Grande Armaz??m</option>
                                <option value="39">Grande Celeiro</option>
								<option value="40">Maravilha do Mundo</option> 
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 10) { ?>
                            <optgroup label="Militar">
                                <option value="12">Ferreiro</option>
                                <option value="13">F??brica de Armadura</option>
                                <option value="14">Pra??a de Torneio</option>
                                <option value="16">Ponto de Reuni??o Militar</option>
                                <option value="19">Quartel</option>
                                <option value="20">Cavalaria</option>
                                <option value="21">Oficina</option>
                                
                                <option value="22">Academia</option>
                                <option value="29">Grande Quartel</option>
                                <option value="30">Grande Cavalaria</option>
                                <option value="37">Mans??o do Her??i</option>
								<option value="41">Bebedouro para Cavalos</option>
								<option value="42">Grande Oficina</option>
                            </optgroup>
                            <?php } ?>
                        </select>
                    <?php }?>
                        <select name="ctar1" class="dropdown">
                            <option value="0">Random</option>
                            <?php if($building->getTypeLevel(16) >= 5) { ?>
                            <optgroup label="Resources">
                            <option value="0">Woodcutter</option>
                                <option value="0">Clay Pit</option>
                                <option value="0">Iron Mine</option>
                                <option value="0">Cropland</option>
                                <option value="5">Sawmill</option>
                                <option value="6">Brickyard</option>
                            
                                <option value="7">Iron Foundry</option>
                                <option value="8">Grain Mill</option>
                                <option value="9">Bakery</option>
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 3) { ?>
                            <optgroup label="Infrastructure">
                                <option value="10">Warehouse</option>
                                <option value="11">Granary</option>
                                <?php if($building->getTypeLevel(16) >= 10) { ?>
                                <option value="15">Main building</option>
                                <option value="17">Marketplace</option>
                                <option value="18">Embassy</option>
                                <option value="24">Townhall</option>
                                <option value="25">Residence</option>
                                <option value="26">Palace</option>
                                
                                <option value="27">Treasury</option>
                                <option value="28">Trade office</option>
                                <?php } ?>
                                <option value="38">Great warehouse</option>
                                <option value="39">Great granary</option>
								<option value="40">Wonder of the World</option> 
                            </optgroup>
                            <?php } ?>
                            <?php if($building->getTypeLevel(16) >= 10) { ?>
                            <optgroup label="Military">
                                <option value="12">Blacksmith</option>
                                <option value="13">Armoury</option>
                                <option value="14">Tournament square</option>
                                <option value="16">Rally point</option>
                                <option value="19">Barracks</option>
                                <option value="20">Stable</option>
                                <option value="21">Workshop</option>
                                
                                <option value="22">Academy</option>
                                <option value="29">Great barracks</option>
                                <option value="30">Great stable</option>
                                <option value="37">Hero's mansion</option>
                            </optgroup>
                            <?php } ?>
                        </select>
                    <span class="info">(Ser?? atacado por catapultas))</span>
                     </td>
                </tr>
            </tbody><?PHP  
            }
            else if($process['c']=='4')
            {
                ?><tbody class="infos">  
                <th>Destino:</th>

            <td colspan="<?php if($process['t11'] != ''){ echo"11"; }else{ echo"10"; } ?>">
                <?PHP
                
                echo"Aten????o: A catapulta <b>SOMENTE</b> atira com um ataque normal (elas n??o atiram com assalto!)";
                ?>
                </td>

        </tr>
                <?PHP
            }
            ?>

        <?php } ?>





				<tr>

			<th>Chegada:</th>

			

			<?php

			$att_tribe = 3;

			$start = ($att_tribe == 1)? 1 : (($att_tribe == 2)? 11: 21);

			$end = ($att_tribe == 1)? 10 : (($att_tribe == 2)? 20: 30);
            
			$speeds = array();

			$scout = 1;

				//find slowest unit.

				for($i=1;$i<=10;$i++)

				{

					if (isset($process['t'.$i]))

					{

						if( $process['t'.$i] != '' && $process['t'.$i] > 0)

						{

							$speeds[] = ${'u'.(($session->tribe-5)*10+$i)}['speed'];

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
			
            <div class="at">??s <span id="tp2"> <?php echo $generator->procMtime(date('U')+$time,9)?></span><span> horas</span></div>

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

<p class="btn"><input value="ok" name="s1" id="btn_ok" 

class="dynamic_img " src="img/x.gif" alt="OK" type="image" onclick="if (this.disabled==false) {document.getElementsByTagName('form')[0].submit();} this.disabled=true;" onLoad="this.disabled=false;"></p>


</form>

</div>