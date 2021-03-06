<?php     

require_once 'core.php';

$sql = "
SELECT products.pid, products.product_id, products.product_name, categories.categories_name, 
products.quantity, units.unitName, products.rate, products.status 
FROM products
INNER JOIN units ON (products.uID = units.uID)
INNER JOIN categories ON (products.categories_id = categories.categories_id)
WHERE products.status = '1'
";

$result = $connect->query($sql);
$output = array('data' => array());

if($result->num_rows > 0) { 

 // $row = $result->fetch_array();
 $active = ""; 
    $i=0;
 while($row = $result->fetch_array()) {
	$i++;
    $productId = $row[0];
	$rate = $row['rate'];
	$rate = number_format($rate,2);
     // active 
     if($row['status'] == 1) {
         $active = "<button type='button' class='btn btn-success btn-sm'><i class='fa fa-fw fa-check'></i> ประเภทสินค้าพร้อมจำหน่าย</button>";
     } else {
         // deactivate member
         $active = "<button type='button' class='btn btn-warning btn-sm'><i class='fa fa-fw fa-close'></i> ประเภทสินค้าไม่พร้อมจำหน่าย</button>";
     }


     $button = '
     <a href="productEdit.php?edit='.$productId.'"><button type="button" class="btn btn-info btn-sm">
		<i class="fa fa-fw fa-pencil"></i></button></a>
     <a href="#" data-toggle="modal" data-target="#removeProductModal" onclick="removeProduct('.$productId.')">
		<button type="button" class="btn btn-danger btn-sm"><i class="fa fa-fw fa-trash-o"></i></button>
    </a>
    ';  

    $output['data'][] = array(  
	  $i, 
      $row['product_id'], 
      $row['product_name'],
      $row['categories_name'],
      $row['quantity'], 
      $row['unitName'], 
      $rate, 
      $active, 
      $button
      );

 } // /while 

}// if num_rows

$connect->close();
echo json_encode($output);