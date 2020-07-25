<?php
include_once("check_login.php");
include_once('class/common_settings.php');
include_once("class/Crud.php");
include_once("class/Report.php");

$crud = new Crud();

$where = "";

if (isset($_GET['unset_filter']) && $_GET['unset_filter']==1) {
    $_GET['inv_no'] = "";
    $_GET['supplier_name'] = "";
}else{
	if (isset($_GET['inv_no']) && !empty($_GET['inv_no'])) {
		$where.=" and pm.Invoice_No like '%".$crud->escape_string($_GET['inv_no'])."%'";
    }
    if (isset($_GET['supplier_name']) && !empty($_GET['supplier_name'])) {
		$where.=" and pm.Supplier_Name like '%".$crud->escape_string($_GET['supplier_name'])."%'";
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

$sql="SELECT pm.Purchase_Master_Id,pm.Company_Id,c.Company_Name,pm.Invoice_No,DATE_FORMAT(pm.Invoice_Date,'%d/%m/%Y') AS Invoice_Date,pm.Supplier_Name,pm.Is_Cash,CASE
WHEN pm.Is_Cash = 0 THEN 'Cash'
WHEN pm.Is_Cash = 1 THEN 'Card'
WHEN pm.Is_Cash = 2 THEN 'Credit'
WHEN pm.Is_Cash = 3 THEN 'Multi'
ELSE 'Cash'
END as paymentmode,pm.Total_Gross_Amount,pm.Total_Discount_Amount,pm.Total_Net_Amount,pm.Total_Tax_Amount,pm.Total_Amount,pm.Discount_Amount,pm.Grand_Total 
FROM `purchase_master` pm 
left join company c on pm.Company_Id=c.Company_Id where pm.Invoice_Date = '".$_GET['inv_date']."' 
$where order by pm.Purchase_Master_Id desc ";

$total_rows = $crud->number_of_records($sql);
$total_pages = ceil($total_rows / $no_of_records_per_page);

$purchase_list = $crud->getData("$sql LIMIT $offset, $no_of_records_per_page");

$purchaselist_all = $crud->getData($sql);
$sum_gross_amount = 0;
foreach ($purchaselist_all as $k => $purchase) {
	$sum_gross_amount += $purchase['Total_Gross_Amount'];
	$sum_total_discount_amount += $purchase['Total_Discount_Amount'];
	$sum_net_amount += $purchase['Total_Net_Amount'];
	$sum_tax_amount += $purchase['Total_Tax_Amount'];
	$sum_total_amount += $purchase['Total_Amount'];
	$sum_discount_amount += $purchase['Discount_Amount'];
	$sum_grand_total += $purchase['Grand_Total'];
	$purchase_report_details[] = 
	['Invoice Date'=>$purchase['Invoice_Date'],
	'Invoice No'=>$purchase['Invoice_No'],
	'Supplier Name'=>$purchase['Supplier_Name'],
	'Payment Mode'=>$purchase['paymentmode'],
	'Gross Amount'=>$crud->num_format($purchase['Total_Gross_Amount']),
	'Discount'=>$crud->num_format($purchase['Total_Discount_Amount']),
	'Net Amount'=>$crud->num_format($purchase['Total_Net_Amount']),
	'Tax Amount'=>$crud->num_format($purchase['Total_Tax_Amount']),
	'Total Amount'=>$crud->num_format($purchase['Total_Amount']),
	'Discount Amount'=>$crud->num_format($purchase['Discount_Amount']),
	'Grand Total'=>$crud->num_format($purchase['Grand_Total'])
	];
}
if(!empty($purchaselist_all)){
$purchase_report_details['sum_gross_amount'] = $crud->num_format($sum_gross_amount);
$purchase_report_details['sum_total_discount_amount'] = $crud->num_format($sum_total_discount_amount);
$purchase_report_details['sum_net_amount'] = $crud->num_format($sum_net_amount);
$purchase_report_details['sum_tax_amount'] = $crud->num_format($sum_tax_amount);
$purchase_report_details['sum_total_amount'] = $crud->num_format($sum_total_amount);
$purchase_report_details['sum_discount_amount'] = $crud->num_format($sum_discount_amount);
$purchase_report_details['sum_grand_total'] = $crud->num_format($sum_grand_total);
}

if(isset($_GET['export']) && $_GET['export'] == 1){
	 $report = new Report();	
	 $report_title = 'Purchase Report';
	 if(!empty($purchase_report_details)){
		$report->getReport($purchase_report_details,$report_title);
	 }else{
		?> 
		<script>
			alert('No Record Found');
			window.location = window.location.href.split("?")[0];
		</script>
<?php	 }
	 
}
$bread_cums = ['Purchase'=>'purchase.php'];

include_once('menu.php');
?>
<div class="m-b-md">
	<h3 class="m-b-none">Purchase Report</h3>
</div>

<section class="panel panel-default">
	<header class="panel-heading">
	 Purchase List		
	</header>
	<div class="row wrapper">
	
	<form method="get">
			
	<div class="col-lg-2">
	<input type="text" name="inv_no" value="<?=isset($_GET['inv_no'])?$_GET['inv_no']:"" ?>" class="input-sm form-control" placeholder="Invoice No">
	</div>

	<div class="col-lg-2">
	<input type="text" name="supplier_name" value="<?=isset($_GET['supplier_name'])?$_GET['supplier_name']:"" ?>" class="input-sm form-control" placeholder="Supplier Name">
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
	                <th>Supplier Name</th>
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
							if ($purchase_list){
								foreach ($purchase_list as $k => $purchase) {
									$purchase['Total_Gross_Amount'] = $crud->num_format($purchase['Total_Gross_Amount']);
									$purchase['Total_Discount_Amount'] = $crud->num_format($purchase['Total_Discount_Amount']);
									$purchase['Total_Net_Amount'] = $crud->num_format($purchase['Total_Net_Amount']);
									$purchase['Total_Tax_Amount'] = $crud->num_format($purchase['Total_Tax_Amount']);
									$purchase['Total_Amount'] = $crud->num_format($purchase['Total_Amount']);
									$purchase['Discount_Amount'] = $crud->num_format($purchase['Discount_Amount']);
									$purchase['Grand_Total'] = $crud->num_format($purchase['Grand_Total']);
								
									echo '<tr data-purchase_id="'.$purchase['Purchase_Master_Id'].'" class="bb" >
								<td>'.$counter++.'</td>
								<td class="'.($cmp != 0?'hidden':'').'">'.$purchase['Company_Name'].'</td>
                                <td>'.$crud->disp_date($purchase['Invoice_Date']).'</td>
                                <td>'.$purchase['Invoice_No'].'</td>
                                <td>'.$purchase['Supplier_Name'].'</td>
                                <td>'.$purchase['paymentmode'].'</td>
								<td>'.$purchase['Total_Gross_Amount'].'</td>
								<td>'.$purchase['Total_Discount_Amount'].'</td>
								<td>'.$purchase['Total_Net_Amount'].'</td>
								<td>'.$purchase['Total_Tax_Amount'].'</td>
								<td>'.$purchase['Total_Amount'].'</td>
								<td>'.$purchase['Discount_Amount'].'</td>
                                <td>'.$purchase['Grand_Total'].'</td> 
                                </tr>';				  
								}
								echo  '<tr>
                                <td colspan="'.($cmp != 0?'5':'6').'"></td>
									  <td><b>'.$purchase_report_details['sum_gross_amount'].'</b></td>
									  <td><b>'.$purchase_report_details['sum_total_discount_amount'].'</b></td>
									  <td><b>'.$purchase_report_details['sum_net_amount'].'</b></td>
									  <td><b>'.$purchase_report_details['sum_tax_amount'].'</b></td>
									  <td><b>'.$purchase_report_details['sum_total_amount'].'</b></td>
									  <td><b>'.$purchase_report_details['sum_discount_amount'].'</b></td>
									  <td><b>'.$purchase_report_details['sum_grand_total'].'</b></td></tr>';
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
							<small class="text-muted inline m-t-sm m-b-sm  txt_page_cnt">Total Purchase : <?=$total_rows?><br>Showing From :<?=$_from?> To <?=$_to?></small>
							
													
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
							
							if (isset($_GET['supplier_name'])) {
								$params['supplier_name'] = $_GET['supplier_name'];
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
 