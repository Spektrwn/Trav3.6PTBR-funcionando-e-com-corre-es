<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       medals.php                                                  ##
##  Developed by:  Dixie                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

/******************************
INDELING CATEGORIEEN:
===============================
== 1. Aanvallers top 10      ==
== 2. Defence top 10         ==
== 3. Klimmers top 10        ==
== 4. Overvallers top 10     ==
== 5. In att en def tegelijk ==
== 6. in top 3 - aanval      ==
== 7. in top 3 - verdediging ==
== 8. in top 3 - klimmers    ==
== 9. in top 3 - overval     ==
******************************/
include_once("GameEngine/Account.php");

mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);

if (mysql_num_rows(mysql_query("SELECT id FROM ".TB_PREFIX."users WHERE access = 9 AND id = ".$session->uid)) != '1') die("Hacking attemp!");

		//bepaal welke week we zitten
		$q = "SELECT * FROM ".TB_PREFIX."medal order by week DESC LIMIT 0, 1";
		$result = mysql_query($q);
		if(mysql_num_rows($result)) {
			$row=mysql_fetch_assoc($result);
			$week=($row['week']+1);
		} else {
			$week='1';
		}

		//Do same for ally week
		$q = "SELECT * FROM ".TB_PREFIX."allimedal order by week DESC LIMIT 0, 1";
		$result = mysql_query($q);
		if(mysql_num_rows($result)) {
			$row=mysql_fetch_assoc($result);
			$allyweek=($row['week']+1);
		} else {
			$allyweek='1';
		}

	//we mogen de lintjes weggeven
	if(isset($_GET['giveout'])){


	//Aanvallers v/d Week
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and ap > 0 ORDER BY ap DESC Limit 10");
	$i=0; 	while($row = mysql_fetch_array($result)){
	$i++;	$img="t2_".($i)."";
	$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '1', '".($i)."', '".$week."', '".$row['ap']."', '".$img."')";
	$resul=mysql_query($quer);
	}

	//Verdediger v/d Week
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and dp > 0 ORDER BY dp DESC Limit 10");
	$i=0; 	while($row = mysql_fetch_array($result)){
	$i++;	$img="t3_".($i)."";
	$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '2', '".($i)."', '".$week."', '".$row['dp']."', '".$img."')";
	$resul=mysql_query($quer);
	}

	//Rank climbers of the week
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and clp > 0 ORDER BY clp DESC Limit 10");
	$i=0;     while($row = mysql_fetch_array($result)){
	$i++;    $img="t1_".($i)."";
	$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '10', '".($i)."', '".$week."', '".$row['clp']."', '".$img."')";
	$resul=mysql_query($quer);
	}

	//Overvallers v/d Week
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and RR > 0 ORDER BY RR DESC Limit 10");
	$i=0; 	while($row = mysql_fetch_array($result)){
	$i++;	$img="t4_".($i)."";
	$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '4', '".($i)."', '".$week."', '".$row['RR']."', '".$img."')";
	$resul=mysql_query($quer);
	}

	//deel de bonus voor aanval+defence top 10 uit
	//Pak de top10 aanvallers
		$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and ap > 0 ORDER BY ap DESC Limit 10");
	while($row = mysql_fetch_array($result)){

		 //Pak de top10 verdedigers
		$result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and dp > 0 ORDER BY dp DESC Limit 10");
		while($row2 = mysql_fetch_array($result2)){
			if($row['id']==$row2['id']){

			$query3="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 5";
			$result3=mysql_query($query3);
			 $row3=mysql_fetch_row($result3);

				//kijk welke kleur het lintje moet hebben
				if($row3[0]<='2'){
					$img="t22".$row3[0]."_1";
						switch ($row3[0]) {
							case "0":
								$tekst="";
								break;
							case "1":
								$tekst="twice ";
								break;
							case "2":
								$tekst="three times ";
								break;
						}
					$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '5', '0', '".$week."', '".$tekst."', '".$img."')";
					$resul=mysql_query($quer);
				}
			}
		}
	}

	//je staat voor 3e / 5e / 10e keer in de top 3 aanvallers
	//Pak de top10 aanvallers
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and ap > 0 ORDER BY ap DESC Limit 10");
	while($row = mysql_fetch_array($result)){

			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 1 AND plaats<=3";
			$result1=mysql_query($query1);
			$row1=mysql_fetch_row($result1);


		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){
			$img="t120_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '6', '0', '".$week."', 'Three', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){
			$img="t121_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '6', '0', '".$week."', 'Five', '".$img."')";
			$resul=mysql_query($quer);
		}
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){
			$img="t122_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '6', '0', '".$week."', 'Ten', '".$img."')";
			$resul=mysql_query($quer);
		}

	}
	//je staat voor 3e / 5e / 10e keer in de top 10 aanvallers
	//Pak de top10 aanvallers
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and ap > 0 ORDER BY ap DESC Limit 10");
	while($row = mysql_fetch_array($result)){

			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 1 AND plaats<=10";
			$result1=mysql_query($query1);
			 $row1=mysql_fetch_row($result1);


		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){
			$img="t130_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '12', '0', '".$week."', 'Three', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){
			$img="t131_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '12', '0', '".$week."', 'Five', '".$img."')";
			$resul=mysql_query($quer);
		}
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){
			$img="t132_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '12', '0', '".$week."', 'Ten', '".$img."')";
			$resul=mysql_query($quer);
		}

	}
	//je staat voor 3e / 5e / 10e keer in de top 3 verdedigers
	//Pak de top10 verdedigers
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and dp > 0 ORDER BY dp DESC Limit 10");
	while($row = mysql_fetch_array($result)){

			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 2 AND plaats<=3";
			$result1=mysql_query($query1);
			$row1=mysql_fetch_row($result1);


		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){
			$img="t140_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '7', '0', '".$week."', 'Three', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){
			$img="t141_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '7', '0', '".$week."', 'Five', '".$img."')";
			$resul=mysql_query($quer);
		}
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){
			$img="t142_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '7', '0', '".$week."', 'Ten', '".$img."')";
			$resul=mysql_query($quer);
		}

	}
	//je staat voor 3e / 5e / 10e keer in de top 3 verdedigers
	//Pak de top10 verdedigers
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and dp > 0 ORDER BY dp DESC Limit 10");
	while($row = mysql_fetch_array($result)){

			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 2 AND plaats<=10";
			$result1=mysql_query($query1);
			 $row1=mysql_fetch_row($result1);


		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){
			$img="t150_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '13', '0', '".$week."', 'Three', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){
			$img="t151_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '13', '0', '".$week."', 'Five', '".$img."')";
			$resul=mysql_query($quer);
		}
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){
			$img="t152_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '13', '0', '".$week."', 'Ten', '".$img."')";
			$resul=mysql_query($quer);
		}

	}

	//je staat voor 3e / 5e / 10e keer in de top 3 klimmers
	//Pak de top10 klimmers
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and Rc > 0 ORDER BY Rc DESC Limit 10");
	while($row = mysql_fetch_array($result)){

			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 3 AND plaats<=3";
			$result1=mysql_query($query1);
			$row1=mysql_fetch_row($result1);


		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){
			$img="t100_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '8', '0', '".$week."', 'Three', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){
			$img="t101_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '8', '0', '".$week."', 'Five', '".$img."')";
			$resul=mysql_query($quer);
		}
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){
			$img="t102_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '8', '0', '".$week."', 'Ten', '".$img."')";
			$resul=mysql_query($quer);
		}
	}//je staat voor 3e / 5e / 10e keer in de top 3 klimmers
	//Pak de top10 klimmers
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and Rc > 0 ORDER BY Rc DESC Limit 10");
	while($row = mysql_fetch_array($result)){

			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 3 AND plaats<=10";
			$result1=mysql_query($query1);
			 $row1=mysql_fetch_row($result1);


		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){
			$img="t110_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '14', '0', '".$week."', 'Three', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){
			$img="t111_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '14', '0', '".$week."', 'Five', '".$img."')";
			$resul=mysql_query($quer);
		}
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){
			$img="t112_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '14', '0', '".$week."', 'Ten', '".$img."')";
			$resul=mysql_query($quer);
		}
	}

	//je staat voor 3e / 5e / 10e keer in de top 3 klimmers
	//Pak de top3 rank climbers
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and clp > 0 ORDER BY clp DESC Limit 10");
	while($row = mysql_fetch_array($result)){

			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 10 AND plaats<=3";
			$result1=mysql_query($query1);
			 $row1=mysql_fetch_row($result1);


		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){
			$img="t200_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '11', '0', '".$week."', 'Three', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){
			$img="t201_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '11', '0', '".$week."', 'Five', '".$img."')";
			$resul=mysql_query($quer);
		}
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){
			$img="t202_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '11', '0', '".$week."', 'Ten', '".$img."')";
			$resul=mysql_query($quer);
		}
	}
	//je staat voor 3e / 5e / 10e keer in de top 10klimmers
	//Pak de top3 rank climbers
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and clp > 0 ORDER BY clp DESC Limit 10");
	while($row = mysql_fetch_array($result)){

			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 10 AND plaats<=10";
			$result1=mysql_query($query1);
			 $row1=mysql_fetch_row($result1);


		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){
			$img="t210_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '16', '0', '".$week."', 'Three', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){
			$img="t211_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '16', '0', '".$week."', 'Five', '".$img."')";
			$resul=mysql_query($quer);
		}
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){
			$img="t212_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '16', '0', '".$week."', 'Ten', '".$img."')";
			$resul=mysql_query($quer);
		}
	}

	//je staat voor 3e / 5e / 10e keer in de top 10 overvallers
	//Pak de top10 overvallers
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and RR > 0 ORDER BY RR DESC Limit 10");
	while($row = mysql_fetch_array($result)){

			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 4 AND plaats<=3";
			$result1=mysql_query($query1);
			$row1=mysql_fetch_row($result1);


		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){
			$img="t160_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '9', '0', '".$week."', 'Three', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){
			$img="t161_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '9', '0', '".$week."', 'Five', '".$img."')";
			$resul=mysql_query($quer);
		}
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){
			$img="t162_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '9', '0', '".$week."', 'Ten', '".$img."')";
			$resul=mysql_query($quer);
		}
	} //je staat voor 3e / 5e / 10e keer in de top 10 overvallers
	//Pak de top10 overvallers
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE id > 5 and RR > 0 ORDER BY RR DESC Limit 10");
	while($row = mysql_fetch_array($result)){

			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 4 AND plaats<=10";
			$result1=mysql_query($query1);
			 $row1=mysql_fetch_row($result1);


		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){
			$img="t170_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '15', '0', '".$week."', 'Three', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){
			$img="t171_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '15', '0', '".$week."', 'Five', '".$img."')";
			$resul=mysql_query($quer);
		}
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){
			$img="t172_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '15', '0', '".$week."', 'Ten', '".$img."')";
			$resul=mysql_query($quer);
		}
	}

	//Zet alle waardens weer op 0
	 $query="SELECT * FROM ".TB_PREFIX."users WHERE id > 5 ORDER BY id+0 DESC";
	 $result=mysql_query($query);
	 for ($i=0; $row=mysql_fetch_row($result); $i++){
	 mysql_query("UPDATE ".TB_PREFIX."users SET ap=0, dp=0,Rc=0,clp=0, RR=0 WHERE id = ".$row[0]."");
	}

	//Start alliance Medals wooot

	//Aanvallers v/d Week
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."alidata where ap > 0 ORDER BY ap DESC Limit 10");
	$i=0;     while($row = mysql_fetch_array($result)){
	$i++;    $img="a2_".($i)."";
	$quer="insert into ".TB_PREFIX."allimedal(allyid, categorie, plaats, week, points, img) values('".$row['id']."', '1', '".($i)."', '".$allyweek."', '".$row['ap']."', '".$img."')";
	$resul=mysql_query($quer);
	}

	//Verdediger v/d Week
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."alidata where dp > 0 ORDER BY dp DESC Limit 10");
	$i=0;     while($row = mysql_fetch_array($result)){
	$i++;    $img="a3_".($i)."";
	$quer="insert into ".TB_PREFIX."allimedal(allyid, categorie, plaats, week, points, img) values('".$row['id']."', '2', '".($i)."', '".$allyweek."', '".$row['dp']."', '".$img."')";
	$resul=mysql_query($quer);
	}

	  //Overvallers v/d Week
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."alidata where RR > 0 ORDER BY RR DESC Limit 10");
	$i=0;     while($row = mysql_fetch_array($result)){
	if($row['RR'] >= 0){
	$i++;    $img="a4_".($i)."";
	$quer="insert into ".TB_PREFIX."allimedal(allyid, categorie, plaats, week, points, img) values('".$row['id']."', '4', '".($i)."', '".$allyweek."', '".$row['RR']."', '".$img."')";
	$resul=mysql_query($quer);
	}
	}

	//Rank climbers of the week
	$result = mysql_query("SELECT * FROM ".TB_PREFIX."alidata where clp > 0 ORDER BY clp DESC Limit 10");
	$i=0;     while($row = mysql_fetch_array($result)){
	$i++;    $img="a1_".($i)."";
	$quer="insert into ".TB_PREFIX."allimedal(allyid, categorie, plaats, week, points, img) values('".$row['id']."', '3', '".($i)."', '".$allyweek."', '".$row['clp']."', '".$img."')";
	$resul=mysql_query($quer);
	}


	 $query="SELECT * FROM ".TB_PREFIX."alidata ORDER BY id+0 DESC";
	 $result=mysql_query($query);
	 for ($i=0; $row=mysql_fetch_row($result); $i++){
	 mysql_query("UPDATE ".TB_PREFIX."alidata SET ap=0, dp=0, RR=0, clp=0 WHERE id = ".$row[0]."");
	}
	}

?>

	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title><?php echo SERVER_NAME ?></title>
	<link REL="shortcut icon" HREF="favicon.ico"/>
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

	<script src="mt-full.js?0ac36" type="text/javascript"></script>
	<script src="unx.js?0ac36" type="text/javascript"></script>
	<script src="new.js?0ac36" type="text/javascript"></script>
	<link href="<?php echo GP_LOCATE; ?>lang/en/lang.css?f4b7c" rel="stylesheet" type="text/css" />
	<link href="<?php echo GP_LOCATE; ?>lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css" />
	<?php
	if($session->gpack == null || GP_ENABLE == false) {
	echo "
	<link href='".GP_LOCATE."travian.css?e21d2' rel='stylesheet' type='text/css' />
	<link href='".GP_LOCATE."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	} else {
	echo "
	<link href='".$session->gpack."travian.css?e21d2' rel='stylesheet' type='text/css' />
	<link href='".$session->gpack."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	}
	?>
	<script type="text/javascript">

		window.addEvent('domready', start);
	</script>
</head>
<body class="v35 ie ie8">
<div class="wrapper">
<img style="filter:chroma();" src="img/x.gif" id="msfilter" alt="" />
<div id="dynamic_header">
	</div>
<?php include("Templates/header.tpl"); ?>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>

<div id="content"  class="login">
<?php
if(isset($_GET['giveout'])){?>
<h1><br/>Medalhas Top 10</h1><br />
Done:<br />
-Top 10 Atacante<br />
-Top 10 Defensor<br />
-Top 10 Ladr??o<br />
-Top 10 Alian??a Atacante<br />
-Top 10 Alian??a Defensora<br />
-Top 10 Alian??a Ladr??es<br />
-Top 10 Alian??a Alpinistas<br />
-Top 10 Ranque Alpinista<br />
-B??nus: Atacante e Defensor<br />
-B??nus: 3/5/10 vezes em uma sequ??ncia top 3 Ranque Alpinista<br />
-B??nus: 3/5/10 vezes top 3 Ataque<br />
-B??nus: 3/5/10 vezes top 3 Defesa<br />
-B??nus: 3/5/10 vezes top 3 Ladr??o<br />

-B??nus: 3/5/10 vezes em sequ??ncia top 10 Ataque<br />
-B??nus: 3/5/10 vezes em sequ??ncia top 10 Defesa<br />
-B??nus: 3/5/10 vezes em sequ??ncia top 10 Ranque Alpinista<br />
-B??nus: 3/5/10 vezes em sequ??ncia top 10 Assaltante<br />



<?php
} else{ ?><h1><br/>Top 10 Medals</h1><br />
Clique <a href="?giveout">aqui</a>, para entregar as medalhas da <b>semana <?php echo $week; ?></b>!<br/>AVISO: Carregando a pr??xima p??gina pode levar algum tempo!
<?php } ?></div>
<div id="side_info" class="outgame">
</div>

<div class="clear"></div>
			</div>

			<div class="footer-stopper outgame"></div>
			<div class="clear"></div>

<div id="ce"></div>
</body>
</html>
<?php mysql_close(); ?>
