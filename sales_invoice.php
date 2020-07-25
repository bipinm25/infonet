<?php
include_once("check_login.php");
include_once('class/common_settings.php');
include_once("class/Crud.php");
include_once("class/Report.php");

$crud = new Crud();

$where = "";

if (isset($_GET['unset_filter']) && $_GET['unset_filter']==1) {
    $_GET['inv_no'] = "";
    $_GET['customer_name'] = "";
}else{
	if (isset($_GET['inv_no']) && !empty($_GET['inv_no'])) {
		$where.=" and sm.Invoice_No like '%".$crud->escape_string($_GET['inv_no'])."%'";
    }
    if (isset($_GET['customer_name']) && !empty($_GET['customer_name'])) {
		$where.=" and sm.Customer_Name like '%".$crud->escape_string($_GET['customer_name'])."%'";
	}
}

if($_GET['cmp_id']!=0){
   $where.="and sm.Company_Id = '".$_GET['cmp_id']."'";
}



$no_of_records_per_page = 10;

if (isset($_GET['pageno'])) {
	$pageno = $_GET['pageno'];
	$counter = ($pageno-1) * $no_of_records_per_page+1;
} else {
	$counter = 1;
	$pageno = 1;
}

$no_of_records_per_page = 10;
$offset = ($pageno-1) * $no_of_records_per_page; 

$sql="SELECT sm.Sales_Master_Id,sm.Company_Id,c.Company_Name,sm.Serial_No,sm.Invoice_Date,sm.Invoice_No,sm.Customer_Name,sm.IsCash,CASE
WHEN sm.IsCash = 0 THEN 'Cash'
WHEN sm.IsCash = 1 THEN 'Card'
WHEN sm.IsCash = 2 THEN 'Credit'
WHEN sm.IsCash = 3 THEN 'Multi'
ELSE 'Cash'
END as paymentmode,sm.Total_Gross_Amount,sm.Total_Discount_Amount,sm.Total_Net_Amount,sm.Total_Tax_Amount,sm.Total_Amount 
FROM `sales_master` sm 
left join customer sc on sm.Customer_Id=sc.Customer_Id 
left join company c on sm.Company_Id=c.Company_Id where sm.Invoice_Date = '".$_GET['inv_date']."' 
$where order by sm.Sales_Master_Id desc ";
error_log($sql);

$total_rows = $crud->number_of_records($sql);
$total_pages = ceil($total_rows / $no_of_records_per_page);

$sales_list = $crud->getData("$sql LIMIT $offset, $no_of_records_per_page");

$saleslist_all = $crud->getData($sql);
$sum_gross_amount = 0;

foreach ($saleslist_all as $k => $sales) {
	$sum_gross_amount += $sales['Total_Gross_Amount'];
	$sum_total_discount_amount += $sales['Total_Discount_Amount'];
	$sum_net_amount += $sales['Total_Net_Amount'];
	$sum_tax_amount += $sales['Total_Tax_Amount'];
	$sum_total_amount += $sales['Total_Amount'];
	$sum_discount_amount += $sales['Discount_Amount'];
	$sum_grand_total += $sales['Grand_Total'];
	$sales_report_details[] = 
	['Invoice Date'=>$crud->disp_date($sales['Invoice_Date']),
	'Invoice No'=>$sales['Invoice_No'],
	'Customer Name'=>$sales['Customer_Name'],
	'Payment Mode'=>$sales['paymentmode'],
	'Gross Amount'=>$crud->num_format($sales['Total_Gross_Amount']),
	'Discount'=>$crud->num_format($sales['Total_Discount_Amount']),
	'Net Amount'=>$crud->num_format($sales['Total_Net_Amount']),
	'Tax Amount'=>$crud->num_format($sales['Total_Tax_Amount']),
	'Total Amount'=>$crud->num_format($sales['Total_Amount']),
	'Discount Amount'=>$crud->num_format($sales['Discount_Amount']),
	'Grand Total'=>$crud->num_format($sales['Grand_Total'])
	];
}
if(!empty($saleslist_all)){
	$sales_report_details['sum_gross_amount'] = $crud->num_format($sum_gross_amount);
	$sales_report_details['sum_total_discount_amount'] = $crud->num_format($sum_total_discount_amount);
	$sales_report_details['sum_net_amount'] = $crud->num_format($sum_net_amount);
	$sales_report_details['sum_tax_amount'] = $crud->num_format($sum_tax_amount);
	$sales_report_details['sum_total_amount'] = $crud->num_format($sum_total_amount);
	$sales_report_details['sum_discount_amount'] = $crud->num_format($sum_discount_amount);
	$sales_report_details['sum_grand_total'] = $crud->num_format($sum_grand_total);
}


if(isset($_GET['export']) && $_GET['export'] == 1){
	 $report = new Report();	
	 $report_title = 'Sales Report';
	
	 if(!empty($sales_report_details)){
		$report->getReport($sales_report_details,$report_title);
	 }else{
		?> 
		<script>
			alert('No Record Found');
			window.location = window.location.href.split("?")[0];
		</script>
<?php	 }
}
$bread_cums = ['Sales'=>'sales.php'];
include_once('menu.php');
?>
<div class="m-b-md">
	<h3 class="m-b-none">Sales Report</h3>
</div>

<section class="panel panel-default">
	<header class="panel-heading">
		Sales List		
	</header>
	<div class="row wrapper">
	
	<form method="get">
			
	<div class="col-lg-2">
	<input type="text" name="inv_no" value="<?=isset($_GET['inv_no'])?$_GET['inv_no']:"" ?>" class="input-sm form-control" placeholder="Invoice No">
	</div>

	<div class="col-lg-2">
	<input type="text" name="customer_name" value="<?=isset($_GET['customer_name'])?$_GET['customer_name']:"" ?>" class="input-sm form-control" placeholder="Customer Name">
    <input type="hidden" name="inv_date" value="<?=$_GET['inv_date']?>" />
    <input type="hidden" name="cmp_id" value="<?=$_GET['cmp_id']?>" />
	</div>


					<div class="col-lg-4">
						<div class="input-group">	
							<span class="input-group-btn">
								<button class="btn btn-sm btn-default" type="submit">Search</button>
								<button class="btn btn-sm btn-default" value="1" name="unset_filter">Clear</button>
							</span>
						</div>
					</div>					
					<div class="col-lg-2-4"></div>
					</form>	
                    <div class="col-lg-1">
	<a class="btn btn-sm btn-info btn-export"  href="?export=1&<?=http_build_query($_GET, '', '&')?>">Export</a>
	</div>							
	</div>
	<div class="table-responsive">
		<table class="table b-t b-light">
			<thead>
				<tr class="tbl_th">
				    <th>S.NO</th>
					<th class="<?= $cmp != 0?'hidden':''?>">Company</th>				
					<th>Invoice Date</th>
                    <th>Invoice No</th>
	                <th>Customer Name</th>
	                <th>Payment Mode</th>
					<th>Gross Amount</th>
					<th>Discount</th>
					<th>Net Amount</th>
					<th>Tax Amount</th>
					<th>Total Amount</th>
					<th>Discount Amount</th>
					<th>Grand Total</th>
				</tr>
			</thead>
			<tbody>
							<?php						
							if ($sales_list){
								foreach ($sales_list as $k => $sales) {
									$sales['Total_Gross_Amount'] = $crud->num_format($sales['Total_Gross_Amount']);
									$sales['Total_Discount_Amount'] = $crud->num_format($sales['Total_Discount_Amount']);
									$sales['Total_Net_Amount'] = $crud->num_format($sales['Total_Net_Amount']);
									$sales['Total_Tax_Amount'] = $crud->num_format($sales['Total_Tax_Amount']);
									$sales['Total_Amount'] = $crud->num_format($sales['Total_Amount']);
									$sales['Discount_Amount'] = $crud->num_format($sales['Discount_Amount']);
									$sales['Grand_Total'] = $crud->num_format($sales['Grand_Total']);
								
									echo '<tr data-sales_id="'.$sales['Sales_Master_Id'].'" class="bb" >
								<td>'.$counter++.'</td>
								<td class="'.($cmp != 0?'hidden':'').'">'.$sales['Company_Name'].'</td>
                                <td>'.$crud->disp_date($sales['Invoice_Date']).'</td>
                                <td>'.$sales['Invoice_No'].'</td>
                                <td>'.$sales['Customer_Name'].'</td>
                                <td>'.$sales['paymentmode'].'</td>
								<td>'.$sales['Total_Gross_Amount'].'</td>
								<td>'.$sales['Total_Discount_Amount'].'</td>
								<td>'.$sales['Total_Net_Amount'].'</td>
								<td>'.$sales['Total_Tax_Amount'].'</td>
								<td>'.$sales['Total_Amount'].'</td>
								<td>'.$sales['Discount_Amount'].'</td>
								<td>'.$sales['Grand_Total'].'</td>
									  </tr>';		  
									  
								}
								echo  '<tr>
								      <td colspan="'.($cmp != 0?'5':'6').'"></td>
									  <td><b>'.$sales_report_details['sum_gross_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_total_discount_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_net_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_tax_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_total_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_discount_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_grand_total'].'</b></td></tr>';
							} else {

								echo  '<tr class="td_error ">
								<td colspan="'.($cmp != 0?'12':'13').'">No Record Found</td></tr>';

							}
						
			?>			
			</tbody>
		</table>
	</div>
	<footer class="panel-footer">
		<div class="row">	
		<?php
		if($total_rows != 0)
			{
				$_from = $offset+1;
				$_to = ($offset+$no_of_records_per_page) > $total_rows ? $total_rows: $offset+$no_of_records_per_page;
		?>
		
				<div class="col-sm-8 text-center">							
							<small class="text-muted inline m-t-sm m-b-sm  txt_page_cnt">Total Sales : <?=$total_rows?><br>Showing From :<?=$_from?> To <?=$_to?></small>
							
													
			</div>
			<?php }	?>
			<?php
		if($total_rows != 0)
			{
		?>
			<div class="col-sm-4 text-right text-center-xs">
			<?php	
							$params=[];
							
							if (isset($_GET['inv_no'])) {
								$params['inv_no'] = $_GET['inv_no'];
							}	
							
							if (isset($_GET['customer_name'])) {
								$params['customer_name'] = $_GET['customer_name'];
							}	

							$url_params = sizeof($params)>0?'&'.http_build_query($params):'';			
						?>
							<ul class="pagination">
								<li>
									<a href="?pageno=1<?=$url_params?>">First</a></li>
								<li class="<?php
							if ($pageno <= 1) {
								echo 'disabled'; } ?>">
									<a href="<?php
							if ($pageno <= 1) {
								echo '#'; } else {
										echo "?pageno=".($pageno - 1)."".$url_params; } ?>"<?=$url_params ?>>Prev</a>
								</li>
								<li class="<?php
							if ($pageno >= $total_pages) {
								echo 'disabled'; } ?>">
									<a href="<?php
							if ($pageno >= $total_pages) {
								echo '#'; } else {
										echo "?pageno=".($pageno + 1)."".$url_params; } ?>">Next</a>
								</li>
								<li>
									<a href="?pageno=<?php echo $total_pages."".$url_params; ?>">Last</a></li>
							</ul>
			</div>
			<?php }	?>
		</div>
	</footer>
</section>
<?php  include_once('footer.php'); ?>
 