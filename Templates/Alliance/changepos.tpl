<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$playerData = $database->getAlliPermissions($_POST['a_user'], $session->alliance);
$playername = $database->getUserField($_POST['a_user'],'username',0);

$allianceinfo = $database->getAlliance($aid);
echo "<h1>".$allianceinfo['tag']." - ".$allianceinfo['name']."</h1>";
include("alli_menu.tpl"); 
?>
<form method="post" action="allianz.php">
	<table cellpadding="1" cellspacing="1" id="position" class="small_option">
		<thead>
			<tr>

				<th colspan="2">Atribuir uma posição</th>
		  </tr>
	    </thead>
		<tbody>
			<tr>
				<th>Nome:</th>
				<td> <?php echo $playername; ?> </td>
			</tr>
			<tr>
				<th>Posição:</th>
				<td><input class="name text" type="text" name="a_titel" value="<?php echo $playerData[rank]; ?>" maxlength="20" /></td>
			</tr>
	    </tbody>
    </table>
  <table cellpadding="1" cellspacing="1" id="rights" class="small_option">

						<thead>
							<tr>
								<th colspan="2">Atribuir direitos</th>
						  </tr>
						</thead>
						<tbody>
							<tr>
								<td class="sel"><input class="check" type="checkbox" name="e1" value="1" <?php if ($playerData[opt1]) { echo "checked=checked"; } ?> ></td>

								<td>Atribuir posição</td>
						  </tr>

							<tr>
								<td class="sel"><input class="check" type="checkbox" name="e2" value="1" <?php if ($playerData[opt2]) { echo "checked=checked"; } ?> ></td>
								<td>Retirar jogador</td>
						  </tr>

							<tr>

								<td class="sel"><input class="check" type="checkbox" name="e3" value="1" <?php if ($playerData[opt3]) { echo "checked=checked"; } ?> ></td>
								<td>Mudar descrição da aliança</td>
						  </tr>

							<tr>
								<td class="sel"><input class="check" type="checkbox" name="e6" value="1"<?php if ($playerData[opt6]) { echo "checked=checked"; } ?> ></td>
								<td>Diplomacia da Aliança</td>
						  </tr>

							<tr>
								<td class="sel"><input class="check" type="checkbox" name="e7" value="1" <?php if ($playerData[opt7]) { echo "checked=checked"; } ?> ></td>
								<td>IGMs a todos membros da aliança</td>
						  </tr>

							<tr>
								<td class="sel"><input class="check" type="checkbox" name="e4" value="1" <?php if ($playerData[opt4]) { echo "checked=checked"; } ?> ></td>
								<td>Convidar um jogador para a aliança</td>

						  </tr>

							<tr>
								<td class="sel"><input class="check" type="checkbox" name="e5" value="1" <?php if ($playerData[opt5]) { echo "checked=checked"; } ?> ></td>
								<td>Gerenciar fórum</td>
						  </tr>
						</tbody>
  </table>
					<p>

						<input type="hidden" name="a" value="1">
						<input type="hidden" name="o" value="1">
						<input type="hidden" name="s" value="5">
					  <input type="hidden" name="a_user" value="<?php echo $_POST['a_user']; ?>">
						<input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" />
  </p>
				</form>