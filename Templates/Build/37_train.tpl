<?php
/*============================+
+ Travian File: 37_train.tpl  +
+ Developed by vnnbot.net     +
+=============================*/
			$artefact = count($database->getOwnUniqueArtefactInfo2($session->uid,5,3,0));
			$artefact1 = count($database->getOwnUniqueArtefactInfo2($village->wid,5,1,1));
			$artefact2 = count($database->getOwnUniqueArtefactInfo2($session->uid,5,2,0));
			if($artefact > 0){
			$artefact_bonus = 2;
			$artefact_bonus2 = 1;
			}else if($artefact1 > 0){
			$artefact_bonus = 2;
			$artefact_bonus2 = 1;
			}else if($artefact2 > 0){
			$artefact_bonus = 4;
			$artefact_bonus2 = 3;
			}else{
			$artefact_bonus = 1;
			$artefact_bonus2 = 1;
			}

//check if there is unit needed in the village

$result = mysql_query("SELECT * FROM ".TB_PREFIX."units WHERE `vref` = ".$village->wid."");
$units = mysql_fetch_array($result);

$output="<table cellpadding=1 cellspacing=1 class=\"build_details\">
        <thead>
            <tr>
                <th colspan=2>Treinar novo Herói</th>
            </tr>
        </thead>";
        
if($session->tribe == 1) {
    $output.=" <tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u1\" src=\"img/x.gif\" alt=\"".U1."\" title=\"".U1."\" />
						".U1."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u1['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u1['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u1['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u1['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />";
     $output.=$generator->getTimeFormat(round($u1['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
     $output.="</div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

                
    if($village->awood < $u1['wood'] || $village->aclay < $u1['clay'] || $village->airon < $u1['iron'] || $village->acrop < $u1['crop'])      
        $output.="<span class=\"none\">Recursos insuficientes</span>";    
    elseif($units['u1'] == 0) 
        $output.="<span class=\"none\">Unidades não disponíveis</span>";      
    else $output.="<a href=\"build.php?id=".$id."&train=1\">Treinar</a>";
        
    
    $output.="</center></td>
</tr>";
  
        
    
    if($database->checkIfResearched($village->wid, 't2') != 0){ 
        $output.="<tr>
                    <td class=\"desc\">
        				<div class=\"tit\">
        					<img class=\"unit u2\" src=\"img/x.gif\" alt=\"".U2."\" title=\"".U2."\" />
        					".U2."
        				</div>
        				<div class=\"details\">
        					<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u2['wood']."|
                            <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u2['clay']."|
                            <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u2['iron']."|
                            <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u2['crop']."|
                            <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                            <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />";
        $output.=$generator->getTimeFormat(round($u2['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
        
        $output.="</div>
        				</td>
        				
                        <td class=\"val\" width=\"20%\"><center>";
                        
        if($village->awood < $u2['wood'] OR $village->aclay < $u2['clay'] OR $village->airon < $u2['iron'] OR $village->acrop < $u2['crop']) 
           $output.="<span class=\"none\">Recursos insuficientes</span>"; 
        elseif($units['u2'] == 0)
            $output.="<span class=\"none\">Unidades não disponíveis</span>"; 
        else 
            $output.="<a href=\"build.php?id=".$id."&train=2\">Treinar</a>";
                         
        $output.="</center></td>
                    </tr>";
    } 
        
    if($database->checkIfResearched($village->wid, 't3') != 0){
            
        $output.="<tr>
                        <td class=\"desc\">
        					<div class=\"tit\">
        						<img class=\"unit u3\" src=\"img/x.gif\" alt=\"".U3."\" title=\"".U3."\" />
        						".U3."
        					</div>
        					<div class=\"details\">
        						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u3['wood']."|
                                <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u3['clay']."|
                                <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u3['iron']."|
                                <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u3['crop']."|
                                <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                                <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />";
                                
         $output.=  $generator->getTimeFormat(round($u3['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3);
        
        $output.= "</div>
        				</td>
        				
                        <td class=\"val\" width=\"20%\"><center>";
        
        if($village->awood < $u3['wood'] OR $village->aclay < $u3['clay'] OR $village->airon < $u3['iron'] OR $village->acrop < $u3['crop']) { 
            $output.="<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u3'] == 0){ 
            $output.="<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.="<a href=\"build.php?id=".$id."&train=3\">Treinar</a>";
        }  
                 "</center></td>
                    </tr> " ;     
    }         
    
    if($database->checkIfResearched($village->wid, 't5') != 0){  
        $output.= "<tr>
                    <td class=\"desc\">
    					<div class=\"tit\">
    						<img class=\"unit u5\" src=\"img/x.gif\" alt=\"".U5."\" title=\"".U5."\" />
    						".U5."
    					</div>
    					<div class=\"details\">
    						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u5['wood']."|
                            <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u5['clay']."|
                            <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u5['iron']."|
                            <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u5['crop']."|
                            <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                            <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
    				        $generator->getTimeFormat(round($u5['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                        </div>
    				</td>
    				
                    <td class=\"val\" width=\"20%\"><center>";
        
        if($village->awood < $u5['wood'] OR $village->aclay < $u5['clay'] OR $village->airon < $u5['iron'] OR $village->acrop < $u5['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u5'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=5\">Treinar</a>";
        } 
        $output.="</center></td>
                </tr>";
    }      
    
    if($database->checkIfResearched($village->wid, 't6') != 0){ 
        $output.="<tr>
                    <td class=\"desc\">
    					<div class=\"tit\">
    						<img class=\"unit u6\" src=\"img/x.gif\" alt=\"".U6."\" title=\"".U6."\" />
    						".U6."
    					</div>
    					<div class=\"details\">
    						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u6['wood']."|
                            <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u6['clay']."|
                            <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u6['iron']."|
                            <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u6['crop']."|
                            <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de ceral\" title=\"Consumo de cereal\" />6|
                            <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
    				        $generator->getTimeFormat(round($u6['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                        </div>
    				</td>
    				
                    <td class=\"val\" width=\"20%\"><center>   ";
      
        if($village->awood < $u6['wood'] OR $village->aclay < $u6['clay'] OR $village->airon < $u6['iron'] OR $village->acrop < $u6['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u6'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis/span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=6\">Treinar</a>";
        }  
        
        $output.="</center></td>
                </tr>";
    }    
}    

if($session->tribe == 2) {

$output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u11\" src=\"img/x.gif\" alt=\"".U11."\" title=\"".U11."\" />
						".U11."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u11['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u11['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u11['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u11['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u11['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u11['wood'] OR $village->aclay < $u11['clay'] OR $village->airon < $u11['iron'] OR $village->acrop < $u11['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u11'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=11\">Treinar</a>";
        }  
    $output.="</center></td>
            </tr>";
            
            
    if($database->checkIfResearched($village->wid, 't12') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u12\" src=\"img/x.gif\" alt=\"".U12."\" title=\"".U12."\" />
						".U12."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u12['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u12['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u12['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u12['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de ceral\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u12['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u12['wood'] OR $village->aclay < $u12['clay'] OR $village->airon < $u12['iron'] OR $village->acrop < $u12['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u12'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=12\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }    

  
    if($database->checkIfResearched($village->wid, 't13') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u13\" src=\"img/x.gif\" alt=\"".U13."\" title=\"".U13."\" />
						".U13."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u13['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u13['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u13['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u13['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u13['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u13['wood'] OR $village->aclay < $u13['clay'] OR $village->airon < $u13['iron'] OR $village->acrop < $u13['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u13'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=13\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }   
    
    if($database->checkIfResearched($village->wid, 't15') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u15\" src=\"img/x.gif\" alt=\"".U15."\" title=\"".U15."\" />
						".U15."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u15['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u15['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u15['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u15['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u15['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u15['wood'] OR $village->aclay < $u15['clay'] OR $village->airon < $u15['iron'] OR $village->acrop < $u15['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u15'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=15\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
    
    
    if($database->checkIfResearched($village->wid, 't16') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u16\" src=\"img/x.gif\" alt=\"".U16."\" title=\"".U16."\" />
						".U16."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u16['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u16['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u16['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u16['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u16['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u16['wood'] OR $village->aclay < $u16['clay'] OR $village->airon < $u16['iron'] OR $village->acrop < $u16['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u16'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=16\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
}


if($session->tribe == 3) {

$output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u21\" src=\"img/x.gif\" alt=\"".U21."\" title=\"".U21."\" />
						".U21."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u21['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u21['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u21['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u21['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u21['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u21['wood'] OR $village->aclay < $u21['clay'] OR $village->airon < $u21['iron'] OR $village->acrop < $u21['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u21'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=21\">Treinar</a>";
        }  
    $output.="</center></td>
            </tr>";
            
            
    if($database->checkIfResearched($village->wid, 't22') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u22\" src=\"img/x.gif\" alt=\"".U22."\" title=\"".U22."\" />
						".U22."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u22['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u22['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u22['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u22['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u22['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u22['wood'] OR $village->aclay < $u22['clay'] OR $village->airon < $u22['iron'] OR $village->acrop < $u22['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u22'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=22\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }    

  
    if($database->checkIfResearched($village->wid, 't24') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u24\" src=\"img/x.gif\" alt=\"".U24."\" title=\"".U24."\" />
						".U24."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u24['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u24['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u24['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u24['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u24['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u24['wood'] OR $village->aclay < $u24['clay'] OR $village->airon < $u24['iron'] OR $village->acrop < $u24['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u24'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=24\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }   
    
    if($database->checkIfResearched($village->wid, 't25') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u25\" src=\"img/x.gif\" alt=\"".U25."\" title=\"".U25."\" />
						".U25."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u25['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u25['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u25['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u25['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u25['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u25['wood'] OR $village->aclay < $u25['clay'] OR $village->airon < $u25['iron'] OR $village->acrop < $u25['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u25'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=25\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
    
    
    if($database->checkIfResearched($village->wid, 't26') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u26\" src=\"img/x.gif\" alt=\"".U26."\" title=\"".U26."\" />
						".U26."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u26['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u26['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u26['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u26['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u26['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u26['wood'] OR $village->aclay < $u26['clay'] OR $village->airon < $u26['iron'] OR $village->acrop < $u26['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u26'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=26\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
}

if($session->tribe == 4) {

$output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u31\" src=\"img/x.gif\" alt=\"".U31."\" title=\"".U31."\" />
						".U31."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u31['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u31['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u31['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u31['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u31['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u31['wood'] OR $village->aclay < $u31['clay'] OR $village->airon < $u31['iron'] OR $village->acrop < $u31['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u31'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=31\">Treinar</a>";
        }  
    $output.="</center></td>
            </tr>";
            
            
    if($database->checkIfResearched($village->wid, 't32') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u32\" src=\"img/x.gif\" alt=\"".U32."\" title=\"".U32."\" />
						".U32."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u32['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u32['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u32['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u32['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u32['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u32['wood'] OR $village->aclay < $u32['clay'] OR $village->airon < $u32['iron'] OR $village->acrop < $u32['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u32'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=32\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }    

  
    if($database->checkIfResearched($village->wid, 't34') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u34\" src=\"img/x.gif\" alt=\"".U34."\" title=\"".U34."\" />
						".U34."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u34['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u34['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u34['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u34['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u34['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u34['wood'] OR $village->aclay < $u34['clay'] OR $village->airon < $u34['iron'] OR $village->acrop < $u34['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u34'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=34\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }   
    
    if($database->checkIfResearched($village->wid, 't35') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u35\" src=\"img/x.gif\" alt=\"".U35."\" title=\"".U35."\" />
						".U35."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u35['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u35['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u35['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u35['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u35['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u35['wood'] OR $village->aclay < $u35['clay'] OR $village->airon < $u35['iron'] OR $village->acrop < $u35['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u35'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=35\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
    
    
    if($database->checkIfResearched($village->wid, 't36') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u36\" src=\"img/x.gif\" alt=\"".U36."\" title=\"".U36."\" />
						".U36."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u36['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u36['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u36['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u36['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u36['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u36['wood'] OR $village->aclay < $u36['clay'] OR $village->airon < $u36['iron'] OR $village->acrop < $u36['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u36'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=36\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  

}

if($session->tribe == 5) {

$output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u41\" src=\"img/x.gif\" alt=\"".U41."\" title=\"".U41."\" />
						".U41."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u41['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u41['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u41['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u41['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u41['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u41['wood'] OR $village->aclay < $u41['clay'] OR $village->airon < $u41['iron'] OR $village->acrop < $u41['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u41'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=41\">Treinar</a>";
        }  
    $output.="</center></td>
            </tr>";
            
            
    if($database->checkIfResearched($village->wid, 't42') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u42\" src=\"img/x.gif\" alt=\"".U42."\" title=\"".U42."\" />
						".U42."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u42['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u42['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u42['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u42['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u42['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u42['wood'] OR $village->aclay < $u42['clay'] OR $village->airon < $u42['iron'] OR $village->acrop < $u42['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u42'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=42\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }    

  
    if($database->checkIfResearched($village->wid, 't44') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u44\" src=\"img/x.gif\" alt=\"".U44."\" title=\"".U44."\" />
						".U44."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u44['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u44['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u44['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u44['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u44['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u44['wood'] OR $village->aclay < $u44['clay'] OR $village->airon < $u44['iron'] OR $village->acrop < $u44['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u44'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=44\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }   
    
    if($database->checkIfResearched($village->wid, 't45') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u45\" src=\"img/x.gif\" alt=\"".U45."\" title=\"".U45."\" />
						".U45."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u45['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u45['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u45['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u45['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u45['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u45['wood'] OR $village->aclay < $u45['clay'] OR $village->airon < $u45['iron'] OR $village->acrop < $u45['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u45'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=45\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  
    
    
    if($database->checkIfResearched($village->wid, 't46') != 0){    
        $output.="<tr>
                <td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u46\" src=\"img/x.gif\" alt=\"".U46."\" title=\"".U46."\" />
						".U46."
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$u46['wood']."|
                        <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$u46['clay']."|
                        <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$u46['iron']."|
                        <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$u46['crop']."|
                        <img class=\"r5\" src=\"img/x.gif\" alt=\"Consumo de cereal\" title=\"Consumo de cereal\" />6|
                        <img class=\"clock\" src=\"img/x.gif\" alt=\"Duração\" title=\"Duração\" />".
				        $generator->getTimeFormat(round($u46['time'] / SPEED * $artefact_bonus2 / $artefact_bonus)*3)."
                    </div>
				</td>
				
                <td class=\"val\" width=\"20%\"><center>";

        if($village->awood < $u46['wood'] OR $village->aclay < $u46['clay'] OR $village->airon < $u46['iron'] OR $village->acrop < $u46['crop']) { 
            $output.= "<span class=\"none\">Recursos insuficientes</span>"; 
        }else if($units['u46'] == 0){ 
            $output.= "<span class=\"none\">Unidades não disponíveis</span>"; 
        }else {
            $output.= "<a href=\"build.php?id=".$id."&train=46\">Treinar</a>";
        }  
        $output.="</center></td>
            </tr>";
    }  

}



        //HERO TRAINING
		$count_hero = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "hero WHERE `uid` = " . $session->uid . "")); 
        if($session->tribe == 1){
                if($_GET['train'] == 1){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '1', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u1['time'] / SPEED)*3))."', '50', '1')");
					mysql_query("UPDATE " . TB_PREFIX . "units SET `u1` = `u1` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u1['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u1['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u1['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u1['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 2){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '1', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u1['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u2` = `u2` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u2['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u2['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u2['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u2['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 3){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '3', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u3['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u3` = `u3` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u3['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u3['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u3['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u3['crop']." WHERE `wref` = '" . $village->wid . "'");
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 5){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '5', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u5['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u5` = `u5` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u5['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u5['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u5['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u5['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 6){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '6', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u6['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u6` = `u6` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u6['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u6['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u6['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u6['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
				}
			}
        if($session->tribe == 2){
                if($_GET['train'] == 11){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '11', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u11['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u11` = `u11` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u11['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u11['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u11['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u11['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
                    header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
                }
                if($_GET['train'] == 12){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '12', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u12['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u12` = `u12` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u12['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u12['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u12['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u12['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 13){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '13', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u13['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u13` = `u13` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u13['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u13['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u13['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u13['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 15){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '15', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u15['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u15` = `u15` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u15['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u15['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u15['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u15['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 16){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '16', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u16['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u16` = `u16` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u16['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u16['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u16['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u16['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
            }
        if($session->tribe == 3){
                if($_GET['train'] == 21){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '21', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u21['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u21` = `u21` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u21['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u21['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u21['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u21['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 22){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '22', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u22['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u22` = `u22` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u22['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u22['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u22['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u22['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 24){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '24', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u24['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u24` = `u24` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u24['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u24['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u24['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u24['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 25){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '25', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u25['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u25` = `u25` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u25['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u25['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u25['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u25['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 26){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '26', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u26['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u26` = `u26` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u26['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u26['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u26['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u26['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
			}
//xxxxx

if($session->tribe == 4){
                if($_GET['train'] == 31){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '31', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u31['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u31` = `u31` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u21['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u21['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u21['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u21['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 32){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '32', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u32['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u32` = `u32` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u22['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u22['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u22['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u22['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 34){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '34', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u34['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u34` = `u34` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u24['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u24['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u24['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u24['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 35){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '35', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u35['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u35` = `u35` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u25['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u25['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u25['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u25['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 36){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '36', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u36['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u36` = `u36` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u26['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u26['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u26['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u26['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
			}

if($session->tribe == 5){
                if($_GET['train'] == 41){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '41', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u41['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u41` = `u41` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u21['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u21['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u21['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u21['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 42){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '42', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u42['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u42` = `u42` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u22['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u22['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u22['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u22['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 44){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '44', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u44['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u44` = `u44` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u24['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u24['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u24['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u24['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 45){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '45', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u45['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u45` = `u45` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u25['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u25['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u25['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u25['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
                if($_GET['train'] == 46){
				if($session->access != BANNED){
					mysql_query("DELETE from " . TB_PREFIX . "hero WHERE `dead` = 1 AND `uid` = '" . $session->uid . "'");
					if($count_hero == 0){
					mysql_query("INSERT INTO ".TB_PREFIX."hero (`uid`, `wref`, `regeneration`, `unit`, `name`, `level`, `points`, `experience`, `dead`, `health`, `attack`, `defence`, `attackbonus`, `defencebonus`, `trainingtime`, `autoregen`, `intraining`) VALUES ('".$session->uid."', '" . $village->wid . "', '0', '46', '".addslashes($session->username)."', '0', '10', '0', '0', '100', '0', '0', '0', '0', '".round((time() + ($u46['time'] / SPEED)*3))."', '50', '1')");
                    mysql_query("UPDATE " . TB_PREFIX . "units SET `u46` = `u46` - 1 WHERE `vref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `wood` = `wood` - ".$u26['wood']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `clay` = `clay` - ".$u26['clay']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `iron` = `wood` - ".$u26['iron']." WHERE `wref` = '" . $village->wid . "'");
					mysql_query("UPDATE " . TB_PREFIX . "vdata SET `crop` = `wood` - ".$u26['crop']." WHERE `wref` = '" . $village->wid . "'");
					}
					header("Location: build.php?id=".$id."");
					}else{
					header("Location: banned.php"); 
					}
					}
			}            
        
echo  $output;  

?>
</table>