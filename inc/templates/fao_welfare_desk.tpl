<form method='POST' action="<?php echo $_SERVER['PHP_SELF'] . '?client=' . $client; ?>">
    <table class='table_strands'>  <!-- table within a table -->
	<tr><td class='td_strand'>
	    <div class='td_strand_title'>
                <small>Information for Welfare Desk staff</small>
	    </div>
	    <table>
		<tr>
			<td>
				<label for='fao_letter'><b><small>Letter:</small></b></label>
			</td>
			<td>
				<input type='checkbox' name='fao_letter' id='fao_letter'
				<?php if ($faoWelfareDesk->letter) echo 'checked'; ?>
				/>
			</td>
			<td rowspan=4 class='fao_note_input'>
				<b><small>Note: </small></b><textarea rows=4 cols=20 name='fao_note'><?php echo $faoWelfareDesk->note; ?></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<label for='fao_advocacy'><b><small>Advocacy Appointment:</small></b></label>
			</td>
			<td>
				<input type='checkbox' name='fao_advocacy' id='fao_advocacy'
				<?php if ($faoWelfareDesk->advocacy) echo 'checked'; ?>
				/>
			</td>
		</tr>
		<tr>
			<td>
				<label for='fao_from_helpdesk'><b><small>Friday Team:</small></b></label>
			</td>
			<td>
				<input type='checkbox' name='fao_from_helpdesk' id='fao_from_helpdesk'
				<?php if ($faoWelfareDesk->from_helpdesk) echo 'checked'; ?>
				/>
			</td>
		</tr>
		<tr>
			<td>
				<b><small>Support this week:</small></b> 
			</td>
			<td>
				&pound;<input type='text' size=5 name='fao_amount' 
				value=<?php echo $faoWelfareDesk->amount; ?> />
				Bus Pass <input type='checkbox' name='fao_bus_pass' 
				<?php if ($faoWelfareDesk->bus_pass) echo 'checked'; ?>
				 />
			</td>
			<td>
				<input type='submit' value='Update' />
			</td>
	</td></tr>
    </table>
</form>
