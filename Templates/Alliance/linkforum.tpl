<?php
if(isset($aid)) {
$aid = $aid;
}
else {
$aid = $session->alliance;
}
$allianceinfo = $database->getAlliance($aid);
echo "<h1>".$allianceinfo['tag']." - ".$allianceinfo['name']."</h1>";
include("alli_menu.tpl"); 
?>
<form method="post" action="allianz.php">
<input type="hidden" name="a" value="5">
<input type="hidden" name="o" value="5">
<input type="hidden" name="s" value="5">

<tr>
<th colspan="2">Atalho para o fórum</th>
</tr>

</thead><tbody>

<tr><th>URL</th>
<td><input class="link text" type="text" name="f_link" value="<?php echo $allianceinfo['forumlink']; ?>" maxlength="200"></td>
</tr>

<tr>
<td colspan="2" class="info">Se sua aliança quiser usar um fórum externo, você pode entrar no URL aqui.</td>
</tr></tbody>
</table>

<p><input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" /></form></p>