<?php if(GP_ENABLE) {
?>
<h1>Player profile</h1>

<?php include("menu.tpl"); ?>
<?php if(isset($_POST["custom_url"])) {
$database->updateUserField($session->uid,gpack,$_POST["custom_url"],1);
 } ?>
<?php if(isset($_GET["custom_url"])) {
?>
<link href="<?php echo $_GET["custom_url"]; ?>lang/en/gp_check.css" rel="stylesheet" type="text/css">
<div id="gpack_popup">
		
		<div id="gpack_error">
			<img class="logo unknown" src="img/x.gif" alt="unknown" title="unknown"><span class="error">Não foi possível encontrar o pacote gráfico. Isto pode dever-se às seguintes razões:</span><br>
<ul>
<li>O caminho deve ser definido para a pasta que contém o arquivo '<b>travian.css</b>' e as pastas '<b>img</b>', '<b>lang</b>' and '<b>modules</b>'.</li>
<li>Seu navegador não suporta Pacotes Gráficos hospedados em seu computador e precisa deles para estar on-line, com um caminho começando com '<b>http://</b>'.</li>
</ul>			<form action="spieler.php" method="post">
				<input type="hidden" name="s" value="4">
				<div class="btn"><input type="image" alt="OK" src="img/x.gif" value="ok" class="dynamic_img" id="btn_ok"></div>
			</form>
		</div>

		
		<div id="gpack_activate">
			<span class="info">Pacote gráfico encontrado.</span><br>
			<img id="preview" src="img/x.gif"><br>

			O caminho '<span class="path"><?php echo $_GET["custom_url"]; ?></span>' Mostra um pacote gráfico permitido. Salve sua escolha para ativar o pacote gráfico. Você pode alterar essa configuração a qualquer momento.
			
			<form action="spieler.php" method="post">
				<input type="hidden" name="s" value="4">
				<input type="hidden" name="custom_url" value="<?php echo $_GET["custom_url"]; ?>">
				<div class="btn"><input type="image" alt="save" src="img/x.gif" value="save" class="dynamic_img" id="btn_save" name="gp_activate_button"></div>
			</form>
		</div>
	</div>
<?php } ?>

<form action="spieler.php" method="post" name="gp_selection">
<input type="hidden" name="s" value="4" />
<table cellpadding="1" cellspacing="1" id="gpack">
    <thead>
        <tr>
            <th>Configurações do pacote gráfico</th>
        </tr>
	</thead>
 
			<tbody>
	        <tr>
	        	<td class="info">
	        		Com um pacote gráfico você pode alterar a aparência do Travian. Você pode escolher um da lista ou fornecer o caminho para um pacote gráfico no seu computador. Ao usar um pacote gráfico local, você pode reduzir o tempo de carregamento da página para cada solicitação de página.<br />
	        		<span class="alert">ATENÇÃO! Use apenas pacotes gráficos confiáveis</span>
	        	</td>
	        </tr>
	        <tr>
	        	<th class="empty"></th>
	        </tr>
	        <tr>
	            <td>
	            	<label>

                        <input type="radio" class="radio" name="gp_type" value="custom" checked="checked" />
                        Pacote de gráficos definidos pelo usuário                    </label>
                    <input class="text" type="text" name="custom_url" value="<?php echo $session->gpack; ?>" onclick="document.gp_selection.gp_type[1].checked = true" /><br />
                                        <div class="example">Exemplo: <span class="path">file:///C:/Travian/gpack/</span> ou <span class="path">http://www.travian.org/user/gpack/</span></div>
										<center><div class="example">Padrão: <span class="path"><?php echo GP_LOCATE; ?></span></div></center>
                </td>

            </tr>
        </tbody>
    </table>
    <p class="btn"><input type="image" alt="OK" src="img/x.gif" name="gp_selection_button" value="ok" class="dynamic_img" id="btn_ok" /></p>
    </form>


    <table cellpadding="1" cellspacing="1" id="download">
        <thead>
            <tr>

                <th colspan="4">Mais pacotes graficos</th>
            </tr>
            <tr>
                <td>Nome</td>
                <td>Tamanho em MB</td>
                <td>Ativar</td>
                <td>Download</td>

            </tr>
        </thead>
        <tbody>
                <tr>
                    <td class="nam">Travian Harbor</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/travian_Harbor/">Activate</a></td>

                    <td class="down"><a href="gpack/download/travian_Harbor.rar" target="_blank">Download</a></td>
                </tr>
				<?php
				/*
				<tr>
                    <td class="nam">Travian Basic - c/ erro - RETIRAR</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/travian_basic/">Activate</a></td>

                    <td class="down"><a href="gpack/download/travian_basic.rar" target="_blank">Download</a></td>
                </tr>
				*/?>
				<tr>
                    <td class="nam">WoodNL4</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/WoodNL4/">Activate</a></td>

                    <td class="down"><a href="gpack/download/WoodNL4.rar" target="_blank">Download</a></td>
                </tr>
				<tr>
                    <td class="nam">Travian Default</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/travian_default/">Activate</a></td>

                    <td class="down"><a href="gpack/download/travian_default.rar" target="_blank">Download</a></td>
                </tr>
				<tr>
                    <td class="nam">Travian Negative</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/Negatief/">Activate</a></td>

                    <td class="down"><a href="gpack/download/Negatief.rar" target="_blank">Download</a></td>
                </tr>
				<tr>
                    <td class="nam">Travian Herfstpakket</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/Herfstpakket/">Activate</a></td>

                    <td class="down"><a href="gpack/download/Herfstpakket.rar" target="_blank">Download</a></td>
                </tr>
				<tr>
                    <td class="nam">Travian Green Land</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/green_land/">Activate</a></td>

                    <td class="down"><a href="gpack/download/green_land.rar" target="_blank">Download</a></td>
                </tr>
				<tr>
                    <td class="nam">Travian X V1</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/gpack_travianx_v1/">Activate</a></td>

                    <td class="down"><a href="gpack/download/gpack_travianx_v1.rar" target="_blank">Download</a></td>
                </tr>
				<tr>
                    <td class="nam">Travian City</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/travian_city/">Activate</a></td>

                    <td class="down"><a href="gpack/download/travian_city.rar" target="_blank">Download</a></td>
                </tr>
                    </tbody>
    </table>
    <?php
    }else{
	header("Location: ".$_SERVER['PHP_SELF']."?uid=".$session->uid);
	}
    ?>