<?php 
require_once 'php_action/core.php'; 
// ค้นหา Username
    $user_id = $_SESSION['userId'];
    $q = "SELECT username FROM users WHERE user_id ='$user_id' ";
    $result = $connect->query($q);
    $rs = $result->fetch_array();
    $usern = $rs['0'];
    $startDate = $_POST['startDate'];
    $endDate = $_POST['endDate'];
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ระบบขายสินค้า | MrG Soft</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="assests/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="custom/css/custom.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- file input -->
  <link rel="stylesheet" href="assests/plugins/fileinput/css/fileinput.min.css">
  
  <!-- Theme style -->
  
  <!-- jquery -->
  <script src="assests/jquery/jquery.min.js"></script>
  <!-- jquery ui -->  
  <link rel="stylesheet" href="assests/jquery-ui/jquery-ui.min.css">
  <script src="assests/jquery-ui/jquery-ui.min.js"></script>
  <script src="assests/bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

  <?php include("headerMenu.php");?>
  <!-- Full Width Column -->
    <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Main content -->
    <section class="content-header">
      <h1>ระบบขายสินค้า</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> หน้าหลัก</a></li>
        <li class="active">ขายสินค้า</li>
      </ol>
    </section>
  
    <form action="reportDays.php" method="post" target="_blank">
    <input type="hidden" name="username" value="<?php echo $usern;?>">
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-success">
            <div class="box-header with-border">
              <h4 class="bordercool">3. รายงานการขายสินค้าประจำเดือน <?php echo $startDate;?> ถึง <?php echo $endDate;?></h4>
        	
              <div class="box-body">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                  <tr class="bg-primary">
                    <th style="text-align: center">วัน / เดือน / ปี</th>
                    <th style="text-align: center">ช่องทางขายสินค้า</th>
                    <th style="text-align: center">จำนวนที่ขาย(ราย)</th>
                    <th style="text-align: center">ราคาขาย</th>
                    <th style="text-align: center">ภาษี</th>
                    <th style="text-align: center">ยอดรวม(บาท)</th>
                    <th style="text-align: center">ผู้บันทึก</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php
                  
                  $q = "SELECT sales.sales_date, sales_channel.sale_channel, COUNT(sales.sales_id) as sales_count, 
                  SUM(sales.sub_total) as sub, SUM(sales.vat)as vat, SUM(sales.grand_total) as total, sales.username 
                  FROM sales 
                  INNER JOIN sales_channel ON (sales.sale_channel_id = sales_channel.sale_channel_id) 
                  WHERE sales.sales_date BETWEEN '$startDate' AND '$endDate' 
                  GROUP BY sales.sales_date,sales.sale_channel_id 
                  ORDER BY sales.sales_date, sales_channel.sale_channel_id"; 
                  $result_ = $connect->query($q);
                    while($row = $result_->fetch_array()) {
                  $sale_date = $row['sales_date'];
                  $sale_channel = $row['sale_channel'];
                  $sales_count = $row['sales_count'];
                  $sub_total = number_format($row['sub'],2);
                  $sub += $row['sub'];
                  $fsub = number_format($sub,2);
                  $vat = number_format($row['vat'],2);
                  $fvat += $row['vat'];
                  $ffvat = number_format($fvat,2);
                  $grand_total = number_format($row['total'],2);
                  $sumFinal += $row['total'];
                  $sumFFinal = number_format($sumFinal,2);
                  $username = $row['username'];
                  ?>
                  <tr>
                    <td align="center"><span class="badge bg-info"><?php echo $sale_date?></span></td>
                    <td align="center"><span class="badge bg-blue"><?php echo $sale_channel;?></span></td>
                    <td align="center"><span class="badge bg-yellow"><?php echo $sales_count;?></span></td>
                    <td align="right"><span class="pull-right badge bg-aqua"><?php echo $sub_total;?></span></td>
                    <td align="right"><span class="pull-right badge bg-red"><?php echo $vat;?></span></td>
                    <td align="right"><span class="pull-right badge bg-green"><?php echo $grand_total;?></span></td>
                    <td align="center"><span class="pull-right badge bg-gray"><?php echo $username;?> </span></td>
                  </tr>
                  <?php } ?>
                  <tr>
                    <td colspan="3" align="center"><span class="label label-warning" style="font-size:18px;"><b>- รวมยอดขายตามช่วงวัน -</b></td>
                    <td align="right"><span class="label label-info" style="font-size:18px;"><b><?php echo $fsub;?></b></span></td>
                    <td align="right"><span class="label label-danger" style="font-size:18px;"><b><?php echo $ffvat;?></b></span></td>
                    <td align="right"><span class="label label-success" style="font-size:18px;"><b><?php echo $sumFFinal;?></b></span></td>
                    <td>&nbsp;</td>
                  </tr>  
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
          
          </div>
        </div>
      </div>
   	</section>
   </form>

</div>
<?php include("footer.php");?>

<!-- jQuery 3.1.1 -->
<script src="assests/jquery/jquery.js"></script>

<!-- file input -->
<script src="assests/plugins/fileinput/js/plugins/canvas-to-blob.min.js" type="text/javascript"></script>    
<script src="assests/plugins/fileinput/js/plugins/sortable.min.js" type="text/javascript"></script>    
<script src="assests/plugins/fileinput/js/plugins/purify.min.js" type="text/javascript"></script>
<script src="assests/plugins/fileinput/js/fileinput.min.js"></script>    
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="custom/js/autocomplete.js" type="text/javascript"></script>

</body>
</html>
