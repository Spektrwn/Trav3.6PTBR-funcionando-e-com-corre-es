<!-- //////////////// made by TTMTT //////////////// -->
<?php
if($session->access!=BANNED){
?>
<form method="post" name="post" action="allianz.php?s=2&fid=<?php echo $_GET['fid']; ?>&pid=<?php echo $_GET['pid']; ?>">
	<input type="hidden" name="newtopic" value="1">
	<input type="hidden" name="pid" value="<?php echo $_GET['pid']; ?>">
	<input type="hidden" name="fid" value="<?php echo $_GET['fid']; ?>">
	<input type="hidden" name="ac" value="newtopic">

	<input type="hidden" name="checkstr" value="c4ca4238a0b923820dcc509a6f75849b"><table cellpadding="1" cellspacing="1" id="new_topic"><thead>
	<tr>
        <th colspan="3">Postar novo tópico</th>
	</tr>
	</thead>
	<tfoot><tr><th colspan="3">&nbsp;</th></tr></tfoot>
	<tbody>
	<tr>

		<th>Tópico</td>
		<td colspan="2"><input class="text" type="text" name="thema" maxlength="35"></td>
	</tr>
	<tr>
	<td>
	</td>
	<td colspan="2">
	
			<div bbArea="text" id="text_container" name="text_container">

				<div id="text_toolbar" name="text_toolbar">
					<a href="javascript:void(0);" bbType="d" bbTag="b" ><div title="bold" alt="bold" class="bbButton bbBold"></div></a>
					<a href="javascript:void(0);" bbType="d" bbTag="i" ><div title="italic" alt="italic" class="bbButton bbItalic"></div></a>
					<a href="javascript:void(0);" bbType="d" bbTag="u" ><div title="underlined" alt="underlined" class="bbButton bbUnderscore"></div></a>
					<a href="javascript:void(0);" bbType="d" bbTag="alliance0" ><div title="Alliance" alt="Alliance" class="bbButton bbAlliance"></div></a>
					<a href="javascript:void(0);" bbType="d" bbTag="player0" ><div title="Player" alt="Player" class="bbButton bbPlayer"></div></a>
					<a href="javascript:void(0);" bbType="d" bbTag="coor0" ><div title="Coordinates" alt="Coordinates" class="bbButton bbCoordinate"></div></a>
					<a href="javascript:void(0);" bbType="d" bbTag="report0" ><div title="Report" alt="Report" class="bbButton bbReport"></div></a>
					<a href="javascript:void(0);" bbWin="resources" id="text_resourceButton"><div title="Resources" alt="Resources" class="bbButton bbResource"></div></a>

					<a href="javascript:void(0);" bbWin="smilies" id="text_smilieButton"><div title="Smilies" alt="Smilies" class="bbButton bbSmilie"></div></a>
					<a href="javascript:void(0);" bbWin="troops" id="text_troopButton"><div title="Troops" alt="Troops" class="bbButton bbTroop"></div></a>
					<a href="javascript:void(0);" id="text_previewButton" bbArea="text"><div title="Preview" alt="Preview" class="bbButton bbPreview"></div></a>
					<div class="clear"></div>
					<div id="text_toolbarWindows">
						<div id="text_resources" name="text_resources">
								<a href="javascript:void(0);" bbType="o" bbTag="lumber" ><img src="img/x.gif" class="r1" title="Wood" alt="Wood" /></a>
								<a href="javascript:void(0);" bbType="o" bbTag="clay" ><img src="img/x.gif" class="r2" title="Clay" alt="Clay" /></a>
								<a href="javascript:void(0);" bbType="o" bbTag="iron" ><img src="img/x.gif" class="r3" title="Iron" alt="Iron" /></a>
							<a href="javascript:void(0);" bbType="o" bbTag="crop" ><img src="img/x.gif" class="r4" title="Crop" alt="Crop" /></a></div>
						<div id="text_smilies" name="text_smilies"><a href="javascript:void(0);"  bbType="s" bbTag="*aha*" ><img class="smiley aha" src="img/x.gif" alt="*aha*" title="*aha*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*angry*" ><img class="smiley angry" src="img/x.gif" alt="*angry*" title="*angry*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*cool*" ><img class="smiley cool" src="img/x.gif" alt="*cool*" title="*cool*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*cry*" ><img class="smiley cry" src="img/x.gif" alt="*cry*" title="*cry*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*cute*" ><img class="smiley cute" src="img/x.gif" alt="*cute*" title="*cute*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*depressed*" ><img class="smiley depressed" src="img/x.gif" alt="*depressed*" title="*depressed*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*eek*" ><img class="smiley eek" src="img/x.gif" alt="*eek*" title="*eek*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*ehem*" ><img class="smiley ehem" src="img/x.gif" alt="*ehem*" title="*ehem*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*emotional*" ><img class="smiley emotional" src="img/x.gif" alt="*emotional*" title="*emotional*" /></a><a href="javascript:void(0);"  bbType="s" bbTag=":D" ><img class="smiley grin" src="img/x.gif" alt=":D" title=":D" /></a><a href="javascript:void(0);"  bbType="s" bbTag=":)" ><img class="smiley happy" src="img/x.gif" alt=":)" title=":)" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*hit*" ><img class="smiley hit" src="img/x.gif" alt="*hit*" title="*hit*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*hmm*" ><img class="smiley hmm" src="img/x.gif" alt="*hmm*" title="*hmm*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*hmpf*" ><img class="smiley hmpf" src="img/x.gif" alt="*hmpf*" title="*hmpf*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*hrhr*" ><img class="smiley hrhr" src="img/x.gif" alt="*hrhr*" title="*hrhr*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*huh*" ><img class="smiley huh" src="img/x.gif" alt="*huh*" title="*huh*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*lazy*" ><img class="smiley lazy" src="img/x.gif" alt="*lazy*" title="*lazy*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*love*" ><img class="smiley love" src="img/x.gif" alt="*love*" title="*love*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*nocomment*" ><img class="smiley nocomment" src="img/x.gif" alt="*nocomment*" title="*nocomment*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*noemotion*" ><img class="smiley noemotion" src="img/x.gif" alt="*noemotion*" title="*noemotion*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*notamused*" ><img class="smiley notamused" src="img/x.gif" alt="*notamused*" title="*notamused*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*pout*" ><img class="smiley pout" src="img/x.gif" alt="*pout*" title="*pout*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*redface*" ><img class="smiley redface" src="img/x.gif" alt="*redface*" title="*redface*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*rolleyes*" ><img class="smiley rolleyes" src="img/x.gif" alt="*rolleyes*" title="*rolleyes*" /></a><a href="javascript:void(0);"  bbType="s" bbTag=":(" ><img class="smiley sad" src="img/x.gif" alt=":(" title=":(" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*shy*" ><img class="smiley shy" src="img/x.gif" alt="*shy*" title="*shy*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*smile*" ><img class="smiley smile" src="img/x.gif" alt="*smile*" title="*smile*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*tongue*" ><img class="smiley tongue" src="img/x.gif" alt="*tongue*" title="*tongue*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*veryangry*" ><img class="smiley veryangry" src="img/x.gif" alt="*veryangry*" title="*veryangry*" /></a><a href="javascript:void(0);"  bbType="s" bbTag="*veryhappy*" ><img class="smiley veryhappy" src="img/x.gif" alt="*veryhappy*" title="*veryhappy*" /></a><a href="javascript:void(0);"  bbType="s" bbTag=";)" ><img class="smiley wink" src="img/x.gif" alt=";)" title=";)" /></a></div>
						<div id="text_troops" name="text_troops"><a href="javascript:void(0);" bbType="o" bbTag="tid1" ><img class="unit u1" src="img/x.gif"  title="Legionnaire" alt="Legionnaire" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid2" ><img class="unit u2" src="img/x.gif"  title="Praetorian" alt="Praetorian" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid3" ><img class="unit u3" src="img/x.gif"  title="Imperian" alt="Imperian" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid4" ><img class="unit u4" src="img/x.gif"  title="Equites Legati" alt="Equites Legati" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid5" ><img class="unit u5" src="img/x.gif"  title="Equites Imperatoris" alt="Equites Imperatoris" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid6" ><img class="unit u6" src="img/x.gif"  title="Equites Caesaris" alt="Equites Caesaris" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid7" ><img class="unit u7" src="img/x.gif"  title="Ram" alt="Ram" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid8" ><img class="unit u8" src="img/x.gif"  title="Fire Catapult" alt="Fire Catapult" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid9" ><img class="unit u9" src="img/x.gif"  title="Senator" alt="Senator" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid10" ><img class="unit u10" src="img/x.gif"  title="Settler" alt="Settler" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid11" ><img class="unit u11" src="img/x.gif"  title="Maceman" alt="Maceman" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid12" ><img class="unit u12" src="img/x.gif"  title="Spearman" alt="Spearman" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid13" ><img class="unit u13" src="img/x.gif"  title="Axeman" alt="Axeman" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid14" ><img class="unit u14" src="img/x.gif"  title="Scout" alt="Scout" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid15" ><img class="unit u15" src="img/x.gif"  title="Paladin" alt="Paladin" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid16" ><img class="unit u16" src="img/x.gif"  title="Teutonic Knight" alt="Teutonic Knight" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid17" ><img class="unit u17" src="img/x.gif"  title="Ram" alt="Ram" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid18" ><img class="unit u18" src="img/x.gif"  title="Catapult" alt="Catapult" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid19" ><img class="unit u19" src="img/x.gif"  title="Chieftain" alt="Chieftain" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid20" ><img class="unit u20" src="img/x.gif"  title="Settler" alt="Settler" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid21" ><img class="unit u21" src="img/x.gif"  title="Phalanx" alt="Phalanx" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid22" ><img class="unit u22" src="img/x.gif"  title="Swordsman" alt="Swordsman" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid23" ><img class="unit u23" src="img/x.gif"  title="Pathfinder" alt="Pathfinder" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid24" ><img class="unit u24" src="img/x.gif"  title="Theutates Thunder" alt="Theutates Thunder" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid25" ><img class="unit u25" src="img/x.gif"  title="Druidrider" alt="Druidrider" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid26" ><img class="unit u26" src="img/x.gif"  title="Haeduan" alt="Haeduan" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid27" ><img class="unit u27" src="img/x.gif"  title="Battering Ram" alt="Battering Ram" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid28" ><img class="unit u28" src="img/x.gif"  title="Trebuchet" alt="Trebuchet" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid29" ><img class="unit u29" src="img/x.gif"  title="Chief" alt="Chief" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid30" ><img class="unit u30" src="img/x.gif"  title="Settler" alt="Settler" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid31" ><img class="unit u31" src="img/x.gif"  title="Rat" alt="Rat" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid32" ><img class="unit u32" src="img/x.gif"  title="Spider" alt="Spider" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid33" ><img class="unit u33" src="img/x.gif"  title="Snake" alt="Snake" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid34" ><img class="unit u34" src="img/x.gif"  title="Bat" alt="Bat" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid35" ><img class="unit u35" src="img/x.gif"  title="Wild Boar" alt="Wild Boar" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid36" ><img class="unit u36" src="img/x.gif"  title="Wolf" alt="Wolf" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid37" ><img class="unit u37" src="img/x.gif"  title="Bear" alt="Bear" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid38" ><img class="unit u38" src="img/x.gif"  title="Crocodile" alt="Crocodile" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid39" ><img class="unit u39" src="img/x.gif"  title="Tiger" alt="Tiger" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid40" ><img class="unit u40" src="img/x.gif"  title="Elephant" alt="Elephant" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid41" ><img class="unit u41" src="img/x.gif"  title="Pikeman" alt="Pikeman" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid42" ><img class="unit u42" src="img/x.gif"  title="Thorned Warrior" alt="Thorned Warrior" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid43" ><img class="unit u43" src="img/x.gif"  title="Guardsman" alt="Guardsman" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid44" ><img class="unit u44" src="img/x.gif"  title="Birds of Prey" alt="Birds of Prey" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid45" ><img class="unit u45" src="img/x.gif"  title="Axerider" alt="Axerider" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid46" ><img class="unit u46" src="img/x.gif"  title="Natarian Knight" alt="Natarian Knight" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid47" ><img class="unit u47" src="img/x.gif"  title="War Elephant" alt="War Elephant" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid48" ><img class="unit u48" src="img/x.gif"  title="Ballista" alt="Ballista" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid49" ><img class="unit u49" src="img/x.gif"  title="Natarian Emperor" alt="Natarian Emperor" /></a><a href="javascript:void(0);" bbType="o" bbTag="tid50" ><img class="unit u50" src="img/x.gif"  title="Settler" alt="Settler" /></a><a href="javascript:void(0);" bbType="o" bbTag="hero" ><img class="unit uhero" src="img/x.gif" title="Hero" alt="Hero" /></a></div>
					</div>

				</div>
				<div class="line bbLine"></div>

				<textarea id="text" name="text"></textarea>
				<div id="text_preview" name="text_preview"></div>
			</div>

			<script>
				var bbEditor = new BBEditor("text");
			</script>
			
	</td></tr><tr>

		<th>survey</th>
		<td>
		<script language="JavaScript" type="text/javascript">
		<!--
			function vote() {
			if (document.post.umfrage.checked == true){
				document.post.umfrage_thema.disabled = false;
				document.getElementById('options').className = '';
				document.post.umfrage_thema.focus();

			} else {
				document.post.umfrage_thema.disabled = true;
				document.getElementById('options').className = 'hide';
			}
		}
		//-->
		</script>
			<input class="text" type="text" name="umfrage_thema" maxlength="60" disabled="disabled" /></td>
			<td class="sel"><input class="check" type="checkbox" name="umfrage" value="1" onclick="vote();" />
		</td>
	</tr>
	<tr id="options" class="hide">

		<th>Opções</th>
		<td>
<input class="text" type="text" name="option_1" maxlength="60" /><input class="text" type="text" name="option_2" maxlength="60" /><input class="text" type="text" name="option_3" maxlength="60" /><input class="text" type="text" name="option_4" maxlength="60" /><input class="text" type="text" name="option_5" maxlength="60" /><input class="text" type="text" name="option_6" maxlength="60" /><input class="text" type="text" name="option_7" maxlength="60" /><input class="text" type="text" name="option_8" maxlength="60" /></td><td></td>
		</tr>
<tr>
	<th>finaliza em</th>
	<td>
<script language="JavaScript" type="text/javascript">
<!--
	function voteEnd() {
	if (document.post.umfrage_ende.checked == true){
		document.post.month.disabled = false;
		document.post.day.disabled = false;
		document.post.year.disabled = false;
		document.post.hour.disabled = false;
		document.post.minute.disabled = false;document.post.meridiem[0].disabled = false;
		document.post.meridiem[1].disabled = false;
	} else {
		document.post.month.disabled = true;
		document.post.day.disabled = true;
		document.post.year.disabled = true;
		document.post.hour.disabled = true;
		document.post.minute.disabled = true;document.post.meridiem[0].disabled = true;
		document.post.meridiem[1].disabled = true;}
}
//-->
</script><select class="dropdown" name="month" disabled="disabled"><option value="1">Jan</option><option value="2">Feb</option><option value="3">Mar</option><option value="4">Apr</option><option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option><option value="8">Aug</option><option value="9" selected="selected">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option></select><select class="dropdown" name="day" disabled="disabled"><option value="1">01</option><option value="2">02</option><option value="3">03</option><option value="4">04</option><option value="5">05</option><option value="6">06</option><option value="7">07</option><option value="8">08</option><option value="9">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19" selected="selected">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select><select class="dropdown" name="year" disabled="disabled"><option value="10" selected="selected">10</option><option value="11">11</option></select>&nbsp;&nbsp;&nbsp;<select class="dropdown" name="hour" disabled="disabled"><option value="0">00</option><option value="1">01</option><option value="2">02</option><option value="3">03</option><option value="4">04</option><option value="5">05</option><option value="6">06</option><option value="7">07</option><option value="8">08</option><option value="9">09</option><option value="10" selected="selected">10</option><option value="11">11</option></select><select class="dropdown" name="minute" disabled="disabled"><option value="0">00</option><option value="1">01</option><option value="2">02</option><option value="3">03</option><option value="4" selected="selected">04</option><option value="5">05</option><option value="6">06</option><option value="7">07</option><option value="8">08</option><option value="9">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option></select>

		   <input class="radio" type="radio" name="meridiem" value="0" disabled="disabled" />am
		   <input class="radio" type="radio" name="meridiem" value="1" disabled="disabled" checked="checked" />pm</td><td class="sel"><input class="check" type="checkbox" name="umfrage_ende" onclick="voteEnd();" />
	</td>
</tr></tbody></table>


<p class="btn"><input type="image" id="fbtn_ok" value="ok" name="s1" class="dynamic_img" src="img/x.gif" alt="OK" /></form></p>
<span style="color: #DD0000"><b>Atenção:</b> Você não pode usar os valores <b>[message]</b> ou <b>[/message]</b> em sua postagem porque ele pode causar problemas com o sistema bbcode.</span>
<?php }else{
header("Location: banned.php");
}
?>