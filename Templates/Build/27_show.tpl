<?php

    $artefact = $database->getArtefactDetails($_GET['show']);
                    if($artefact['size'] == 1){
                       $reqlvl = 10;
//                       $effect = "Aldeia";
							$size = "Aldeia";
                   }elseif($artefact['size'] == 2 OR $artefact['size'] == 3){
                       $reqlvl = 20;
//                       $effect = "Conta";
							$size = "Conta";
                   }  
                   if ($artefact['conquered'] >= (time()-86400)){
                   $active = "Inativo	"; 
                   }else{
                    $active = "Ativo"; 
                   }
?>
        
       <div class="artefact image-6">
            <table id="art_details" cellpadding="1" cellspacing="1">
                <thead>
                    <tr>
                        <th colspan="2"><?php echo $artefact['name'];?></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2" class="desc">
                            
                            <span class="detail"><?php echo $artefact['desc'];?></span>
                        </td>
                    </tr>
                    <tr>
                        <th>Proprietário</th>
                        <td>
                            <a href="spieler.php?uid=<?php echo $artefact['owner'];?>"><?php echo $database->getUserField($artefact['owner'],"username",0);?></a>
                        </td>
                    </tr>
                    <tr>
                        <th>Aldeia</th>
                        <td>
                            <a href="karte.php?d=<?php echo $artefact['vref'];?>&c=<?php echo $generator->getMapCheck($artefact['vref']);?>"><?php echo $database->getVillageField($artefact['vref'], "name");?> </a>
                        </td>
                    </tr>                                  
                    <tr>
                        <th>Aliança</th>
                        <td><a href="allianz.php?aid=<?php echo $database->getUserField($artefact['owner'],"alliance",0);?>"><?php echo $database->getAllianceName($database->getUserField($artefact['owner'],"alliance",0)); ?></a></td>
                    </tr> 
                    <tr>
                        <th>Área de efeito</th>
                        <td><?php echo $size; ?></td>
                    </tr>
        
                <tr>
                    <th>Bonus</th>
					<td><?php echo $artefact['effect']; ?></td>
                </tr>
               
            <tr>
                <th>Nível requerido</th>
                <td>Tesouraria nível <b><?php echo $reqlvl; ?></b></td>
            </tr>
        
                <tr>
                    <th>Hora da conquista</th>
                    <td><?php echo date("Y-m-d H:i:s",$artefact['conquered']);?></td>
                </tr>
            
                <tr>
                    <th>Status da ativação</th>
                    <td><?php echo $active;?></td>
                </tr>
            </tbody></table>
                <table class="art_details" cellpadding="1" cellspacing="1">
                    <thead>
                        <tr>
                            <th colspan="3">Antigo proprietário (s)</th>
                        </tr>
					<tr>
                            <td>Jogador</td>
                            <td>Aldeia</td>
                            <td>Conquistado</td>
                        </tr>
                    </thead>
                    <tbody>
            
					<tr>
                        <td><span class="none"><a href="spieler.php?uid=<?php echo $artefact['owner'];?>"><?php echo $database->getUserField($artefact['owner'],"username",0);?></a></span></td>
                        <td><span class="none"><a href="karte.php?d=<?php echo $artefact['vref'];?>&c=<?php echo $generator->getMapCheck($artefact['vref']);?>"><?php echo $database->getVillageField($artefact['vref'], "name");?> </a></span></td>
                        <td><span class="none"><?php echo date("Y-m-d H:i:s",$artefact['conquered']);?></span></td> 
                        
                    </tr>
                   
                    </tr></tbody></table></div>