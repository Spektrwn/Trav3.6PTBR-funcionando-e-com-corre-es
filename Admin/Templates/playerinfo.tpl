<table id="profile" cellpadding="1" cellspacing="1" >
			<thead>
				<tr>
					<th colspan="2">Jogador <a href="admin.php?p=player&uid=<?php echo $user['id'];?>"><?php echo $user['username'];?></a></th>
				</tr>
				<tr>
					<td>Detalhes</td>
					<td>Descrição</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="empty"></td><td class="empty"></td>
				</tr>
				<tr>
					<td class="details">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<th>Ranque</th>
								<td>????<?php /* echo $ranking->searchRank($user['id'], "rank");*/ ?></td>
							</tr>
							<tr>
								<th>Tribo</th>
								<td>
									<?php
										if($user['tribe'] == 1)
										{
											echo "Romano";
										}
										else if($user['tribe'] == 2)
										{
											echo "Teutão";
										}
										else if($user['tribe'] == 3)
										{
											echo "Gaulês";
										}
										else if($user['tribe'] == 4)
										{
											echo "Natars";
										}
										else if($user['tribe'] == 5)
										{
											echo "Natureza";
										}
									?>
								</td>
							</tr>
							<tr>
								<th>Aliança</th>
								<td>
									<?php
										if($user['alliance'] == 0)
										{
											echo "-";
										}
										else
										{
											echo "<a href=\"?p=alliance&aid=".$user['alliance']."\">".$database->getAllianceName($user['alliance'])."</a>";
										}
									?>
								</td>
							</tr>
							<tr>
								<th>Aldeias</th>
								<td><?php echo count($varray);?></td>
							</tr>
							<tr>
								<th>População</th>
								<td><?php echo $totalpop;?> <a href="?action=recountPopUsr&uid=<?php echo $user['id'];?>"><?php echo $refreshicon; ?></a></td>
							</tr>
							<tr>
								<th>Idade</td>
								<td>
									<?php
										if(isset($user['birthday']) && $user['birthday'] != 0)
										{
											$age = date("Y")-substr($user['birthday'],0,4);
											echo $age;
										}
										else
										{
											echo "<font color=\"red\">Não Disponível</font>";
										}
									?>
								</td>
							</tr>
							<tr>
								<th>Gênero</td>
								<td>
									<?php
										if(isset($user['gender']) && $user['gender'] != 0)
										{
											$gender = ($user['gender']== 1)? "Male" : "Female";
											echo $gender;
										}
										else
										{
											echo "<font color=\"red\">Não Disponível</font>";
										}
									?>
								</td>
							</tr>

							<tr>
								<th>Apelido</th>
								<td>
									<form action="../GameEngine/Admin/Mods/editUsername.php" method="POST">
										<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
										<input type="hidden" name="uid" id="uid" value="<?php echo $_GET['uid']; ?>">
										<input type="text" style="width: 80%;" class="fm" name="username" value="<?php echo $user['username']; ?>"> <input type="image" value="submit" src="../img/admin/edit.gif" title="Editar Apelido"></a>
								</td>
							</tr>

							<tr>
								<th>Localização</th>
								<td>
									<input type="text" style="width: 80%;" disabled="disabled" class="fm" name="location" value="<?php echo $user['location']; ?>">  <a href="admin.php?p=editUser&uid=<?php echo $id; ?>"><img src="../img/admin/edit.gif" title="Edit Location"></a>
								</td>
							</tr>

							<tr>
								<th>Senha</th>
								<td>
									Mudar <a href="admin.php?p=editPassword&uid=<?php echo $id; ?>"><img src="../img/admin/edit.gif" title="Mudar Senha"></a>
								</td>
							</tr>

							<tr>
								<?php include("playerplusbonus.tpl"); ?>
							<tr>
								<th>E-mail</th>
								<td>
									<input disabled="disabled" style="width: 80%;" class="fm" name="email" value="<?php echo $user['email']; ?>"> <a href="admin.php?p=editUser&uid=<?php echo $id; ?>"><img src="../img/admin/edit.gif" title="Editar E-mail"></a>
								</td>
							</tr>
							<?php /*
							<tr>
								<th>Send</th>
								<td>
									<?php
										$link = "<a href=\"mailto:".$user['email']."\">".$user['email']."</a>";
										echo $link;
									?>
								</td>
							</tr> */ ?>
							<tr>
								<th>Pergunta</td>
								<td>
									<?php
										## not sure if this is correct
										$quest = $user['quest'];
										if($quest == 1) { $questname = "Woodcutter"; }
										elseif($quest ==2) {$questname = "Crop"; }
										elseif($quest ==3) {$questname = "Your Villages Name"; }
										elseif($quest ==4) {$questname = "Other Players"; }
										elseif($quest ==5) {$questname = "Two Building Order"; }
										elseif($quest ==6) {$questname = "Messages"; }
										elseif($quest ==7) {$questname = "Huge Army!"; }
										elseif($quest ==8) {$questname = "Everything to 1!"; }
										elseif($quest ==9) {$questname = "Dove of Peace"; }
										elseif($quest ==10) {$questname = "Cranny"; }
										elseif($quest ==11) {$questname = "To Two!"; }
										elseif($quest ==12) {$questname = "Instruction"; }
										elseif($quest ==13) {$questname = "Main Building"; }
										elseif($quest ==14) {$questname = "Advanced!" ;}
										elseif($quest ==15) {$questname = "Weapons or Dough"; }
										elseif($quest ==16) {$questname = "Military: Rally Point"; }
										elseif($quest ==17) {$questname = "Military: Barracks"; }
										elseif($quest ==18) {$questname = "Military: Train 2 Troops"; }
										elseif($quest ==19) {$questname = "Economy: Granary"; }
										elseif($quest ==20) {$questname = "Economy: Warehouse"; }
										elseif($quest ==21) {$questname = "Economy: Marketplace"; }
										elseif($quest ==22) {$questname = "Everything to 2!"; }
										else { $questname = "Unknown"; }
										$quesst = $quest;
										if($quest > 18){
										$quesst = $quest - 3;
										}
										$questinfo = "$quesst - $questname";
									?>
								<input disabled="disabled" style="width: 80%;" class="fm" name="quest" value="<?php echo $questinfo; ?>"> <a href="admin.php?p=editUser&uid=<?php echo $id; ?>"><img src="../img/admin/edit.gif" title="Editar Pergunta"></a></td>
							</tr>
							<tr>
								<td colspan="2" class="empty"></td>
							</tr>

							<?php
								if($_SESSION['access'] == ADMIN)
								{
									echo '
									<tr>
										<td colspan="2">
											<a href="?p=editUser&uid='.$user['id'].'"><font color="blue">&raquo;</font> Editar Usuário</a>
										</td>
									</tr>';
								}
								else if($_SESSION['access'] == MULTIHUNTER)
								{
									echo '';
								}
								if($_SESSION['access'] == ADMIN)
								{
									echo '
									<tr>
										<td colspan="2">
											<a class="rn3" href="?p=deletion&uid='.$user['id'].'"><font color="red">&raquo;</font> Deletar Usuário</a>
										</td>
									</tr>';
								}
								else if($_SESSION['access'] == MULTIHUNTER)
								{
									echo '';
								}
							?>

							<tr>
								<td colspan="2"><a href="?p=ban&uid=<?php echo $user['id']; ?>">&raquo; Banir Usuário</a></td>
							</tr>

							<tr>
								<td colspan="2"><a href="?p=Newmessage&uid=<?php echo $user['id']; ?>">&raquo; Enviar Mensagem</a></td>
							</tr>

							<tr>
								<td colspan="2"><a href="?p=editPlus&uid=<?php echo $user['id']; ?>">&raquo; Editar Plus & Bonus</a></td>
							</tr>

							<tr>
								<td colspan="2"><a href="?p=editSitter&uid=<?php echo $user['id']; ?>">&raquo; Editar Babás</a></td>
							</tr>

							<tr>
								<td colspan="2"><a href="?p=editWeek&uid=<?php echo $user['id']; ?>">&raquo; Editar em geral Ataque & Defesa</a></td>
							</tr>

							<tr>
								<td colspan="2"><a href="?p=editOverall&uid=<?php echo $user['id']; ?>">&raquo; Editar Pontos Ataque, Defesa, Assalto</a></td>
							</tr>

							<tr>
								<td colspan="2"><a href="?p=userlogin&uid=<?php echo $user['id']; ?>">&raquo; Log de acesso do Usuário</a></td>
							</tr>

							<tr>
								<td colspan="2"><a href="?p=userillegallog&uid=<?php echo $user['id']; ?>">&raquo; Log de Ilegalidades do Usuário</a></td>
							</tr>

							<tr>
								<td colspan="2" class="desc2">
									<div class="desc2div">
										<center><?php echo nl2br($user['desc1']); ?></center>
									</div>
								</td>
							</tr>
						</table>
					<td class="desc1">
						<center><?php echo nl2br($user['desc2']); ?></center>
					</td>
				</tr>
			</tbody>
		</table>