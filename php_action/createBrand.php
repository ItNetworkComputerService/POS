<?php     

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {    

    $brandName = $_POST['brandName'];
    $brandStatus = $_POST['brandStatus']; 

    $sql = "INSERT INTO brands (brand_name, brand_active, brand_status) VALUES 
    ('$brandName', '$brandStatus', 1)";

    if($connect->query($sql) === TRUE) {
         $valid['success'] = true;
        $valid['messages'] = "บันทึกข้อมูลแล้ว";
    } else {
         $valid['success'] = false;
         $valid['messages'] = "ไม่สามารถบันทึกข้อมูลได้";
    }
     

    $connect->close();

    echo json_encode($valid);
 
} // /if $_POST