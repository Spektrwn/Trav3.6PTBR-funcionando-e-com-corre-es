<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       editPlus.tpl                                                ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################

$id = $_GET['uid'];
$uid = $_GET['uid'];
$user = $database->getUserArray($id,1);
if(isset($id))
{
	?>
	<form action="../GameEngine/Admin/Mods/editSitter.php" method="POST">
		<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
		<input type="hidden" name="uid" value="<?php echo $uid; ?>" />
		<input type="hidden" name="id" value="<?php echo $id; ?>" />
			<br />
			<p>Para mudar um sitters, você deve usar seu "uid" você pode encontrar isso usando a pesquisa. Excluir um sitter, colocar 0 como Sitter.</p>
			<br />
			<table id="profile" cellpadding="0" cellspacing="0">
				<thead>
					<tr>
						<th colspan="2">Editar Sitters para: <a href="admin.php?p=player&uid=<?php echo $user['id']; ?>"><?php echo $user['username']; ?></a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Sitter 1</td>
						<td>
							<input class="fm" name="sitter1" value="<?php echo $user['sit1']; ?>"><br />
							<?php
								$sitter1 = $database->getUserArray($user['sit1'], 1);
								if($user['sit1'] ==0)
								{
									echo 'No Sitter';
								}
								else
								{
									echo '<a href="admin.php?p=player&uid='.$sitter1['id'].'">'.$sitter1['username'].'</a>';
								}
							?>
						</td>
					</tr>
					<tr>
						<td>Sitter 2</td>
						<td>
							<input class="fm" name="sitter2" value="<?php echo $user['sit2']; ?>"><br />
							<?php
								$sitter2 = $database->getUserArray($user['sit2'], 1);
								if($user['sit2'] ==0)
								{
									echo 'No Sitter';
								}
								else
								{
									echo '<a href="admin.php?p=player&uid='.$sitter2['id'].'">'.$sitter2['username'].'</a>';
								}
							?>
						</td>
						</td>
					</tr>
				</tbody>
			</table>
			<br />
			<center><input type="image" value="submit" src="../img/admin/b/ok1.gif"></center>
		</form>
	<?php
}
else
{
	include("404.tpl");
}
?>