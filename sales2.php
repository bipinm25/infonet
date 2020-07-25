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
		$where.=" and date(sm.Invoice_Date)  >='".$crud->format_date($_GET['inv_from_date'])."' and date(sm.Invoice_Date)  <='".$crud->format_date($_GET['inv_to_date'])."'";
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

$sql_rep="SELECT sm.Sales_Master_Id,sm.Serial_No,DATE_FORMAT(sm.Invoice_Date,'%d/%m/%Y') AS Invoice_Date,sm.Invoice_No,sm.Customer_Name,sm.IsCash,CASE
WHEN sm.IsCash = 0 THEN 'Cash'
WHEN sm.IsCash = 1 THEN 'Card'
WHEN sm.IsCash = 2 THEN 'Credit'
WHEN sm.IsCash = 3 THEN 'Multi'
ELSE 'Cash'
END as paymentmode,sm.Total_Gross_Amount,sm.Total_Discount_Amount,sm.Total_Net_Amount,sm.Total_Tax_Amount,sm.Total_Amount,sm.Discount_Amount,sm.Grand_Total 
FROM `sales_master` sm 
left join customer sc on sm.Customer_Id=sc.Customer_Id where 1=1
$where order by sm.Sales_Master_Id desc ";

$sql="SELECT sm.Sales_Master_Id,sm.Invoice_Date,sum(sm.Total_Gross_Amount),sum(sm.Total_Discount_Amount) as Total_Discount_Amount,sum(sm.Total_Net_Amount) as Total_Net_Amount,sum(sm.Total_Tax_Amount) as Total_Tax_Amount,sum(sm.Total_Amount) as Total_Amount,sum(sm.Discount_Amount) as Discount_Amount,sum(sm.Grand_Total) as Grand_Total 
FROM `sales_master` sm 
left join customer sc on sm.Customer_Id=sc.Customer_Id where 1=1
$where group by sm.Invoice_Date order by sm.Sales_Master_Id desc ";

$total_rows = $crud->number_of_records($sql);
$total_pages = ceil($total_rows / $no_of_records_per_page);

$sales_list = $crud->getData("$sql LIMIT $offset, $no_of_records_per_page");


$saleslist_all = $crud->getData($sql_rep);
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
	['Invoice Date'=>$sales['Invoice_Date'],
	'Invoice No'=>$sales['Invoice_No'],
	'Customer Name'=>$sales['Customer_Name'],
	'Payment Mode'=>$sales['paymentmode'],
	'Gross Amount'=>$sales['Total_Gross_Amount'],
	'Discount'=>$sales['Total_Discount_Amount'],
	'Net Amount'=>$sales['Total_Net_Amount'],
	'Tax Amount'=>$sales['Total_Tax_Amount'],
	'Total Amount'=>$sales['Total_Amount'],
	'Discount Amount'=>$sales['Discount_Amount'],
	'Grand Total'=>$sales['Grand_Total']
	];
}
$sales_report_details['sum_gross_amount'] = number_format($sum_gross_amount, 2, '.', '');
$sales_report_details['sum_total_discount_amount'] = number_format($sum_total_discount_amount, 2, '.', '');
$sales_report_details['sum_net_amount'] = number_format($sum_net_amount, 2, '.', '');
$sales_report_details['sum_tax_amount'] = number_format($sum_tax_amount, 2, '.', '');
$sales_report_details['sum_total_amount'] = number_format($sum_total_amount, 2, '.', '');
$sales_report_details['sum_discount_amount'] = number_format($sum_discount_amount, 2, '.', '');
$sales_report_details['sum_grand_total'] = number_format($sum_grand_total, 2, '.', '');

if(isset($_GET['export']) && $_GET['export'] == 1){
	 $report = new Report();	
	 $report_title = 'Sales Report';
	 $report->getReport($sales_report_details,$report_title);
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
					<th>Invoice Date</th>
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
									$sales['Total_Gross_Amount'] = number_format($sales['Total_Gross_Amount'], 2, '.', '');
									$sales['Total_Discount_Amount'] = number_format($sales['Total_Discount_Amount'], 2, '.', '');
									$sales['Total_Net_Amount'] = number_format($sales['Total_Net_Amount'], 2, '.', '');
									$sales['Total_Tax_Amount'] = number_format($sales['Total_Tax_Amount'], 2, '.', '');
									$sales['Total_Amount'] = number_format($sales['Total_Amount'], 2, '.', '');
								
									echo '<tr data-sales_id="'.$sales['Sales_Master_Id'].'" class="bb" >
								<td>'.$counter++.'</td>
								<td>'.$crud->format_date($sales['Invoice_Date']).'</td>
								<td>'.$sales['Total_Gross_Amount'].'</td>
								<td>'.$sales['Total_Discount_Amount'].'</td>
								<td>'.$sales['Total_Net_Amount'].'</td>
								<td>'.$sales['Total_Tax_Amount'].'</td>
								<td>'.$sales['Total_Amount'].'</td>
								<td>'.$sales['Discount_Amount'].'</td>
								<td>'.$sales['Grand_Total'].'</td>
									  </tr>';

									  $sql_det="SELECT sm.Sales_Master_Id,sm.Serial_No,DATE_FORMAT(sm.Invoice_Date,'%d/%m/%Y') AS Invoice_Date,sm.Invoice_No,sm.Customer_Name,sm.IsCash,CASE
WHEN sm.IsCash = 0 THEN 'Cash'
WHEN sm.IsCash = 1 THEN 'Card'
WHEN sm.IsCash = 2 THEN 'Credit'
WHEN sm.IsCash = 3 THEN 'Multi'
ELSE 'Cash'
END as paymentmode,sm.Total_Gross_Amount,sm.Total_Discount_Amount,sm.Total_Net_Amount,sm.Total_Tax_Amount,sm.Total_Amount 
FROM `sales_master` sm 
left join customer sc on sm.Customer_Id=sc.Customer_Id where sm.Invoice_Date = '".$sales['Invoice_Date']."'
$where order by sm.Sales_Master_Id desc ";

$sales_det_list = $crud->getData($sql_det);


if ($sales_det_list){
	echo '<tr class="stbl fd_'.$sales['Sales_Master_Id'].'">
	<td colspan="10" class="sub_row_td">
	<table class="table b-t b-light">
	<thead>
	<tr class="tbl_th">
	<th>Invoice Date</th>
    <th>Invoice No</th>
	<th>Customer Name</th>
	<th>Payment Mode</th>
	<th>Gross Amount</th>
	<th>Discount</th>
	<th>Net Amount</th>
	<th>Tax Amount</th>
	<th>Total Amount</th></tr></thead>
	<tbody>';
	foreach ($sales_det_list as $k => $sales_detl) {
	  $sales_detl['Sales_Rate'] = number_format($sales_detl['Sales_Rate'], 2, '.', '');
	  $sales_detl['Gross_Amount'] = number_format($sales_detl['Gross_Amount'], 2, '.', '');
	  $sales_detl['Discount'] = number_format($sales_detl['Discount'], 2, '.', '');
	  $sales_detl['Net_Amount'] = number_format($sales_detl['Net_Amount'], 2, '.', '');
	  $sales_detl['Tax_Amount'] = number_format($sales_detl['Tax_Amount'], 2, '.', '');
	  $sales_detl['Amount'] = number_format($sales_detl['Amount'], 2, '.', '');

   echo  '<tr data-sales_id="'.$sales_detl['Sales_Master_Id'].'" class="stbl ff fd_'.$sales['Sales_Master_Id'].'">
   <td>'.$sales_detl['Invoice_Date'].'</td>
   <td>'.$sales_detl['Invoice_No'].'</td>
   <td>'.$sales_detl['Customer_Name'].'</td>
   <td>'.$sales_detl['paymentmode'].'</td>
   <td>'.$sales_detl['Total_Gross_Amount'].'</td>
   <td>'.$sales_detl['Total_Discount_Amount'].'</td>
   <td>'.$sales_detl['Total_Net_Amount'].'</td>
   <td>'.$sales_detl['Total_Tax_Amount'].'</td>
   <td>'.$sales_detl['Total_Amount'].'</td></tr>';

	$sql="SELECT sd.Sales_Detail_Id,sd.Sales_Master_Id,sd.Product_Id,pm.Product_name,pm.Product_Code,pb.Brand_Name,pc.Category_Name,sd.Quantity,sd.Sales_Rate,sd.Gross_Amount,sd.Discount,sd.Net_Amount,sd.Tax_Amount,sd.Amount FROM `Sales_Detail` sd 
	left join Product_Master pm on sd.Product_Id=pm.Product_Id
	left join Product_Brand pb on pm.Brand_ID=pb.Brand_ID
	left join Product_Category pc on pm.Category_ID=pc.Category_ID
	where sd.Sales_Master_Id = ".$sales_detl['Sales_Master_Id']."  order by sd.Sales_Detail_Id desc ";
	$sales_detail_list = $crud->getData($sql);
										if ($sales_detail_list){
										  echo '<tr class="stbl sd_'.$sales['Sales_Master_Id'].'">
										  <td colspan="10" class="sub_row_td">
	                                      <table class="table b-t b-light">
										  <thead>
										  <tr>
										  <th>Product Code</th>
										  <th>Product Name</th>
										  <th>Brand Name</th>
										  <th>Quantity</th>
										  <th>Rate</th>
										  <th>Gross Amount</th>
										  <th>Discount Amount</th>
										  <th>Net Amount</th>
										  <th>Tax Amount</th>
										  <th>Total Amount</th></tr></thead>
										  <tbody>';
										  foreach ($sales_detail_list as $k => $sales_detail) {
	 										$sales_detail['Sales_Rate'] = number_format($sales_detail['Sales_Rate'], 2, '.', '');
	 										$sales_detail['Gross_Amount'] = number_format($sales_detail['Gross_Amount'], 2, '.', '');
											$sales_detail['Discount'] = number_format($sales_detail['Discount'], 2, '.', '');
	 										$sales_detail['Net_Amount'] = number_format($sales_detail['Net_Amount'], 2, '.', '');
	 										$sales_detail['Tax_Amount'] = number_format($sales_detail['Tax_Amount'], 2, '.', '');
	 										$sales_detail['Amount'] = number_format($sales_detail['Amount'], 2, '.', '');
	
	 									 echo  '<tr class="sd_'.$sales['Sales_Master_Id'].'">
	 									  <td>'.$sales_detail['Product_Code'].'</td>
	 									  <td>'.$sales_detail['Product_name'].'</td>
	 									  <td>'.$sales_detail['Brand_Name'].'</td>
	 									  <td>'.$sales_detail['Quantity'].'</td>
	 									  <td>'.$sales_detail['Sales_Rate'].'</td>
	 									  <td>'.$sales_detail['Gross_Amount'].'</td>
	 									  <td>'.$sales_detail['Discount'].'</td>
	 									  <td>'.$sales_detail['Net_Amount'].'</td>
	 									  <td>'.$sales_detail['Tax_Amount'].'</td>
	 									  <td>'.$sales_detail['Amount'].'</td></tr>';
	 									  }
										  
	                                    echo '</tbody></table></td></tr/>';
										 
	 									} else{
	
	 										echo  '<tr class="td_error sub_row hidden aa_'.$sales['Sales_Master_Id'].'">
											<td colspan="10">No Record Found</td></tr>';
	
	 									}


									}

									echo '</tbody></table></td></tr/>';

   
  } else{

	  echo  '<tr class="td_error sub_row hidden aa_'.$sales['Sales_Master_Id'].'">
	  <td colspan="10">No Record Found</td></tr>';

  } 

									  
									  
								}
								echo  '<tr>
			                          <td colspan="2"></td>
									  <td><b>'.$sales_report_details['sum_gross_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_total_discount_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_net_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_tax_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_total_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_discount_amount'].'</b></td>
									  <td><b>'.$sales_report_details['sum_grand_total'].'</b></td></tr>';
							} else {

								echo  '<tr class="td_error ">
										<td colspan="10">No Record Found</td></tr>';

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
	 $(this).parent().find(".fd_"+s_id).toggleClass("active");
	 //row.nextElementSibling.classList.toggle("hide");
	 //$('tr:nth-child()').toggleClass('active');
	 //$('tr:nth-child(3)').toggleClass('active');
	 //$(this).nextUntil(".bb").toggle('active').siblings().removeClass('active');
	// $(this).parent().find(".aa_"+s_id).toggleClass("active").siblings().removeClass('active');
	// $(this).addClass('active').siblings().removeClass('active');
	 //$(this).closest('tr').next('tr').toggleClass('active').siblings().removeClass('active');
 })

 $(".ff").on('click',function(){
	$(this).nextUntil(".ff").toggleClass("active");
})
 </script>