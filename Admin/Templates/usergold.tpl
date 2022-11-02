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

<form action="../GameEngine/Admin/Mods/gold_1.php" method="POST">
	<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
	<table id="member" style="width:300px;">
		<thead>
			<tr>
				<th colspan="2">Dê ouro grátis para usuários específicos</th>
			</tr>
			<tr>
				<td>Quantidade</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<center>
						<b>Quanto ouro?</b>
					</center>
				</td>
				<td>
					<center>
						<input class="give_gold" name="gold" value="20" maxlength="4">&nbsp;
						<img src="../img/admin/gold.gif" class="gold" alt="Gold" name="gold" title="Gold"/>
					</center>
				</td>
			</tr>
			<tr>
				<td>
					<center>
						<b>Para qual usuário (id)?</b>
					</center>
				</td>
				<td>
					<center>
						<input class="give_gold" name="id" value="">&nbsp;
					</center>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<center>
						<input type="image" src="../img/admin/b/ok1.gif" value="submit" title="Dê ouro gratis ao usuário">
					</center>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<?php
	if(isset($_GET['g']))
	{
		echo '<br /><br /><font color="Red"><b>Ouro adicionado</font></b>';
	}
?>