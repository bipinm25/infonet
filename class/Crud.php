<?php
include_once 'DbConfig.php';
include_once 'common_settings.php';

class Crud extends DbConfig
{
	public function __construct()
	{
		parent::__construct();		
	}
	
	public function getData($query)
	{		
	
		$result = $this->connection->query($query);
		
		if ($result == false) {
			return false;
		} 
		
		$rows = array();
		
		while ($row = $result->fetch_assoc()) {
			$rows[] = $row;
		}
		
		return $rows;
	}
		
	public function execute($query) 
	{
		$result = $this->connection->query($query);
		
		if ($result == false) {
			error_log('Error: ' . $query . '<br>' . $this->connection->error);
			return false;
		} else {
			return $this->connection->insert_id;
		}		
	}
	
	public function number_of_records($query)
	{	
		$result = $this->connection->query($query);
		//var_dump($query);
		return $result->num_rows;
	}
	
	
	
	public function escape_string($value)
	{
		return $this->connection->real_escape_string($value);
	}
	
	public function getSettings(){
		
		$settings = $this->getData("select * from common_settings LIMIT 1");
		
		return (array) $settings[0];
	}
	
	public function login($user, $pass){
		
		$result = $this->getData("select * from users WHERE email = '$user' and password='$pass' LIMIT 1");
		
		if (!empty($result) && sizeof($result[0])>0 ) {
			session_start();
			$_SESSION['user_id'] = $result[0]['user_id'];
			$_SESSION['user_name'] = $result[0]['username'];
			$_SESSION['user_email'] = $result[0]['email'];
			$_SESSION['dbname'] = $result[0]['dbname'];
			$_SESSION['db_uname'] = $result[0]['db_uname'];
			$_SESSION['db_pwd'] = $result[0]['db_pwd'];			
			$_SESSION['login'] = true;			
			return true;	
		}else{
			return false;
		}	
		
	}
	
	public function dashboard_data()
	{
		//$where = $_SESSION['is_global']?'':" and p.country_id=".$_SESSION['country_id']."";
		
		$total_sales = $this->getData("select sum(sm.Grand_Total) as Grand_Total from sales_master sm  ");
		
		$today = $this->getData("select sum(sm.Grand_Total) from sales_master sm where date(sm.Invoice_Date)='".date('Y-m-d')."'");
		
		list($w_start,$w_end) = $this->x_week_range(date('Y-m-d'));
		
		$week = $this->getData("select sum(sm.Grand_Total) from sales_master sm  where date(sm.Invoice_Date) between '".$w_start."' and '".$w_end."' ");
		
		$month = $this->getData("select sum(sm.Grand_Total) from sales_master sm where date(sm.Invoice_Date) between '".date('Y-m-1')."' and '".date('Y-m-t')."' ");
		
		for ($i = 1; $i < 12; $i++) {
			if ($i==11) {
				$month_start = date('Y-m-1', strtotime("-$i month")); //last 6 month
			}
		}
		$month_end = date('Y-m-t');
		
		$chart_data = $this->getData("SELECT month(sm.Invoice_Date) month,sum(sm.Grand_Total) total,sm.Company_Id,.c.Company_Name,c.Color FROM  sales_master sm
		                                left join company c on sm.Company_Id=c.Company_ID
	                                    where  date(sm.Invoice_Date) between '".$month_start."' and '".$month_end."' $where
										group by sm.Company_Id,month(sm.Invoice_Date)");
		
										$chart_data_new=[];
										$_mon =[1,2,3,4,5,6,7,8,9,10,11,12];
										
										foreach ($chart_data as $k=>$chart) {
											if (!empty($chart['month'])) {

												$chart_data_new[$chart['Company_Name']][$chart['month']] = $chart['total'];
												$chart_data_new[$chart['Company_Name']]['color'] = $chart['Color'];								
											}
										}

										$chart_date = $chart_data_new;

										foreach($chart_data_new as $k => $v){
											$months = array_keys($v);
											$diff = array_diff($_mon,$months);
											if(!empty($diff)){
												foreach($diff as $mon){
													$chart_date[$k][$mon] = 0;
												}
											}
											ksort($chart_date[$k]);

										}
										
		
		$data = ['sales' => ['total' => $this->num_format($total_sales[0]['Grand_Total']), 'today' => $this->num_format($today[0]['Grand_Total']), 'week' => $this->num_format($week[0]['Grand_Total']), 'month' => $this->num_format($month[0]['Grand_Total'])  ],'chart' =>$chart_date ];
				 
		 return $data;			
	}
	
	public function x_week_range($date)
	{
		$ts = strtotime($date);
		$start = (date('w', $ts) == 0) ? $ts : strtotime('last sunday', $ts);
		return array(date('Y-m-d', $start),
		date('Y-m-d', strtotime('next saturday', $start)));
	}

	
	public function is_loggedin(){
		
		return $_SESSION['login'];
	}
	
	public function get_session()
	{		
		return $_SESSION['login'];		
	}
	
	public function user_logout()
	{		
		$_SESSION['login'] = FALSE;		
		session_destroy();		
	}
	
	function is_decimal($val)
	{
		return is_numeric($val) && floor($val) != $val;
	}
	public function format_date($date, $istime = 0)
	{
		if(!$istime){
			return date('Y-m-d', strtotime($date));
		}
		
	}

	public function disp_date($date, $istime = 0)
	{
		if(!$istime){
			return date('d-m-Y', strtotime($date));
		}
		
	}

	public function num_format($val)
	{
			return number_format($val, 2, '.', '');
	}
	
	public function err_log($data, $flag = 0){
		if($flag == 0){
			error_log($data);
		}
		else{
			error_log(print_r($data,1));
		}
		
	}
	
	
}
?>
