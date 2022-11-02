<h1>Perfil do jogador</h1>

<?php include("menu.tpl"); ?>
<form action="spieler.php" method="POST">
<input type="hidden" name="ft" value="p3">
<input type="hidden" name="uid" value="<?php echo $session->uid; ?>" />
<table cellpadding="1" cellspacing="1" id="change_pass" class="account">
<thead><tr>
    <th colspan="2">Mudar senha</th>
</tr></thead><tbody>
<tr>
    <th>Senha antiga</th>
    <td><input class="text" type="password" name="pw1" maxlength="30" /></td>
</tr>

<tr>
    <th>Nova senha</th>
    <td><input class="text" type="password" name="pw2" maxlength="30" /></td>
</tr>
<tr>
    <th>Nova senha</th>
    <td><input class="text" type="password" name="pw3" maxlength="30" /></td>
</tr></tbody></table>
<?php
if($form->getError("pw") != "") {
echo "<span class=\"error\">".$form->getError('pw')."</span>";
}
?>
<table cellpadding="1" cellspacing="1" id="change_mail" class="account"><thead><tr>
        <th colspan="2">Mudar e-mail</th>

    </tr></thead>
    <tbody><tr>
        <td class="note" colspan="2">Digite seus antigos e seus novos endereços de e-mail. Em seguida, você receberá um fragmento de código em ambos os endereços de e-mail que você deve inserir aqui.</td></tr>
    <tr>
        <th>E-mail antigo</th>
        <td><input class="text" type="text" name="email_alt" /></td>
    </tr>
    <tr>

        <th>E-email novo</th>
        <td><input class="text" type="text" name="email_neu" /></td>
    </tr></tbody></table>
<?php
if($form->getError("email") != "") {
echo "<span class=\"error\">".$form->getError('email')."</span>";
}
?>
    <table cellpadding="1" cellspacing="1" id="sitter" class="account"><thead>
<tr>
    <th colspan="2">Assistente da conta (Babá)</th>
</tr></thead>
<tbody><tr>
    <td class="note" colspan="2">Um assistente pode fazer login em sua conta usando seu nome e a senha dele. (sua senha jamais será usada por outro jogador) Você pode ter até dois assistentes.</td>
</tr>
    <?php
    $count = 0;
    if($session->userinfo['sit1'] != 0) $count +=1; if($session->userinfo['sit2'] !=0) $count += 1;
    if($count < 2) {
    ?>
<tr>
    <th>Nome do assistente</th>
    <td><input class="text" type="text" name="v1" maxlength="15"><span class="count">(<?php echo $count; ?>/2)</span></td>
</tr>
<?php 
}
?><tr><td colspan="2" class="sitter">
<?php if($count == 0) { echo "<span class=\"none\">Você não tem assistente.</span></td>"; }
if($session->userinfo['sit1'] != 0) {
	echo "<div>";
    echo "<a href=\"spieler.php?s=3&e=3&id=".$session->userinfo['sit1']."&a=".$session->checker."&type=1\"><img class=\"del\" src=\"img/x.gif\" title=\"Remover assistente\" alt=\"Remover assistente\" /></a>";
    echo "<a href=\"spieler.php?uid=".$session->userinfo['sit1']."\">".$database->getUserField($session->userinfo['sit1'],"username",0)."</a>";
    echo "</div>";
}
if($session->userinfo['sit2'] != 0) {
echo "<div>";
echo "<a href=\"spieler.php?s=3&e=3&id=".$session->userinfo['sit2']."&a=".$session->checker."&type=2\"><img class=\"del\" src=\"img/x.gif\" title=\"Remover assistente\" alt=\"Remover assistente\" /></a>";
echo "<a href=\"spieler.php?uid=".$session->userinfo['sit2']."\">".$database->getUserField($session->userinfo['sit2'],"username",0)."</a>";
    echo "</div>";
}
?></tr>
<tr><td class="note" colspan="2">Você foi inscrito como assistente nas seguintes contas. Você pode cancelar isso clicando no X vermelho.</td></tr><tr><td colspan="2" class="sitter">
<?php 
$sitee = $database->getSitee($session->uid);
if(count($sitee) == 0) {
echo "<span class=\"none\">Você não tem assistentes.</span>";
}
else {
foreach($sitee as $sit) {
echo "<div>";
echo "<a href=\"spieler.php?s=3&e=2&id=".$sit['id']."&a=".$session->checker."\"><img class=\"del\" src=\"img/x.gif\" title=\"Remover assistente\" alt=\"Remover assistente\" /></a>";
echo "<a href=\"spieler.php?uid=".$sit['id']."\">".$database->getUserField($sit['id'],"username",0)."</a>";
    echo "</div>";
}
}
?>
</td></tr></table>
<?php
if($form->getError("email") != "") {
echo "<span class=\"error\">".$form->getError('email')."</span>";
}
?>
    <table cellpadding="1" cellspacing="1" id="del_acc" class="account"><thead>
<tr>
    <th colspan="2">Deletar conta</th>
</tr>
</thead><tbody>
<tr>
	<td class="note" colspan="2">Você pode excluir sua conta aqui. Após iniciar o cancelamento, serão necessários três dias para concluir o cancelamento da sua conta. Você pode cancelar este processo nas primeiras 24 horas.</td>
</tr><tr>
<?php
$timestamp = $database->isDeleting($session->uid);
if($timestamp) {
echo "<td colspan=\"2\" class=\"count\">";
echo "<a href=\"spieler.php?s=3&id=".$session->uid."&a=1&e=4\"><img
		class=\"del\" src=\"img/x.gif\" alt=\"Cancel process\"
		title=\"Cancel process\" /> </a>";
		$time=$generator->getTimeFormat(($timestamp-time()));
        echo "A conta será excluída em <span
		id=\"timer1\">".$time."</span> .</td>";
}
else {
?>
<th>Deletar a conta?</th>
        <td class="del_selection">
            <label><input class="radio" type="radio" name="del" value="1" /> Sim</label>
            <label><input class="radio" type="radio" name="del" value="0" checked /> Não</label>
        </td>
    </tr>
    <tr>
        <th>Confirme com a senha:</th>

        <td><input class="text" type="password" name="del_pw" maxlength="20" /></td>
        <?php 
        }
        ?>
    </tr></tbody></table>
    <?php
if($form->getError("del") != "") {
echo "<span class=\"error\">".$form->getError("del")."</span>";
}
?>
    <p class="btn"><input type="image" value="" name="s1" id="btn_save" class="dynamic_img" src="img/x.gif" alt="Salvar" /></p>
</form>
