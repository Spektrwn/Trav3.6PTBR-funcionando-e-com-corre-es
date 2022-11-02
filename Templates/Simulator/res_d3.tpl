<table class="results defender" cellpadding="1" cellspacing="1">
				<thead>
					<tr>

						<td class="role">
							Defensor
						</td><td>
								<img src="img/x.gif" class="unit u21" title="Falange" alt="Falange" />
							</td><td>
								<img src="img/x.gif" class="unit u22" title="Lanceiro" alt="Lanceiro" />
							</td><td>
								<img src="img/x.gif" class="unit u23" title="Bárbaro" alt="Bárbaro" />
							</td><td>
								<img src="img/x.gif" class="unit u24" title="Trovão Theutate" alt="Trovão Theutates" />
							</td><td>
								<img src="img/x.gif" class="unit u25" title="Cavaleiro Druida" alt="Cavaleiro Druida" />
							</td><td>
								<img src="img/x.gif" class="unit u26" title="Haeduano" alt="Haeduano" />
							</td><td>
								<img src="img/x.gif" class="unit u27" title="Aríete" alt="Aríete" />
							</td><td>
								<img src="img/x.gif" class="unit u28" title="Trabuquete" alt="Trabuquete" />
							</td><td>
								<img src="img/x.gif" class="unit u29" title="Chefe do Clã" alt="Chefe do Clã" />
							</td><td>
								<img src="img/x.gif" class="unit u30" title="Colonizador" alt="Colonizador" />
							</td></tr>
				</thead>
				<tbody>
					<tr>
						<th>

							Tropas
						</th>
                                <td <?php if (!$form->getValue('a2_21')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_21');} ?></td>
                                <td <?php if (!$form->getValue('a2_22')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_22');} ?></td>
                                <td <?php if (!$form->getValue('a2_23')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_23');} ?></td>
                                <td <?php if (!$form->getValue('a2_24')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_24');} ?></td>
                                <td <?php if (!$form->getValue('a2_25')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_25');} ?></td>
                                <td <?php if (!$form->getValue('a2_26')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_26');} ?></td>
                                <td <?php if (!$form->getValue('a2_27')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_27');} ?></td>
                                <td <?php if (!$form->getValue('a2_28')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_28');} ?></td>
                                <td <?php if (!$form->getValue('a2_29')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_29');} ?></td>
                                <td <?php if (!$form->getValue('a2_30')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_30');} ?></td>
                                </tr>
					<tr>

						<th>
							Perdas
						</th>
						</th>
                        <td <?php if (!$troops = $form->getValue('a2_21')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_22')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_23')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_24')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_25')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_26')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_27')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_28')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_29')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_30')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        </tr>

				</tbody>
			</table>
