<?php 
if(isset($_GET['del']) && is_numeric($_GET['del'])){
	$database->removeLinks($_GET['del'],$session->uid);
	header("Location: spieler.php?s=2");
}
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       links.tpl                                                   ##
##  Developed by:  Slim, Manuel Mannhardt < manuel_mannhardt@web.de >          ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

// Save new link or just edit a link
if($_POST) {
    $links = array();
    
    // let's do some complicated code x'D
    foreach($_POST as $key => $value) {
	if(substr($key, 0, 2) == 'nr') {
	    $i = substr($key, 2);
	    $links[$i]['nr'] = mysql_real_escape_string($value);
	}
	
	if(substr($key, 0, 2) == 'id') {
	    $i = substr($key, 2);
	    $links[$i]['id'] = mysql_real_escape_string($value);
	}
	
	if(substr($key, 0, 8) == 'linkname') {
	    $i = substr($key, 8);
	    $links[$i]['linkname'] = mysql_real_escape_string($value);
	}
	
	if(substr($key, 0, 8) == 'linkziel') {
	    $i = substr($key, 8);
	    $links[$i]['linkziel'] = mysql_real_escape_string($value);
	}
    }
    
    // Save
    foreach($links as $link) {
	settype($link['nr'], 'int');
	
	if(trim($link['nr']) != '' AND trim($link['linkname']) != '' AND trim($link['linkziel']) != '' AND trim($link['id']) == '') {
	    // Add new link
	    $userid = $session->uid;
	    if($session->access!=BANNED){
	    $query = mysql_query('INSERT INTO `' . TB_PREFIX . 'links` (`userid`, `name`, `url`, `pos`) VALUES (' . $userid . ', \'' . $link['linkname'] . '\', \'' . $link['linkziel'] . '\', ' . $link['nr'] . ')');
		}else{
		header("Location: banned.php");
		}
		} elseif(trim($link['nr']) != '' AND trim($link['linkname']) != '' AND trim($link['linkziel']) != '' AND trim($link['id']) != '') {
	    // Update link
	    $query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'links` WHERE `id` = ' . $link['id']);
	    $data = mysql_fetch_assoc($query);
	    
	    // May the user update this entry?
	    if($data['userid'] == $session->uid) {
		$query2 = mysql_query('UPDATE `' . TB_PREFIX . 'links` SET `name` = \'' . $link['linkname'] . '\', `url` = \'' . $link['linkziel'] . '\', `pos` = ' . $link['nr'] . ' WHERE `id` = ' . $link['id']);
	    }
	} elseif(trim($link['nr']) == '' AND trim($link['linkname']) == '' AND trim($link['linkziel']) == '' AND trim($link['id']) != '') {
	    // Delete entry
	    $query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'links` WHERE `id` = ' . $link['id']);
	    $data = mysql_fetch_assoc($query);
	    
	    // May the user delete this entry?
	    if($data['userid'] == $session->uid) {
		$query2 = mysql_query('DELETE FROM `' . TB_PREFIX . 'links` WHERE `id` = ' . $link['id']);
	    }
	}
    }
    
    print '<meta http-equiv="refresh" content="0">';
}


// Fetch all links
$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'links` WHERE `userid` = ' . $session->uid . ' ORDER BY `pos` ASC') or die(mysql_error());
$links = array();
while($data = mysql_fetch_assoc($query)) {
    $links[] = $data;
}
?>

<h1>Perfil do jogador</h1>

<?php include("menu.tpl"); ?>
<form action="spieler.php?s=2" method="POST">
  <input type="hidden" name="ft" value="p2">
  <input type="hidden" name="uid" value="<?php echo $session->uid; ?>" />
  <table cellpadding="1" cellspacing="1" id="links">
    <thead>
      <tr>
	<th colspan="4">Atalhos diretos</th>
      </tr>
      <tr>
	<td>Apagar</td>
	<td>No.</td>
	<td>Nome do atalho</td>
	<td>Alvo do atalho</td>
      </tr>
    </thead>      
    <tbody>
	  <?php $i = 0; foreach($links as $link): ?>
      <tr>
	  <td>
	  <a href="spieler.php?del=<?php echo $link['id']; ?>&s=2"><img class="del" src="img/x.gif" alt="apagar" title="apagar"></a>
	  </td>
	 <td class="nr"><input <?php if(!$session->plus){echo"disabled";} ?> class="text" type="text" name="nr<?php print $i; ?>" value="<?php print $link['pos']; ?>" size="1" maxlength="3" /><input type="hidden" name="id<?php print $i; ?>" value="<?php print $link['id']; ?>" /></td>
	 <td class="nam"><input <?php if(!$session->plus){echo"disabled";} ?> class="text" type="text" name="linkname<?php print $i; ?>" value="<?php print $link['name']; ?>" maxlength="30" /></td>
	 <td class="link"><input <?php if(!$session->plus){echo"disabled";} ?> class="text" type="text" name="linkziel<?php print $i; ?>" value="<?php print $link['url']; ?>" maxlength="255" /></td>          
      </tr>
      <?php ++$i; $last_pos = $link['pos']; endforeach; ?>
      <tr>
	<td></td>
	<td class="nr"><input <?php if(!$session->plus){echo"disabled";} ?> class="text" type="text" name="nr<?php print $i; ?>" value="<?php print ($last_pos + 1); ?>" size="1" maxlength="3"></td>
	<td class="nam"><input <?php if(!$session->plus){echo"disabled";} ?> class="text" type="text" name="linkname<?php print $i; ?>" value="" maxlength="30"></td>
	<td class="link"><input <?php if(!$session->plus){echo"disabled";} ?> class="text" type="text" name="linkziel<?php print $i; ?>" value="" maxlength="255"></td>
      </tr>
      <tr>
       <td colspan="4"><input type="image" value="" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" /></td>
      </tr>
    </tbody>
  </table>
</form>
<!-- <table cellpadding="1" cellspacing="1" id="completion" class="set"><thead>
    <tr>
	<th colspan="2">Conclusão automática</th>
    </tr>
    <tr>
	<td colspan="2">Usado para ponto de reunião militar e mercado:</td>

    </tr>
    </thead><tbody>
    <tr>
	<td class="sel"><input class="check" type="checkbox" name="v1" value="1" checked></td>
	<td>próprias aldeias</td>
    </tr>
    <tr>
	<td class="sel"><input class="check" type="checkbox" name="v2" value="1" ></td>

	<td>aldeias dos arredores</td>
    </tr>
    <tr>
	<td class="sel"><input class="check" type="checkbox" name="v3" value="1" ></td>
	<td>aldeias de jogadores da aliança</td>
    </tr>
    </tbody></table><table cellpadding="1" cellspacing="1" id="big_map" class="set"><thead>
    <tr>

	<th colspan="2">Large map</th>
    </tr>
    </thead><tbody>
    <tr>
	<td class="sel"><input class="check" type="checkbox" name="map" ></td>
	<td>Mostrar o mapa grande em uma janela extra.</td>
    </tr>
    </tbody>

    </table><table cellpadding="1" cellspacing="1" id="report_filter" class="set"><thead>
    <tr>
	<th colspan="2">Filtro de relatório</th>
    </tr>
    </thead><tbody>
    <tr>
	<td class="sel"><input class="check" type="checkbox" name="v4" value="1" ></td>
	<td>Nenhum relatório para transferências para aldeias próprias.</td>

    </tr>
    <tr>
	<td class="sel"><input class="check" type="checkbox" name="v5" value="1" ></td>
	<td>Nenhum relatório para transferências para aldeias estrangeiras.</td>
    </tr>
    <tr>
	<td class="sel"><input class="check" type="checkbox" name="v6" value="1" ></td>
	<td>Nenhum relatório para transferências de aldeias estrangeiras.</td>

    </tr>
    </tbody>
    </table><table cellpadding="1" cellspacing="1" id="time" class="set"><thead>
<tr>
    <th colspan="2">Preferências de tempo</th>
</tr>
<tr>
    <td colspan="2">Aqui você pode alterar a hora exibida do Travian para ajustar seu fuso horário.</td>
</tr>
</thead><tbody>

<tr>
    <th>Time zones</th>
    <td><select name="timezone" class="dropdown">
	<optgroup label="local time zones"><option value="495">Europe</option>
<option value="99" selected="selected">UK</option>
<option value="492">Turkey</option>
<option value="328">Asia/Kolkata</option>
<option value="345">Asia/Bangkok</option>

<option value="257">USA/New York</option>
<option value="189">USA/Chicago</option>
<option value="474">New Zealand</option></optgroup><optgroup label="general time zones"><option value="12">UTC-11</option>
	   <option value="13">UTC-10</option>
	   <option value="14">UTC-9</option>
	   <option value="15">UTC-8</option>
	   <option value="16">UTC-7</option>

	   <option value="17">UTC-6</option>
	   <option value="18">UTC-5</option>
	   <option value="19">UTC-4</option>
	   <option value="20">UTC-3</option>
	   <option value="21">UTC-2</option>
	   <option value="22">UTC-1</option>

	   <option value="23">UTC</option>
	   <option value="0">UTC+1</option>
	   <option value="1">UTC+2</option>
	   <option value="2">UTC+3</option>
	   <option value="3">UTC+4</option>
	   <option value="4">UTC+5</option>

	   <option value="5">UTC+6</option>
	   <option value="6">UTC+7</option>
	   <option value="7">UTC+8</option>
	   <option value="8">UTC+9</option>
	   <option value="9">UTC+10</option>
	   <option value="10">UTC+11</option>

	   <option value="11">UTC+12</option>
	   
	</optgroup></select>

    </td>
</tr><tr>
    <th>Date</th>
    <td>
	<label><input class="radio" type="Radio" name="tformat" value="0" checked> EU (dd.mm.yy 24h)</label><br />

	<label><input class="radio" type="Radio" name="tformat" value="1"> US (mm/dd/yy 12h)</label><br />
	<label><input class="radio" type="Radio" name="tformat" value="2"> UK (dd/mm/yy 12h)</label><br />
	<label><input class="radio" type="Radio" name="tformat" value="3"> ISO (yy/mm/dd 24h)</label>
    </td>
</tr>
</tbody>
</table><p class="btn"><input type="image" value="" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" /></p>

</form> //-->

