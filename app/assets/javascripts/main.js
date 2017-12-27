// import AliExpress from ‘aliexpress’

$(function(){
	const proxyurl = "https://cors-anywhere.herokuapp.com/";
	const apiUrl = "https://product-api-hungdo.herokuapp.com/"; // site that doesn’t send Access-Control-*
	var currentProduct={};

	$('.text-ajax').click(function(){
		console.log("obj");
	});
	
	


	$('.btn-quick-add-to-cart').click(function() {
		var productId = $(this).data('product-id');
		var quantity = 1;

		doAjaxAddToCart(productId, quantity);
	})

	$('.btn-add-to-cart').click(function() {
		var productId = $(this).data('product-id');
		var quantity = $("#AddToCartForm .qty").val();

		doAjaxAddToCart(productId, quantity);
	})

	var doAjaxAddToCart = function(productId, quantity) {
		$.ajax({
			type: "POST",
			url: "/order_lines",
			data: 'order_line[number]=' + quantity + "&order_line[product_id]=" + productId,
			beforeSend: function() {
				showLoading();
			},
			success: function(msg) {
				hideLoading();
				successAddToCart();
			},
			error: function(xhr, text) {
				if(text == 'error' && xhr.responseJSON.status == 422){
					showError(xhr.responseJSON.description);
				}else{
					showError("");
				}
			}
		});
	}

	var successAddToCart = function() {
		showSuccess('Success Add to Cart!');
	}

	var showSuccess = function(text) {
		// $('#alert-success').iziModal('setSubtitle', subTitle);
		$('#alert-success .text').html(text);
		$('#alert-success').show();
	}
	var showError = function(text) {
		console.error(text);
	}

	var showLoading = function() {
		$('#item-loading-v1').show();
	}
	var hideLoading = function() {
		$('#item-loading-v1').hide();
	}   

	$(".btn-search-products").click(function() {
		var keyword = $('.-col-left .keyword').val();
		
		$.ajax({
			type: "POST",
			url: proxyurl+apiUrl+"search",
			dataType: "xml/html/script/json", // expected format for response
			contentType: "application/json",
			data: {
				keyword: keyword
			},
			beforeSend: function() {
				showLoading();
			},
			success: function(data) {
				hideLoading();
				successSearchProducts(data);
			},
			error: function(xhr, text) {
				showError(xhr);
			}
		});
	})

	$(".btn-get-product").click(function() {
		var url = $(".-col-right .link-product").val();

		getProduct(url, 17.5);
	})

	if (window.location.pathname == '/aliexpress') {
		showLoading();
		fetch(proxyurl + apiUrl) // https://cors-anywhere.herokuapp.com/https://product-api-hungdo.herokuapp.com
		.then(response => response.text())
		.then(data => successGetProducts(data))
		.catch(() => console.log("Can’t access " + apiUrl + " response. Blocked by browser?"))
	}

	function successGetProducts(data) {
		hideLoading();
		var products = JSON.parse(data);
		fillDataProducts(products);
	}

	function successSearchProducts(data) {
		fillDataProducts(data);
	}

	function fillDataProducts(products) {
		console.log(products);
		var productItemHtml = $(".product-item-html").html();
		var regex = /[+-]?\d+(\.\d+)?/g;
		
		$(".get-product-api .-col-left .product-list").html("");
		var productsList = $(".get-product-api .-col-left .product-list");
		
		for (var i = 0; i < products.length; i++) {
			var productItemHtmlTemp = productItemHtml;
			var product = products[i];
			
			productItemHtmlTemp = productItemHtmlTemp
			.replace("product_url_", product.url)
			.replace("name_", product.name)
			.replace("price_", product.price)
			.replace("name_", product.name)
			.replace("price_", product.price);
			productsList.append(productItemHtmlTemp);
		}
	}

	$(".get-product-api").on("click", ".btn-detail" , function() {
		var name = $(this).data("name");
		var productUrl = $(this).data("url");
		var price = $(this).data("price");

		getProduct("https:"+productUrl, price);
	})

	function getProduct(productUrl, price) {
		$.ajax({
			type: "POST",
			url: proxyurl+apiUrl+"detail",
			data: {
				url: productUrl
			},
			beforeSend: function() {
				showLoading();
			},
			success: function(data) {
				hideLoading();
				successGetProduct(data, price);
			},
			error: function(xhr, text) {
				showError(xhr);
			}
		});
	}

	function successGetProduct(data, price) {
		data.price = price;
		data.property.forEach(function(lineProperty) {
			data.description += " -" + lineProperty.title + " " + lineProperty.des + "<br>";
		})
		fillDataProduct(data);
	}

	function fillDataProduct(product) {
		console.log(product);
		currentProduct = product;
		if (product.gallery.length) {
			$(".product-detail img").attr("src", product.gallery[0].src);
		}
		$(".product-detail .name").html(product.name);
		$(".product-detail .price").html(product.price);
		$(".product-detail .description").html(product.description);
	}

	$(".get-product-api .btn-save").click(function(){
		currentProduct.category_id = Math.floor(Math.random()*4 + 1);
		currentProduct.img_url = currentProduct.gallery[0].src;
		currentProduct.quantity = 100;
		console.log(currentProduct);

		$.ajax({
			type: "POST",
			url: "/admin/product",
			data: "product[name]=" + currentProduct.name + 
			"&product[category_id]=" + currentProduct.category_id +
			"&product[price]=" + currentProduct.price +
			"&product[description]=" + currentProduct.description +
			"&product[quantity]=" + currentProduct.quantity +
			"&product[picture]=" + currentProduct.img_url,
			beforeSend: function() {
				showLoading();
			},
			success: function(data) {
				hideLoading();
				successCreateProduct(data);
			},
			error: function(xhr, text) {
				hideLoading();
				showError(xhr);
			}
		});
	})
	function successCreateProduct(data) {
		showSuccess('Created!');
		// console.log(data);
	}

	$('#alert-success .close, #alert-error .close').click(function(){
		$('#alert-success, #alert-error').hide();
	})

});

$(function() { engoPriceSlider(); });