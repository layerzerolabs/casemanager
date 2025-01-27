<!-- Template for welfare payments report -->

	<table align='center' class='tbl_usr_dtl' width='97%'>
		<tr>
			<th class='td_strand_title'>Client</th>
			<!-- A heading for each date -->
			<?php foreach ($report->dates as $date) { ?>
			<th class='td_strand_title' colspan = 2><?php echo $date;?></th>
			<?php } ?>
		</tr>
		<tr>
			<th class='td_strand_title'></th> <!-- client heading is 2 rows high -->
 			<!-- under each date, subheadings for amount and bus pass  -->
			<?php foreach ($report->dates as $date) { ?>
			<th class='td_strand_title'>Cash</th>
			<th class='td_strand_title'>Bus Pass</th>
			<?php } ?>
		</tr>
		<?php 
		foreach ($report->rows as $reportRow) {
			// alternating highlighted rows 
			$highlight = !$highlight;
			$class = $highlight ? 'tbl_cont_dark' : 'tbl_cont_light';
		?>
		<tr class="welfare_input <?php echo $class; ?>">
			<td>
				<!-- client name, as link -->
				<?php echo $reportRow->link;?>
			</td>
			<!-- A column for each date -->
			<?php foreach ($report->dates as $date) {
                        	$entry = $reportRow->entries[$date];
				echo $entry->decorate($decorator);	

			} ?> <!-- end foreach date -->
		</tr>
	        <?php } ?> <!-- end foreach row -->
		<!-- Summary -->
		<tr id = 'welfare_report_summary'>
			<td>TOTAL</td>
		<?php foreach ($report->dates as $date) { 
			echo "<td>&pound;" . $report->summary[$date]['cash']  . "</td>";
			echo "<td>" . $report->summary[$date]['bus_passes']  . "</td>";
		 } ?>
		</tr>
	</table>
