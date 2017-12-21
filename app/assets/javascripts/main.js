// import AliExpress from ‘aliexpress’

$(function(){

	$('.text-ajax').click(function(){
		console.log("obj");
	});
		// AliExpress.BestSelling.get().then(function(goods){
		// 	console.log('Best Selling items:');

		// 	console.log(goods);
		// });

	$('.action.add-to-cart').click(function(){
		var productId = $(this).data('product-id');
		var quantity  = $("#AddToCartForm .qty").val();

		$.ajax({
        type: "post",
        url: "/order_lines",
        data: 'order_line[number]=' + quantity + "&order_line[product_id]=" + productId,
        // dataType: 'json',
        beforeSend: function() {
            // ShowLoading();
            console.log("--------");
        },
        success: function(msg) {
            // HideLoading();
            // $('.canvas-menu-toggle.sn-back-to-top i').animate({fontSize: '160%'},400).animate({fontSize: '100%'},500);
            // resetCart(showCart);
            console.log('sdfsdfsd');
        },
        error: function(xhr, text) {
            // console.log('ahii');
            console.error(xhr);
            console.log(text);
            // if(text == 'error' && xhr.responseJSON.status == 422){
                // AlertError(xhr.responseJSON.description);
            // }else{
                // AlertError("");
            // }
        }
    });
	});	

	$('.action.add-to-cart').click(function() {
		var productId = $(this).data('product-id');
		var quantity = $('#AddToCartForm .quantity .qty').val();
		
		$.ajax({
			type: "POST",
			url: "/order_line",
			data: 'number=' + quantity + "&product_id=" + productId,
			dataType: 'json',
			beforeSend: function() {
				// ShowLoading();
			},
			success: function(msg) {
				HideLoading();
				$('.canvas-menu-toggle.sn-back-to-top i').animate({fontSize: '160%'},400).animate({fontSize: '100%'},500);
				resetCart(showCart);
			},
			error: function(xhr, text) {
				if(text == 'error' && xhr.responseJSON.status == 422){
					AlertError(xhr.responseJSON.description);
				}else{
					AlertError("");
				}
			}
		});
	})

});

$(function() { engoPriceSlider(); });