<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       maintenence.tpl                                             ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<table id="member" cellpadding="1" cellspacing="1" >
	<thead>
		<tr>
			<th colspan="2">Manutenção do Servidor</th>
		</tr> 
		<tr>
			<td class="on">Descrição</td>
			<td class="hab">Executar</td>
		</tr>
	</thead>
	<tbody> 
		<tr>
			<td class="hab">Fechar Servidor para Manutenção, Isso banirá todos os jogadores (Acesso 2) até que você possa corrigir bugs, ou carregar uma versão de um ceasefire lol</td>
			<td class="hab"><center><a href="admin.php?p=maintenenceBan"><img src="../img/admin/b/ok1.gif"></a></center></td>
		</tr>
		<tr>
			<td class="hab">Traga o servidor de volta para a manutenção, isto desbanirá todos os jogadores (proibindo a razão)</td>
			<td class="hab"><center><a href="admin.php?p=maintenenceUnban"><img src="../img/admin/b/ok1.gif"></a></center></td>
		</tr>
		<tr>
			<form action="../GameEngine/Admin/Mods/mainteneceCleanBanData.php" method="POST">
			<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
			<td class="hab">Limpar dados lista de Banidos (TRUNCADO)</td>
			<td class="hab"><center><input type="image" src="../img/admin/b/ok1.gif" value="submit"></center></td>
			</form>
		</tr>
	</tbody>
</table>