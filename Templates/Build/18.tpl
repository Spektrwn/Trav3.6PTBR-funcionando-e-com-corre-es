<div id="build" class="gid18"><a href="#" onClick="return Popup(18,4);" class="build_logo">
	<img class="building g18" src="img/x.gif" alt="Embaixada" title="Embaixada" />
</a>
<h1>Embaixada <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">A embaixada é um lugar para diplomacias. Quanto maior o seu nível, mais opções o rei ganha.</p>

<?php
if($village->resarray['f'.$id] >= 3 && $session->alliance == 0) {
include("18_create.tpl");
}
if($session->alliance != 0) {
echo "
<table cellpadding=\"1\" cellspacing=\"1\" id=\"ally_info\">
	<thead><tr>
		<th colspan=\"2\">Aliança</th>
	</tr></thead>

	<tbody><tr>
		<th>Identificação</th>
		<td>".$alliance->allianceArray['tag']."</td>
	</tr>
	<tr>
		<th>Nome</th>
		<td>".$alliance->allianceArray['name']."</td>

	</tr>
	<tr>
		<td class=\"empty\" colspan=\"2\"></td>
	</tr>
	<tr>
		<td colspan=\"2\"><a href=\"allianz.php\">&nbsp;&raquo; para a aliança</a></td>
	</tr></tbody>
	</table>";
    }
    else {
    ?>
<table cellpadding="1" cellspacing="1" id="join">
<form method="post" action="build.php">
<input type="hidden" name="id" value="<?php echo $id ?>">
<input type="hidden" name="a" value="2">

<thead><tr>
	<th colspan="3">Juntar-se à aliança</th>
</tr></thead>
<tbody><tr>
	<?php
    if($alliance->gotInvite) {
    	foreach($alliance->inviteArray as $invite) {
        	 echo "<td class=\"abo\"><a href=\"build.php?id=".$id."&a=2&d=".$invite['id']."\"><img class=\"del\" src=\"img/x.gif\" alt=\"recusar\" title=\"recusar\" /></a></td>
        <td class=\"nam\"><a href=\"allianz.php?aid=".$invite['alliance']."\">&nbsp;".$database->getAllianceName($invite['alliance'])."</a></td>
        <td class=\"acc\"><a href=\"build.php?id=".$id."&a=3&d=".$invite['id']."\">&nbsp;aceitar</a></td><tr>";
        }
        }
    else {
		echo "<td colspan=\"3\" class=\"none\">Não há convites disponíveis.</td>";
        }
        ?>
	</tr></tbody></table>
    <?php
        if($alliance->gotInvite) {
        echo "<p class=\"error2\" style=\"color: #DD0000\">".$form->getError("ally_accept")."</p>";
        } 
    }
include("upgrade.tpl");
?>
</p></div>
