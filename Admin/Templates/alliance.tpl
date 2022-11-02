<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       alliance.tpl                                                ##
##  Developed by:  Dzoki                                                       ##
##  Reworked:      aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################

if($_GET['aid'])
{
	$alidata = $database->getAlliance($_GET['aid']);
	$aliusers = $database->getAllMember($_GET['aid']);
	if($alidata and $aliusers)
	{
		foreach($aliusers as $member)
		{
			$totalpop += $database->getVSumField($member['id'],"pop");
		} ?>

		<br>
		<table id="profile" cellpadding="1" cellspacing="1">
			<thead>
				<tr>
					<th colspan="2">Aliança <a href="?p=alliance&aid=<?php echo $alidata['id'];?>"><?php echo $alidata['name'];?></a></th>
				</tr>
				<tr>
					<td>Detalhes</td>
					<td>Descrição</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="empty"></td>
					<td class="empty"></td>
				</tr>
				<tr>
					<td class="details">
						<table cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th>Identificação</th>
									<td><?php echo $alidata['tag']; ?></td>
								</tr>
								<tr>
									<th>Nome</th>
									<td><?php echo $alidata['name']; ?></td>
								</tr>
								<tr>
									<td colspan="2" class="empty"></td>
								</tr>
								<tr>
									<th>Ranque</th>
									<td>???</td>
								</tr>
								<tr>
									<th>Pontos</th>
									<td><?php echo $totalpop; ?></td>
								</tr>
								<tr>
									<th>Membros</th>
									<td><?php echo count($aliusers); ?></td>
								</tr>
								<tr>
									<td colspan="2" class="empty"></td>
								</tr>
								<tr>
									<th>Fundador da Aliança</th>
									<td><a href="?p=player&uid=<?php echo $alidata['leader']; ?>"><?php echo $database->getUserField($alidata['leader'],"username",0); ?></a></td>
								</tr>
								<tr>
									<td colspan="2"><b>Posição da Aliança</b></td>
								</tr>

								<?php
									error_reporting(0);
									$sql = "SELECT * FROM ".TB_PREFIX."ali_permission WHERE alliance = ".$_GET['aid']."";
									$result = mysql_query($sql);
									while($row = mysql_fetch_assoc($result))
									{
										$player = mysql_fetch_assoc(mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id = ".$row['uid'].""));
										if($row['opt1'] == 1) { $position1 = "Atribuir posição"; } else { $position1 = "Não Atribuir posição"; }
										if($row['opt2'] == 1) { $position2 = "Retirar jogadores"; } else { $position2 = "Não Retirar jogadores"; }
										if($row['opt3'] == 1) { $position3 = "Mudar descrição da Aliança"; } else { $position3 = "Não mudar descrição"; }
										if($row['opt4'] == 1) { $position4 = "Convidar jogadores"; } else { $position4 = "Não convidar"; }
										if($row['opt5'] == 1) { $position5 = "Gerenciar Fóruns"; } else { $position5 = "Não Gerenciar Fóruns"; }
										if($row['opt6'] == 1) { $position6 = "Diplomacia da Aliança"; } else { $position6 = "Não fazer Diplomacia"; }
										if($row['opt7'] == 1) { $position7 = "IGMs Massa (MMs)"; } else { $position7 = "Não MMs"; }
										if($row['opt8'] == 1) { $position8 = "???"; } else { $position8 = "No ???"; }

										echo '
										<tr>
											<td>Posição:</td>
											<td><a href="admin.php?p=player&uid='.$row['uid'].'">'.$player['username'].'</a><br /><b>'.$row['rank'].'</b><br />
												<select>
													<option>Permissões</option>
													<option>'.$position1.'</option>
													<option>'.$position2.'</option>
													<option>'.$position3.'</option>
													<option>'.$position4.'</option>
													<option>'.$position5.'</option>
													<option>'.$position6.'</option>
													<option>'.$position7.'</option>
													<option>'.$position8.'</option>
												</select>
											</td>
										</tr>
										';
									}
								?>

								<tr>
									<th>Capacidade</th>
									<td>
										<?php
											$now = count($aliusers);
											$max = $alidata['max'];
											if($now > $max)
											{
												$color = "red";
											}
											else
											{
												$color = "blue";
											}
											echo "<b><font color=\"$color\">($now/$max)</font></b>";
										?>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="empty"></td>
								</tr>
								<tr>
									<td colspan="2"><a href="?p=editAli&aid=<?php echo $alidata['id'];?>">» Editar Aliança</a></td>
								</tr>
								<tr>
									<td colspan="2"><a href="?p=DelAli&aid=<?php echo $alidata['id'];?>">» Deletar Aliança</a></td>
								</tr>
								<tr>
									<td colspan="2" class="empty"></td>
								</tr>
								<tr>
									<td class="desc2" colspan="2">
										<center>
											<?php echo nl2br($alidata['desc']); ?>
										</center>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="empty"></td>
								</tr>
							</tbody>
						</table>
					</td>
						<td class="desc1">
							<center>
								<?php echo nl2br($alidata['notice']); ?>
							</center>
						</td>
					</tr>
				</tr>
				<tr>
					<td colspan="4" class="empty"></td>
				</tr>
			</tbody>
		</table>


		<table id="member" cellpadding="1" cellspacing="1">
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th>Jogador</th>
					<th>População</th>
					<th>Aldeias</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
			<?php
				foreach($aliusers as $user)
				{
					$rank = $rank  + 1;
					$TotalUserPop = $database->getVSumField($user['id'],"pop");
					$TotalVillages = $database->getProfileVillages($user['id']);
					echo "<tr>";
					echo "<td class=ra>".$rank.".</td>";
					echo "<td class=pla><a href=spieler.php?uid=".$user['id'].">".$user['username']."</a></td>";
					echo "<td class=hab>".$TotalUserPop."</td>";
					echo "<td class=vil>".count($TotalVillages)."</td>";
					if($aid == $session->alliance)
					{
						if ((time()-600) < $user['timestamp'])
						{
							// 0 Min - 10 Min
							echo '<td class=on><img class=online1 src=img/x.gif title="Online agora" alt="Online agora" /></td>';
						}
						elseif ((time()-86400) < $user['timestamp'] && (time()-600) > $user['timestamp'])
						{
							// 10 Min - 1 Days
							echo '<td class=on><img class=online2 src=img/x.gif title="Online recente" alt="Online recente"/></td>';
						}
						elseif ((time()-259200) < $user['timestamp'] && (time()-86400) > $user['timestamp'])
						{
							// 1-3 Days
							echo '<td class=on><img class=online3 src=img/x.gif title="Online há alguns dias" alt="Online há alguns dias" /></td>';
						}
						elseif ((time()-604800) < $user['timestamp'] && (time()-259200) > $user['timestamp'])
						{
							echo '<td class=on><img class=online4 src=img/x.gif title="Offline há alguns dias" alt="Offline há alguns dias" /></td>';
						}
						else
						{
							echo '<td class=on><img class=online5 src=img/x.gif title="Offline há muitos dias" alt="Offline há muitos dias" /></td>';
						}
					}
					echo "	</tr>";
				}
			?>
			</tbody>
		</table>
		<br /><br />

		<table id="profile">
			<thead>
				<tr>
					<th colspan="3">Notícias da Aliança</th>
				</tr>
				<tr>
					<td>Evento</td>
					<td>Horário</td>
				</tr>
			</thead>
				<?php
					$sql = "SELECT * FROM ".TB_PREFIX."ali_log WHERE aid = ".$_GET['aid']."";
					$result = mysql_query($sql);
					while($row = mysql_fetch_assoc($result))
					{
						echo '
						<tr>
							<td>'.$row['comment'].'</td>
							<td>'.date('d:m:Y H:i', $row['date']).'</td>
						</tr>';
					}
				?>
			</thead>
		</table>
		<br /><br />

		<h3>Não tenho certeza que esta Diplomacia está correta, mas eu acho que é</h3>
		<br />
		<table id="profile">
			<thead>
				<tr>
					<th colspan="3">Diplomacia da Aliança enviada</th>
				</tr>
				<tr>
					<td>Aliança Beneficiária</td>
					<td>Tipo</td>
					<td>Aceita</td>
				</tr>
			</thead>
				<?php
					$sql = "SELECT * FROM ".TB_PREFIX."diplomacy WHERE alli1 = ".$_GET['aid']."";
					$result = mysql_query($sql);
					while($row = mysql_fetch_assoc($result))
					{
						if($row['type'] == 1) { $type = 'Pacto da Confederação'; }
						if($row['type'] == 2) { $type = 'Pacto de Não Agressão'; }
						if($row['type'] == 3) { $type = 'Declaração de Guerra'; }
						if($row['accepted'] == 0) { $accepted = "<img src=\"../gpack/travian_default/img/a/del.gif\">"; }
						if($row['accepted'] ==1) { $accepted = "<img src=\"../gpack/travian_default/img/a/acc.gif\">"; }

						$ally = mysql_fetch_assoc(mysql_query("SELECT * FROM ".TB_PREFIX."alidata WHERE id = ".$row['alli2'].""));
						echo '
						<tr>
							<td><a href="admin.php?p=alliance&aid='.$row['alli1'].'">'.$ally['tag'].'</a></td>
							<td>'.$type.'</td>
							<td>'.$accepted.'</td>
						</tr>';
					}
				?>
			</thead>
		</table>
		<br /><br />

		<table id="profile">
			<thead>
				<tr>
					<th colspan="3">Diplomacia da Aliança Recebida</th>
				</tr>
				<tr>
					<td>da Aliança</td>
					<td>Tipo</td>
					<td>Aceita</td>
				</tr>
			</thead>
				<?php
					$sql = "SELECT * FROM ".TB_PREFIX."diplomacy WHERE alli2 = ".$_GET['aid']."";
					$result = mysql_query($sql);
					while($row = mysql_fetch_assoc($result))
					{
						if($row['type'] == 1) { $type = 'Pacto da Confederação'; }
						if($row['type'] == 2) { $type = 'Pacto de Não Agressão'; }
						if($row['type'] == 3) { $type = 'Declaração de Guerra'; }
						if($row['accepted'] == 0) { $accepted = "<img src=\"../gpack/travian_default/img/a/del.gif\">"; }
						if($row['accepted'] ==1) { $accepted = "<img src=\"../gpack/travian_default/img/a/acc.gif\">"; }

						$ally = mysql_fetch_assoc(mysql_query("SELECT * FROM ".TB_PREFIX."alidata WHERE id = ".$row['alli1'].""));
						echo '
						<tr>
							<td><a href="admin.php?p=alliance&aid='.$row['alli2'].'">'.$ally['tag'].'</a></td>
							<td>'.$type.'</td>
							<td>'.$accepted.'</td>
						</tr>';
					}
				?>
			</thead>
		</table>

		<br /><br />

		<table id="profile">
			<thead>
				<tr>
					<th colspan="3">Relações com a Aliança</th>
				</tr>
				<tr>
					<td>Aliança</td>
					<td>Tipo</td>
					<td></td>
				</tr>
			</thead>
				<?php
					$sql = "SELECT * FROM ".TB_PREFIX."diplomacy WHERE alli1 = ".$_GET['aid']." OR alli2 = ".$_GET['aid']." AND accepted = 1";
					$result = mysql_query($sql);
					while($row = mysql_fetch_assoc($result))
					{
						if($row['type'] == 1) { $type = 'Pacto da Confederação'; }
						if($row['type'] == 2) { $type = 'Pacto de Não Agressão'; }
						if($row['type'] == 3) { $type = 'Declaração de Guerra'; }
						if($row['accepted'] == 0) { $accepted = "<img src=\"../gpack/travian_default/img/a/del.gif\">"; }
						if($row['accepted'] ==1) { $accepted = "<img src=\"../gpack/travian_default/img/a/acc.gif\">"; }

						$ally1 = mysql_fetch_assoc(mysql_query("SELECT * FROM ".TB_PREFIX."alidata WHERE id = ".$row['alli1'].""));
						$ally2 = mysql_fetch_assoc(mysql_query("SELECT * FROM ".TB_PREFIX."alidata WHERE id = ".$row['alli2'].""));
						echo '
						<tr>
							<td><a href="admin.php?p=alliance&aid='.$row['alli1'].'">'.$ally1['tag'].'</a> & <a href="admin.php?p=alliance&aid='.$row['alli2'].'">'.$ally2['tag'].'</a></td>
							<td>'.$type.'</td>
							<td><img src="../gpack/travian_default/img/a/acc.gif"></td>
						</tr>';
					}
				?>
			</thead>
		</table>

		<br /><br />

		<?php
		include("allymedals.tpl");
	}
	else
	{
		echo "Not found...<a href=\"javascript: history.go(-1)\">Voltar</a>";
	}
}
?>