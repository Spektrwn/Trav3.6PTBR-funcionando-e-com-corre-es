<form action="../GameEngine/Admin/Mods/medals.php" method="POST">
			<input type="hidden" name="uid" value="<?php echo $_GET['uid']; ?>">
			<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ?>">
			<table id="profile">
				<thead>
					<tr>
						<th colspan="6">Medalhas do Jogador (<?php echo sizeof($varmedal); ?>)</th>
					</tr>
					<tr>
						<td>Categoria</td>
						<td>Ranque</td>
						<td>Semana</td>
						<td>Pontos</td>
						<td>Medalha</td>
						<td></td>
					</tr>
				</thead>
				<?php
					if(sizeof($varmedal) ==0)
					{ ?>
						<td colspan="5"><center>Este jogador ainda não tem medalha</center></td><?php
					}
					elseif(sizeof($varmedal) >0)
					{
						foreach($varmedal as $medal)
						{
							$titel="Bonus";
							switch ($medal['categorie'])
							{
								case "1": 	$titel="Atacante"; break;
								case "2": 	$titel="Defensor"; break;
								case "3":	$titel="Alpinista"; break;
								case "4":	$titel="Ladrão"; break;
								case "5":	$titel="Top 10 Ataque and Defesa"; break;
								case "6":	$titel="Top 3 Ataque, ".$medal['points']." seguidas"; break;
								case "7":	$titel="Top 3 Defesa,".$medal['points']." seguidas"; break;
								case "8":	$titel="Top 3 Alpinista, ".$medal['points']." seguidas"; break;
								case "9":	$titel="Top 3 Ladrão, ".$medal['points']." seguidas"; break;
								case "10":	$titel="Alpinista da semana"; break;
								case "11":	$titel="Top 3 Alpinista,  ".$medal['points']." seguidas"; break;
								case "12":	$titel="Top 10 Atacante, ".$medal['points']." seguidas"; break;
							}
							$title = $titel;
							$rank = $medal['plaats'];
							if($rank == '0') { $rank = "<p>Bônus</p>"; } else { $rank = $rank; }
							$week = $medal['week'];
							$points = $medal['points'];
							if($points == '') { $points = "<p>Bônus</p>"; } else { $points = $points; }

							echo"
								<tr>
									<td>$title</td>
									<td>$rank</td>
									<td>$week</td>
									<td>$points</td>
									<td><img src=\"../gpack/travian_default/img/t/".$medal['img'].".jpg\"></td>
									<td>
									</td>
								</tr>";
										/*<input type=\"image\" name=\"medalid\" value=\"".$medal['id']."\" style=\"background-image: url('../gpack/travian_default/img/a/del.gif'); height: 12px; width: 12px;\" src=\"../gpack/travian_default/img/a/a/x.gif\">
									</td>
								</tr>";*//*incluidas linha 58 e 59 e retiradas estas marcadas por Spektrwn*/
						}

						$averagerank = 0;
						foreach($varmedal as $medal)
						{
							$rank = $medal['plaats'];
							if($rank > 0)
							{
								if(is_numeric($rank))
								{
									$i = $i + 1;
									$averagerank = $averagerank + $medal['plaats'];
								}
								else
								{
									$averagerank = $averagerank + 0;
								}
							}
						}
						$average = $averagerank / $i;
						echo "</form><tr><td><b>Classificação Média</b></td><td>$average</td><td></td><td></td><td>Apagar todas (ERRO)</td>";
						}
				?>
				<td><?php /*
					<form action="../GameEngine/Admin/Mods/deletemedalbyuser.php" method="POST">
						<input type="hidden" name="admid" id="admid" value="<?php echo $_SESSION['id']; ">
						
							<input type="image" name="userid" value="<?php echo $id; ?>" style="background-image: url('../gpack/travian_default/img/a/del.gif'); height: 12px; width: 12px;" src="../gpack/travian_default/img/a/a/x.gif">
						
					</form>*/?>
				</td>
			</tbody>
		</table>