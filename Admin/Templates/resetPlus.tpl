<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       gold.tpl                                                    ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################

if($_SESSION['access'] < ADMIN) die("Acesso negado: você não é administrador!");
$id = $_SESSION['id']; ?>

<form action="../GameEngine/Admin/Mods/mainteneceResetPlus.php" method="POST">
	<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
	<table id="member" style="width:300px;">
		<thead>
			<tr>
				<th colspan="2">Resetar todos Plus</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<center>
						<input type="image" src="../img/admin/b/ok1.gif" value="submit">
					</center>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<?php
	if(isset($_GET['g']))
	{
		echo '<br /><br /><font color="Red"><b>Plus de todos foi Resetado</font></b>';
	}
?>