<?php
include_once("check_login.php");
include_once('class/common_settings.php');
include_once("class/Crud.php");
include_once("class/Report.php");

$crud = new Crud();

$where = "";

if ((isset($_GET['unset_filter']) && $_GET['unset_filter']==1 )|| empty($_GET['inv_from_date'])&&empty($_GET['inv_to_date'])) {
	$_GET['inv_from_date'] = date('d-m-Y');
	$_GET['inv_to_date'] = date('d-m-Y');
}
if (isset($_GET['inv_from_date']) && !empty($_GET['inv_from_date']) || isset($_GET['inv_to_date']) && !empty($_GET['inv_to_date']) ) {
		$where.=" and date(pm.Invoice_Date)  >='".$crud->format_date($_GET['inv_from_date'])."' and date(pm.Invoice_Date)  <='".$crud->format_date($_GET['inv_to_date'])."'";
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

$sql="SELECT pm.Purchase_Master_Id,pm.Invoice_No,DATE_FORMAT(pm.Invoice_Date,'%d/%m/%Y') AS Invoice_Date,pm.Supplier_Name,pm.Is_Cash,CASE
WHEN pm.Is_Cash = 0 THEN 'Cash'
WHEN pm.Is_Cash = 1 THEN 'Card'
WHEN pm.Is_Cash = 2 THEN 'Credit'
WHEN pm.Is_Cash = 3 THEN 'Multi'
ELSE 'Cash'
END as paymentmode,pm.Total_Gross_Amount,pm.Total_Discount_Amount,pm.Total_Net_Amount,pm.Total_Tax_Amount,pm.Total_Amount,pm.Discount_Amount,pm.Grand_Total 
FROM `purchase_master` pm where 1=1
$where order by pm.Purchase_Master_Id desc ";


$total_rows = $crud->number_of_records($sql);
$total_pages = ceil($total_rows / $no_of_records_per_page);

$purchase_list = $crud->getData("$sql LIMIT $offset, $no_of_records_per_page");

$purchase_all = $crud->getData($sql);
$sum_gross_amount = 0;
foreach ($purchase_all as $k => $purchase) {
	$sum_gross_amount += $purchase['Total_Gross_Amount'];
	$sum_total_discount_amount += $purchase['Total_Discount_Amount'];
	$sum_net_amount += $purchase['Total_Net_Amount'];
	$sum_tax_amount += $purchase['Total_Tax_Amount'];
	$sum_total_amount += $purchase['Total_Amount'];
	$sum_discount_amount += $purchase['Discount_Amount'];
	$sum_grand_total_amount += $purchase['Grand_Total'];
	$purchase_report_details[] = 
	['Invoice Date'=>$purchase['Invoice_Date'],
	'Invoice No'=>$purchase['Invoice_No'],
	'Supplier Name'=>$purchase['Supplier_Name'],
	'Payment Mode'=>$purchase['paymentmode'],
	'Gross Amount'=>$purchase['Total_Gross_Amount'],
	'Discount'=>$purchase['Total_Discount_Amount'],
	'Net Amount'=>$purchase['Total_Net_Amount'],
	'Tax Amount'=>$purchase['Total_Tax_Amount'],
	'Total Amount'=>$purchase['Total_Amount'],
	'Discount Amount'=>$purchase['Discount_Amount'],
	'Grand Total'=>$purchase['Grand_Total']
	];
}
$purchase_report_details['sum_gross_amount'] = number_format($sum_gross_amount, 2, '.', '');
$purchase_report_details['sum_total_discount_amount'] = number_format($sum_discount_amount, 2, '.', '');
$purchase_report_details['sum_net_amount'] = number_format($sum_net_amount, 2, '.', '');
$purchase_report_details['sum_tax_amount'] = number_format($sum_tax_amount, 2, '.', '');
$purchase_report_details['sum_total_amount'] = number_format($sum_total_amount, 2, '.', '');
$purchase_report_details['sum_discount_amount'] = number_format($sum_discount_amount, 2, '.', '');
$purchase_report_details['sum_grand_total_amount'] = number_format($sum_grand_total_amount, 2, '.', '');

if(isset($_GET['export']) && $_GET['export'] == 1){
	 $report = new Report();	
	 $report_title = 'Purchase Report';
	 $report->getReport($sales_report_details,$report_title);
}
$bread_cums = ['Purchase'=>'purchase.php'];

include_once('menu.php');
?>
<div class="m-b-md">
	<h3 class="m-b-none">Purchase Report</h3>
</div>

<section class="panel panel-default">
	<header class="panel-heading">
		Purcahse List		
	</header>
	<div class="row wrapper">
	<a class="btn btn-sm btn-info pull-right btn-export" href="?export=1&<?=http_build_query($_GET, '', '&')?>">Export</a>
	<form method="get">
			
	<div class="col-lg-3">
	<input name="inv_from_date" value="<?=isset($_GET['inv_from_date'])?$_GET['inv_from_date']:date('d-m-Y'); ?>" class="input-sm input-s datepicker-input form-control" size="16" type="text"  data-date-format="dd-mm-yyyy"  placeholder="From Date">
	</div>

	<div class="col-lg-3">
	<input name="inv_to_date" value="<?=isset($_GET['inv_to_date'])?$_GET['inv_to_date']:date('d-m-Y'); ?>" class="input-sm input-s datepicker-input form-control" size="16" type="text"  data-date-format="dd-mm-yyyy"  placeholder="To Date" >
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
	</div>
	<div class="table-responsive">
		<table class="table b-t b-light">
			<thead>
				<tr class="tbl_th">
					<th>S.NO</th>
					<th>Invoice No</th>				
					<th>Invoice Date</th>					
					<th>Supplier Name</th>
					<th>Payment Mode</th>
					<th>Gross Amount</th>
					<th>Discount</th>
					<th>Net Amount</th>
					<th>Tax Amount</th>
					<th>Total Amount</th>
					<th>Discount Amount</th>
					<th>Grand Amount</th>
				</tr>
			</thead>
			<tbody>
							<?php						
							if ($sales_list){
								foreach ($purchase_list as $k => $purchase) {
									$purchase['Total_Gross_Amount'] = number_format($purchase['Total_Gross_Amount'], 2, '.', '');
									$purchase['Total_Discount_Amount'] = number_format($purchase['Total_Discount_Amount'], 2, '.', '');
									$purchase['Total_Net_Amount'] = number_format($purchase['Total_Net_Amount'], 2, '.', '');
									$purchase['Total_Tax_Amount'] = number_format($purchase['Total_Tax_Amount'], 2, '.', '');
									$purchase['Total_Amount'] = number_format($purchase['Total_Amount'], 2, '.', '');
									$purchase['Discount_Amount'] = number_format($purchase['Discount_Amount'], 2, '.', '');
									$purchase['Grand_Total'] = number_format($purchase['Grand_Total'], 2, '.', '');
								
									echo '<tr data-sales_id="'.$purchase['Sales_Master_Id'].'" class="bb" >
								<td>'.$counter++.'</td>
								<td>'.$purchase['Invoice_No'].'</td>
								<td>'.$purchase['Invoice_Date'].'</td>
								<td>'.$purchase['Customer_Name'].'</td>
								<td>'.$purchase['paymentmode'].'</td>
								<td>'.$purchase['Total_Gross_Amount'].'</td>
								<td>'.$purchase['Total_Discount_Amount'].'</td>
								<td>'.$purchase['Total_Net_Amount'].'</td>
								<td>'.$purchase['Total_Tax_Amount'].'</td>
								<td>'.$purchase['Total_Amount'].'</td>
								<td>'.$purchase['Discount_Amount'].'</td>
								<td>'.$purchase['Grand_Total'].'</td>
									  </tr>';

									  $sql="SELECT pd.Purchase_Detail_Id,pd.Purchase_Master_Id,pd.Product_Id,pm.Product_name,pm.Product_Code,pd.Quantity,pd.Purchase_Rate,pd.Gross_Amount,pd.Discount,pd.Net_Amount,pd.Tax_Amount,pd.Amount FROM `purchase_detail` pd 
left join Product_Master pm on sd.Product_Id=pm.Product_Id
where pd.Purchase_Master_Id = ".$purchase['Purchase_Master_Id']."  order by pd.Purchase_Detail_Id desc ";
$purchase_detail_list = $crud->getData($sql);
                                    if ($purchase_detail_list){
									  echo '<tr class="stbl stbl_th sub_row  aa_'.$purchase['Purchase_Master_Id'].'">
									  <th>Product Code</th>
									  <th>Product Name</th>
									  <th>Quantity</th>
									  <th>Rate</th>
									  <th>Gross Amount</th>
									  <th>Discount Amount</th>
									  <th>Net Amount</th>
									  <th>Tax Amount</th>
									  <th>Total Amount</th></tr>';
									  foreach ($purchase_detail_list as $k => $purchase_detail) {
										$purchase_detail['Purchase_Rate'] = number_format($purchase_detail['Purchase_Rate'], 2, '.', '');
										$purchase_detail['Gross_Amount'] = number_format($purchase_detail['Gross_Amount'], 2, '.', '');
										$purchase_detail['Discount'] = number_format($purchase_detail['Discount'], 2, '.', '');
										$purchase_detail['Net_Amount'] = number_format($purchase_detail['Net_Amount'], 2, '.', '');
										$purchase_detail['Tax_Amount'] = number_format($purchase_detail['Tax_Amount'], 2, '.', '');
										$purchase_detail['Amount'] = number_format($purchase_detail['Amount'], 2, '.', '');

									 echo  '<tr class="stbl sub_row  aa_'.$purchase['Sales_Master_Id'].'">
			                          <td>'.$purchase_detail['Product_Code'].'</td>
									  <td>'.$purchase_detail['Product_name'].'</td>
									  <td>'.$purchase_detail['Brand_Name'].'</td>
									  <td>'.$purchase_detail['Quantity'].'</td>
									  <td>'.$purchase_detail['Purchase_Rate'].'</td>
									  <td>'.$purchase_detail['Gross_Amount'].'</td>
									  <td>'.$purchase_detail['Discount'].'</td>
									  <td>'.$purchase_detail['Net_Amount'].'</td>
									  <td>'.$purchase_detail['Tax_Amount'].'</td>
									  <td>'.$purchase_detail['Amount'].'</td></tr>';
									  }
									 
								    } else{

										echo  '<tr class="td_error sub_row hidden aa_'.$purchase['Purchase_Master_Id'].'">
										<td colspan="12">No Record Found</td></tr>';

									}
									  
								}
								echo  '<tr>
			                          <td colspan="5"></td>
									  <td><b>'.$purchase_report_details['sum_gross_amount'].'</b></td>
									  <td><b>'.$purchase_report_details['sum_total_discount_amount'].'</b></td>
									  <td><b>'.$purchase_report_details['sum_net_amount'].'</b></td>
									  <td><b>'.$purchase_report_details['sum_tax_amount'].'</b></td>
									  <td><b>'.$purchase_report_details['sum_total_amount'].'</b></td></tr>
									  <td><b>'.$purchase_report_details['sum_discount_amount'].'</b></td></tr>
									  <td><b>'.$purchase_report_details['sum_grand_total_amount'].'</b></td></tr>';
							} else {

								echo  '<tr class="td_error ">
										<td colspan="12">No Record Found</td></tr>';

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
							
							if (isset($_GET['inv_from_date'])) {
								$params['inv_from_date'] = $_GET['inv_from_date'];
							}
							
							if (isset($_GET['inv_to_date'])) {
								$params['inv_to_date'] = $_GET['inv_to_date'];
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
 <script>
 $(".bb").on('click',function(){	
	 var s_id = $(this).data('sales_id');
	 //$('.stbl.active').removeClass('active');
	 $(this).parent().find(".aa_"+s_id).toggleClass("active");
	 //row.nextElementSibling.classList.toggle("hide");
	 //$('tr:nth-child()').toggleClass('active');
	 //$('tr:nth-child(3)').toggleClass('active');
	 //$(this).nextUntil(".bb").toggle('active').siblings().removeClass('active');
	// $(this).parent().find(".aa_"+s_id).toggleClass("active").siblings().removeClass('active');
	// $(this).addClass('active').siblings().removeClass('active');
	 //$(this).closest('tr').next('tr').toggleClass('active').siblings().removeClass('active');
 })
 </script>