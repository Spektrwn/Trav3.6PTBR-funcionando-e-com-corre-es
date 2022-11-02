<tbody>
		<tr>
			<th>Outros</th>

		</tr>
		<tr>
			<td class="details">
				<table cellpadding="1" cellspacing="1">
					<tr>
					    <td class="ico"><img src="img/x.gif" class="unit uhab" alt="População" title="População" /></td>
					    <td class="desc">População</td>
					    <td class="value"><input class="text" type="text" name="ew2" value="<?php echo $form->getValue('ew2')==""? 1 : $form->getValue('ew2'); ?>" maxlength="4" title="number População" /></td>

					    <td class="research"></td>
				    </tr>
                    <?php
                    if(in_array(1,$target)) {
					if($_POST['wall1'] != 0){
					$wall1 = $_POST['wall1'];
					}else{
					$wall1 = 0;
					}
                    echo "<tr>
						    <td class=\"ico\"><img src=\"img/x.gif\" class=\"unit uwall\" alt=\"Muralha\" title=\"Muralha\" /></td>
						    <td class=\"desc\">Muralha</td>
						    <td class=\"value\"><input class=\"text\" type=\"text\" name=\"wall1\" value=\"$wall1\" maxlength=\"2\" title=\"Muralha Nível\" /></td>
						    <td class=\"research\"></td>
				    	</tr>";
                    }
                    if(in_array(2,$target)) {
					if($_POST['wall2'] != 0){
					$wall2 = $_POST['wall2'];
					}else{
					$wall2 = 0;
					}
                    echo "<tr>
						    <td class=\"ico\"><img src=\"img/x.gif\" class=\"unit ubarr\" alt=\"Barreira\" title=\"Barreira\" /></td>

						    <td class=\"desc\">Barreira</td>
						    <td class=\"value\"><input class=\"text\" type=\"text\" name=\"wall2\" value=\"$wall2\" maxlength=\"2\" title=\"Barreira Nível\" /></td>
						    <td class=\"research\"></td>
					    </tr>";
                    }
                    if(in_array(3,$target)) {
					if($_POST['wall3'] != 0){
					$wall3 = $_POST['wall3'];
					}else{
					$wall3 = 0;
					}
                    echo "<tr>
						    <td class=\"ico\"><img src=\"img/x.gif\" class=\"unit ustock\" alt=\"Paliçada\" title=\"Paliçada\" /></td>
						    <td class=\"desc\">Paliçada</td>
						    <td class=\"value\"><input class=\"text\" type=\"text\" name=\"wall3\" value=\"$wall3\" maxlength=\"2\" title=\" Paliçada Nível\" /></td>
						    <td class=\"research\"></td>

					    </tr>";
                    }
                    ?>
                        <tr>
					    <td class="ico"><img src="img/x.gif" class="unit upal" alt="Palácio" title="Palácio" /></td>
					    <td class="desc" title="Palácio/Residencia">Palácio</td>
					    <td class="value"><input class="text" type="text" name="palast" value="<?php echo $form->getValue('palast')==""? 0 : $form->getValue('palast'); ?>" maxlength="2" title="Palácio Nível" /></td>
					    <td class="research"></td>
				    </tr>
				    <tr>
					    <td class="ico"><img src="img/x.gif" class="unit upal" alt="Pedreiro" title="Pedreiro" /></td>
					    <td class="desc" title="Pedreiro">Pedreiro</td>
					    <td class="value"><input class="text" type="text" name="stonemason" value="<?php echo $form->getValue('stonemason')==""? 0 : $form->getValue('stonemason'); ?>" maxlength="2" title="Pedreiro Nível" /></td>
					    <td class="research"></td>
				    </tr>
				</table>
			</td>
		</tr></tbody></table>
