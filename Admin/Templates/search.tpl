<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       search.tpl                                                  ##
##  Developed by:  Dzoki                                                       ##
##  Reworked:      aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<form action="" method="post">
	<br />
	<table id="member">
		<thead>
			<tr>
				<th colspan="3">Buscador v1.0</th>
			</tr>
		</thead>
		<tr class="slr3">
			<td>
				<select name="p" size="1" class="slr3">
					<option value="player" <?php if($_POST['p']=='player'){echo "selected";}?>>Procurar Jogadores</option>
					<option value="alliances" <?php if($_POST['p']=='alliances'){echo "selected";}?>>Procurar Alianças</option>
					<option value="villages" <?php if($_POST['p']=='villages'){echo "selected";}?>>Procurar Aldeias</option>
					<option value="email" <?php if($_POST['p']=='email'){echo "selected";}?>>Procurar E-mails</option>
					<option value="ip" <?php if($_POST['p']=='ip'){echo "selected";}?>>Procurar IPs</option>
					<option value="deleted_players" <?php if($_POST['p']=='deleted_players'){echo "selected";}?>>Procurar Jogadaores Deletados</option>
				</select>
			</td>
			<td>
				<input name="s" value="<?php echo stripslashes(stripslashes($_POST['s']));?>">
			</td>
			<td>
				<input type="submit" value="Search" class="slr3">
			</td>
		</tr>
	</table>
</form>

<?php
	if($_GET['msg'])
	{
		echo '<div style="margin-top: 50px;" class="b"><center>';
		if($_GET['msg'] == 'ursdel')
		{
			echo "O usuário foi excluído.";

		}
		echo '</center></div>';
	}
?>