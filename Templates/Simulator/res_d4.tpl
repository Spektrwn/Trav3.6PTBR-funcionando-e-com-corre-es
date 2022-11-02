<table class="results defender" cellpadding="1" cellspacing="1">
				<thead>
					<tr>

						<td class="role">
							Defensor
						</td><td>
								<img src="img/x.gif" class="unit u31" title="Rato" alt="Rato" />
							</td><td>

								<img src="img/x.gif" class="unit u32" title="Aranha" alt="Aranha" />
							</td><td>
								<img src="img/x.gif" class="unit u33" title="Cobra" alt="Cobra" />
							</td><td>
								<img src="img/x.gif" class="unit u34" title="Morcego" alt="Morcego" />
							</td><td>
								<img src="img/x.gif" class="unit u35" title="Javali" alt="Javali" />
							</td><td>
								<img src="img/x.gif" class="unit u36" title="Lobo" alt="Lobo" />

							</td><td>
								<img src="img/x.gif" class="unit u37" title="Urso" alt="Urso" />
							</td><td>
								<img src="img/x.gif" class="unit u38" title="Crocodilo" alt="Crocodilo" />
							</td><td>
								<img src="img/x.gif" class="unit u39" title="Tigre" alt="Tigre" />
							</td><td>
								<img src="img/x.gif" class="unit u40" title="Elefante" alt="Elefante" />
							</td></tr>
				</thead>
				<tbody>
					<tr>
						<th>

							Tropas
						</th>
                                <td <?php if (!$form->getValue('a2_31')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_31');} ?></td>
                                <td <?php if (!$form->getValue('a2_32')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_32');} ?></td>
                                <td <?php if (!$form->getValue('a2_33')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_33');} ?></td>
                                <td <?php if (!$form->getValue('a2_34')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_34');} ?></td>
                                <td <?php if (!$form->getValue('a2_35')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_35');} ?></td>
                                <td <?php if (!$form->getValue('a2_36')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_36');} ?></td>
                                <td <?php if (!$form->getValue('a2_37')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_37');} ?></td>
                                <td <?php if (!$form->getValue('a2_38')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_38');} ?></td>
                                <td <?php if (!$form->getValue('a2_39')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_39');} ?></td>
                                <td <?php if (!$form->getValue('a2_40')) { echo "class=\"none\">0"; }else{ echo ">".$form->getValue('a2_40');} ?></td>
                                </tr>
					<tr>

						<th>
							Perdas
						</th>
						</th>
                        <td <?php if (!$troops = $form->getValue('a2_31')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_32')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_33')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_34')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_35')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_36')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_37')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_38')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_39')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        <td <?php if (!$troops = $form->getValue('a2_40')) { echo "class=\"none\">0"; }else{ echo ">".$dead = round($troops * $_POST['result'][2]);} ?></td>
                        </tr>

				</tbody>
			</table>
