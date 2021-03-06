var manageProductTable;

$(document).ready(function() {
	// top nav bar 
	$('#navProduct').addClass('active');
	// manage product data table
	manageProductTable = $('#manageProductTable').DataTable({
		'ajax': 'php_action/fetchProduct.php',
		'columnDefs': [
			{ className : 'text-left', targets : [2] },
			{ className : 'text-center', targets : [0,1,2,3,4,5,7,8] },
			{ className : 'text-right', targets : [6] }
		],		
		'order': []
	});


	$("#productForm").unbind('submit').bind('submit', function() {

		var form = $(this);

		$(".text-danger").remove();

		var productCode = $("#productCode").val();
		var productName = $("#productName").val();
		var categories = $("#categories").val();
		var qty = $("#qty").val();
		var unit = $("#unit").val();
		var rate = $("#rate").val();
		var active = $("active").val();

		if(productCode == "" || productName == "" || categories == "" || qty == "" || unit =="" || rate =="" || active == "") {
			if(productCode == "") {
				$("#productCode").after('<p class="text-danger">กรุณากรอกรหัสสินค้า</p>');
				$("#productCode").closest('.form-group').addClass('has-error');
			} else {
				$("#productCode").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}

			if(productName == "") {
				$("#productName").after('<p class="text-danger">กรุณากรอกชื่อสินค้า</p>');
				$("#productName").closest('.form-group').addClass('has-error');
			} else {
				$("#productName").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}

			if(categories == "") {
				$("#categories").after('<p class="text-danger">กรุณาเลือกประเภทสินค้า</p>');
				$("#categories").closest('.form-group').addClass('has-error');
			} else {
				$("#categories").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}		

			if(qty == "") {
				$("#qty").after('<p class="text-danger">กรุณากรอกจำนวน</p>');
				$("#qty").closest('.form-group').addClass('has-error');
			} else {
				$("#qty").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}

			if(unit == "") {
				$("#unit").after('<p class="text-danger">กรุณาเลือกหน่วย</p>');
				$("#unit").closest('.form-group').addClass('has-error');
			} else {
				$("#unit").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}		

			if(rate == "") {
				$("#rate").after('<p class="text-danger">กรุณากรอกราคา</p>');
				$("#rate").closest('.form-group').addClass('has-error');
			} else {
				$("#rate").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}

			if(active == "") {
				$("#active").after('<p class="text-danger">กรุณากรอกราคา</p>');
				$("#active").closest('.form-group').addClass('has-error');
			} else {
				$("#active").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}			


		} else {
			$(".form-group").removeClass('has-error');
			$(".text-danger").remove();

			$.ajax({
				url: form.attr('action'),
				type: form.attr('method'),
				data: form.serialize(),
				dataType: 'json',
				success:function(response) {
					console.log(response);
					if(response.success == true) {
					$('.createProductMessages').html('<div class="alert alert-success">'+
	            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
	            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
	          	'</div>');

				// remove the mesages
	          	$(".alert-success").delay(500).show(10, function() {
							$(this).delay(2000).fadeOut('slow');
					}); // /.alert
	          	$("#productForm")[0].reset();
				} 

				} // /success function
			}); // /ajax function

		} // /else


		return false;
	});	


	$("#productEditForm").unbind('submit').bind('submit', function() {

		var form = $(this);

		$(".text-danger").remove();

		var productCode = $("#productCode").val();
		var productName = $("#productName").val();
		var categories = $("#categories").val();
		var qty = $("#qty").val();
		var unit = $("#unit").val();
		var rate = $("#rate").val();
		var active = $("#active").val();

		if(productCode == "" || productName == "" || categories == "" || qty == "" || unit == "" || rate == "" || active == "") {
			if(productCode == "") {
				$("#productCode").after('<p class="text-danger">กรุณากรอกรหัสสินค้า</p>');
				$("#productCode").closest('.form-group').addClass('has-error');
			} else {
				$("#productCode").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}

			if(productName == "") {
				$("#productName").after('<p class="text-danger">กรุณากรอกชื่อสินค้า</p>');
				$("#productName").closest('.form-group').addClass('has-error');
			} else {
				$("#productName").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}

			if(categories == "") {
				$("#categories").after('<p class="text-danger">กรุณาเลือกประเภทสินค้า</p>');
				$("#categories").closest('.form-group').addClass('has-error');
			} else {
				$("#categories").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}
			if(qty == "") {
				$("#qty").after('<p class="text-danger">กรุณากรอกที่อยู่</p>');
				$("#qty").closest('.form-group').addClass('has-error');
			} else {
				$("#qty").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}
			if(unit == "") {
				$("#unit").after('<p class="text-danger">กรุณาเลือกหน่วยนับสินค้า</p>');
				$("#unit").closest('.form-group').addClass('has-error');
			} else {
				$("#unit").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}
			if(rate == "") {
				$("#rate").after('<p class="text-danger">กรุณากรอกราคาสินค้า</p>');
				$("#rate").closest('.form-group').addClass('has-error');
			} else {
				$("#rate").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}
			if(active == "") {
				$("#active").after('<p class="text-danger">กรุณาเลือกสถานะ</p>');
				$("#active").closest('.form-group').addClass('has-error');
			} else {
				$("#active").closest('.form-group').removeClass('has-error');
				$(".text-danger").remove();
			}			


		} else {
			$(".form-group").removeClass('has-error');
			$(".text-danger").remove();

			$.ajax({
				url: form.attr('action'),
				type: form.attr('method'),
				data: form.serialize(),
				dataType: 'json',
				success:function(response) {
					console.log(response);
					if(response.success == true) {
					$('.editProductMessages').html('<div class="alert alert-success">'+
	            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
	            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
	          	'</div>');

				// remove the mesages
	          	$(".alert-success").delay(500).show(10, function() {
							$(this).delay(2000).fadeOut('slow');
						}); // /.alert	    
				} 


				} // /success function
			}); // /ajax function

		} // /else


		return false;
	});


}); // document.ready fucntion



// remove product 
function removeProduct(productId = null) {
	if(productId) {
		// remove product button clicked
		$("#removeProductBtn").unbind('click').bind('click', function() {
			// loading remove button
			$("#removeProductBtn").button('loading');
			$.ajax({
				url: 'php_action/removeProduct.php',
				type: 'post',
				data: {productId: productId},
				dataType: 'json',
				success:function(response) {
					// loading remove button
					$("#removeProductBtn").button('reset');
					if(response.success == true) {
						// remove product modal
						$("#removeProductModal").modal('hide');

						// update the product table
						manageProductTable.ajax.reload(null, false);

						// remove success messages
						$(".remove-messages").html('<div class="alert alert-success">'+
		            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
		            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
					'</div>');

						// remove the mesages
						$(".alert-success").delay(500).show(10, function() {
							$(this).delay(2000).fadeOut('slow');
						}); // /.alert	
					} else {

						// remove success messages
						$(".removeProductMessages").html('<div class="alert alert-success">'+
		            '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
		            '<strong><i class="glyphicon glyphicon-ok-sign"></i></strong> '+ response.messages +
					'</div>');

						// remove the mesages
						$(".alert-success").delay(500).show(10, function() {
							$(this).delay(2000).fadeOut('slow');
						}); // /.alert	

					} // /error
				} // /success function
			}); // /ajax fucntion to remove the product
			return false;
		}); // /remove product btn clicked
	} // /if productid
} // /remove product function

function clearForm(oForm) {
	// var frm_elements = oForm.elements;									
	// console.log(frm_elements);
	// 	for(i=0;i<frm_elements.length;i++) {
	// 		field_type = frm_elements[i].type.toLowerCase();									
	// 		switch (field_type) {
	// 	    case "text":
	// 	    case "password":
	// 	    case "textarea":
	// 	    case "hidden":
	// 	    case "select-one":	    
	// 	      frm_elements[i].value = "";
	// 	      break;
	// 	    case "radio":
	// 	    case "checkbox":	    
	// 	      if (frm_elements[i].checked)
	// 	      {
	// 	          frm_elements[i].checked = false;
	// 	      }
	// 	      break;
	// 	    case "file": 
	// 	    	if(frm_elements[i].options) {
	// 	    		frm_elements[i].options= false;
	// 	    	}
	// 	    default:
	// 	        break;
	//     } // /switch
	// 	} // for
}
