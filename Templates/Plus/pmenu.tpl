	<div id="content"  class="plus">
<h1></h1>
<div id="textmenu">
   <a href="plus.php?id=3" <?php

        if(isset($_GET['id']) && $_GET['id'] == 3) {
        	echo "class=\"selected\"";
        }
        if(isset($_GET['id']) && $_GET['id'] >= 6) {
        	echo "class=\"selected\"";
        }

?>></a>
</div>