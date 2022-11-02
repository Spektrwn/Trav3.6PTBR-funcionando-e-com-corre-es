<table class="results defender" cellpadding="1" cellspacing="1">
				<thead>
					<tr>
						<td class="role">
							Defensor
						</td><td>
								<img src="img/x.gif" class="unit u11" title="Saqueador" alt="Saqueador" />
							</td><td>
								<img src="img/x.gif" class="unit u12" title="Lanceiro" alt="Lanceiro" />
							</td><td>
								<img src="img/x.gif" class="unit u13" title="Bárbaro" alt="Bárbaro" />
							</td><td>
								<img src="img/x.gif" class="unit u14" title="Espião" alt="Espião" />
							</td><td>
								<img src="img/x.gif" class="unit u15" title="Paladino" alt="Paladino" />
							</td><td>
								<img src="img/x.gif" class="unit u16" title="Cavaleiro Teutaõ" alt="Cavaleiro Teutão" />
							</td><td>
								<img src="img/x.gif" class="unit u17" title="Aríete" alt="Aríete´" />
							</td><td>
								<img src="img/x.gif" class="unit u18" title="Catapulta" alt="Catapulta" />
							</td><td>
								<img src="img/x.gif" class="unit u19" title="Chefe" alt="Chefe" />
							</td><td>
								<img src="img/x.gif" class="unit u20" title="Colonizador" alt="Colonizador" />
							</td></tr>
				</thead>
				<tbody>
					<tr>
						<th>
							Tropas
						</th>
                                <td <?php if (!$form->getValue('a2_11')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_11');} ?></td>
                                <td <?php if (!$form->getValue('a2_12')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_12');} ?></td>
                                <td <?php if (!$form->getValue('a2_13')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_13');} ?></td>
                                <td <?php if (!$form->getValue('a2_14')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_14');} ?></td>
                                <td <?php if (!$form->getValue('a2_15')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_15');} ?></td>
                                <td <?php if (!$form->getValue('a2_16')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_16');} ?></td>
                                <td <?php if (!$form->getValue('a2_17')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_17');} ?></td>
                                <td <?php if (!$form->getValue('a2_18')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_18');} ?></td>
                                <td <?php if (!$form->getValue('a2_19')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_19');} ?></td>
                                <td <?php if (!$form->getValue('a2_20')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_20');} ?></td>
                                </tr>
					<tr>
						<th>
							Perdas
						</th>
                        <td <?php if (!$troops = $form->getValue('a2_11')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_12')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_13')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_14')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_15')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_16')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_17')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_18')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_19')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_20')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        </tr>
				</tbody>
			</table>
