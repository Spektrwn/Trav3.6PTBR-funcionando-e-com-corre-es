<?php
if(!$session->goldclub) {
			include "Templates/Build/16.tpl";
			}else{
?>
<div id="build" class="gid16"><a href="#" onClick="return Popup(16,4);" class="build_logo">
	<img class="g16" src="img/x.gif" alt="Rally point" title="Rally point" />
</a>
<h1>Ponto de reunião militar <span class="level">nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">As tropas da vossa aldeia se encontram aqui. A partir daqui você pode enviá-los para conquistar, invadir ou reforçar outras aldeias.</p>

<div id="textmenu">
		<a href="build.php?id=<?php echo $id; ?>">Visão geral</a> |
		<a href="a2b.php">Enviar tropas</a> |
		<a href="warsim.php">Simulador de combate</a> <?php if($session->goldclub==1){ ?>|
		<a href="build.php?id=<?php echo $id; ?>&amp;t=99">Clube Ouro</a>
		<?php } ?>
		</div>

		<div id="raidList">
			<?php  include "Templates/goldClub/farmlist.tpl"; ?>
		</div>
<br />
<?php if($hideevasion == 0){ ?>
<table cellpadding="1" cellspacing="1">
        <thead>
            <tr>
                <th colspan="4">Configuração de evasão</th>
            </tr>

            <tr>
                <td></td>

                <td>Aldeia</td>

                <td>Suas tropas</td>

                <td>Reforço</td>
            </tr>
        </thead>
		<tbody>
		<?php
		for($i=0;$i<=count($session->villages)-1;$i++) {
		$wref = $session->villages[$i];
		$vname = $database->getVillageField($wref,"name");
		$vchecked = $database->getVillageField($wref,"evasion");
		$reinf = $database->getEnforceVillage($wref,0);
		if($vchecked == 1){ $checked = 'checked'; }else{ $checked = ''; }
		?>
            <tr>
                <td><input type="checkbox" class="check" name="hideShow" onclick="window.location.href = '?gid=16&t=99&evasion=<?php echo $wref;?>';" <?php echo $checked; ?>></td>

                <td><?php echo $vname; ?></td>

                <td><?php echo $database->getUnitsNumber($wref); ?></td>

                <td><?php echo count($reinf); ?></td>
            </tr>
		<?php
		}
		$user = $database->getUserArray($session->uid, 1);
		?>
		</tbody>
        </table>
<form action="build.php?id=39&t=99" method="POST">
<br />
<tr>
						Enviar tropas um máximo de <input class="text" type="text" name="maxevasion" value="<?php echo $user['maxevasion']; ?>" maxlength="3" style="width:50px;"> vezes
						<span class="none">(custos: <img src="<?php echo GP_LOCATE; ?>img/a/gold_g.gif" alt="Gold" title="Gold"/><b>2</b> por evasão)</span>
					
</tr>
<tr>
<div class="clear"></div><p><input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" tabindex="8" alt="OK"/></p></form>
</tr>
</form>
<?php } ?>
	</div>
<?php } ?>