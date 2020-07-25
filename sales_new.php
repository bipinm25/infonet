<?php
include_once("check_login.php");
include_once('class/common_settings.php');
include_once("class/Crud.php");
$crud = new Crud();

$where = "";
if (isset($_GET['unset_filter']) && $_GET['unset_filter']==1) {
	$_GET['inv_date'] = "";
}else{
	if (isset($_GET['inv_date']) && !empty($_GET['inv_date'])) {
		$where.=" and sm.inv_date like '%".$crud->escape_string($_GET['inv_date'])."%'";
	}
}

if (isset($_GET['pageno'])) {
	$pageno = $_GET['pageno'];
} else {
	$pageno = 1;
}

$no_of_records_per_page = 10;
$offset = ($pageno-1) * $no_of_records_per_page; 

$sql_distict = "select  distinct(sm.Sales_Master_Id) ";
$main_sql = "select sm.Sales_Master_Id,sm.Serial_No,sm.Invoice_Date,sm.Invoice_No,sm.Customer_Name,sm.Total_Gross_Amount,sm.Total_Discount_Amount,sm.Total_Net_Amount,sm.Total_Tax_Amount,sm.Total_Amount,sd.Sales_Detail_Id,sd.Sales_Master_Id,sd.Product_Id,pm.Product_name,pm.Product_Code,pb.Brand_Name,pc.Category_Name,sd.Quantity,sd.Sales_Rate,sd.Gross_Amount,sd.Discount,sd.Net_Amount,sd.Tax_Amount,sd.Amount ";
$from = " FROM `dbo_Sales_Master` sm 
left join dbo_Customer sc on sm.Customer_Id=sc.Customer_Id
left join dbo_Sales_Detail sd on sm.Sales_Master_Id=sd.Sales_Master_Id
left join dbo_Product_Master pm on sd.Product_Id=pm.Product_Id
left join dbo_Product_Brand pb on pm.Brand_ID=pb.Brand_ID
left join dbo_Product_Category pc on pm.Category_ID=pc.Category_ID
$where order by sm.Sales_Master_Id desc ";

$total_rows =  $crud->number_of_records($sql_distict.$from);
$total_pages = ceil($total_rows / $no_of_records_per_page);

$saleslist = $crud->getData($main_sql.$from." LIMIT {$offset}, {$no_of_records_per_page}");

foreach ($saleslist as $k => $sales) {

	if(!isset($sales_details[$sales['Sales_Master_Id']])){
		$sales_details[$sales['Sales_Master_Id']] = ['Sales_Master_Id'=>$sales['Sales_Master_Id'],
	'Serial_No'=>$sales['Serial_No'],
	'Invoice_Date'=>$sales['Invoice_Date'],
	'Invoice_No'=>$sales['Invoice_No'],
	'Customer_Name'=>$sales['Customer_Name'],
	'Total_Gross_Amount'=>$sales['Total_Gross_Amount'],
	'Total_Discount_Amount'=>$sales['Total_Discount_Amount'],
	'Total_Net_Amount'=>$sales['Total_Net_Amount'],
	'Total_Tax_Amount'=>$sales['Total_Tax_Amount'],
	'Total_Amount'=>$sales['Total_Amount']
];
	}
	
	$sales_details[$sales['Sales_Master_Id']][$sales['Sales_Master_Id']][] = [
	'Sales_Detail_Id'=>$sales['Sales_Detail_Id'],
	'Product_Id'=>$sales['Product_Id'],
	'Product_name'=>$sales['Product_name'],
	'Product_Code'=>$sales['Product_Code'],
	'Brand_Name'=>$sales['Brand_Name'],
	'Category_Name'=>$sales['Category_Name'],
	'Quantity'=>$sales['Quantity'],
	'Sales_Rate'=>$sales['Sales_Rate'],
	'Gross_Amount'=>$sales['Gross_Amount'],
	'Discount'=>$sales['Discount'],
	'Net_Amount'=>$sales['Net_Amount'],
	'Tax_Amount'=>$sales['Tax_Amount'],
	'Amount'=>$sales['Amount']
	];
	

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
			
		
		
					<div class="col-lg-4">
						<div class="input-group">
								
								<input name="inv_date" value="<?=isset($_GET['inv_date'])?$_GET['inv_date']:"" ?>" class="input-sm input-s datepicker-input form-control" size="16" type="text"  data-date-format="dd-mm-yyyy"  placeholder="Invoice Date" >
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
		<table class="table table-striped b-t b-light">
			<thead>
				<tr>
				    <th>SI NO</th>				
					<th>Transaction Date</th>
					<th>Invoice No</th>
					<th>Customer Name</th>
					<th>Payment Mode</th>
					<th>Gross Amount</th>
					<th>Discount</th>
					<th>Net Amount</th>
					<th>Tax Amount</th>
					<th>Total Amount</th>
				</tr>
			</thead>
			<tbody>
							<?php	
							$counter = 0;						
							if ($sales_details){
								foreach ($sales_details as $k => $sales) {
									$sales['Total_Gross_Amount'] = number_format($sales['Total_Gross_Amount'], 2, '.', '');
									$sales['Total_Discount_Amount'] = number_format($sales['Total_Discount_Amount'], 2, '.', '');
									$sales['Total_Net_Amount'] = number_format($sales['Total_Net_Amount'], 2, '.', '');
									$sales['Total_Tax_Amount'] = number_format($sales['Total_Tax_Amount'], 2, '.', '');
									$sales['Total_Amount'] = number_format($sales['Total_Amount'], 2, '.', '');
									
									echo '<tr data-sales_id="'.$sales['Sales_Master_Id'].'" class="bb" >
								<td>'.++$counter.'</td>
								<td>'.$sales['Invoice_Date'].'</td>
								<td>'.$sales['Invoice_No'].'</td>
								<td>'.$sales['Customer_Name'].'</td>
								<td>'.$sales['Customer_Name'].'</td>
								<td>'.$sales['Total_Gross_Amount'].'</td>
								<td>'.$sales['Total_Discount_Amount'].'</td>
								<td>'.$sales['Total_Net_Amount'].'</td>
								<td>'.$sales['Total_Tax_Amount'].'</td>
								<td>'.$sales['Total_Amount'].'</td>
									  </tr>';

									 

									  
									  
								}
							}
						
			?>			
			</tbody>
		</table>
	</div>
	<footer class="panel-footer">
		<div class="row">			
			<div class="col-sm-8 text-center">							
							<small class="text-muted inline m-t-sm m-b-sm">Total Products : <?=$total_rows?></small>							
			</div>
			<div class="col-sm-4 text-right text-center-xs">
			<?php	
							$params=[];
							
							if (isset($_GET['inv_date'])) {
								$params['inv_date'] = $_GET['inv_date'];
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
		</div>
	</footer>
</section>
<?php  include_once('footer.php'); ?>
 