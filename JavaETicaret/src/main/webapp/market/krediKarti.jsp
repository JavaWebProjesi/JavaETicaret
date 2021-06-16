<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Odeme Yap</title>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<style>
.padding {
    padding: 5rem !important
}

.form-control:focus {
    box-shadow: 10px 0px 0px 0px #ffffff !important;
    border-color: #4ca746
}
</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/3.0.0/jquery.payment.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function($) {
	$('[data-numeric]').payment('restrictNumeric');
	$('.cc-number').payment('formatCardNumber');
	$('.cc-exp').payment('formatCardExpiry');
	$('.cc-cvc').payment('formatCardCVC');
	$.fn.toggleInputError = function(erred) {
	this.parent('.form-group').toggleClass('has-error', erred);
	return this;
	};
	$('form').submit(function(e) {
	e.preventDefault();
	var cardType = $.payment.cardType($('.cc-number').val());
	$('.cc-number').toggleInputError(!$.payment.validateCardNumber($('.cc-number').val()));
	$('.cc-exp').toggleInputError(!$.payment.validateCardExpiry($('.cc-exp').payment('cardExpiryVal')));
	$('.cc-cvc').toggleInputError(!$.payment.validateCardCVC($('.cc-cvc').val(), cardType));
	$('.cc-brand').text(cardType);
	$('.validation').removeClass('text-danger text-success');
	$('.validation').addClass($('.has-error').length ? 'text-danger' : 'text-success');
	});
	});
</script>
<div class="padding">
    <div class="row">
        <div class="container-fluid d-flex justify-content-center">
            <div class="col-sm-8 col-md-6">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-6"> <span>KREDI/BANKA KARTI BILGILERI</span> </div>
                            <div class="col-md-6 text-right" style="margin-top: -5px;"> <img src="https://img.icons8.com/color/36/000000/visa.png"> <img src="https://img.icons8.com/color/36/000000/mastercard.png"> <img src="https://img.icons8.com/color/36/000000/amex.png"> </div>
                        </div>
                    </div>
                    <div class="card-body" style="height: 350px">
                        <div class="form-group"> <label for="cc-number" class="control-label">KART NUMARA</label> <input id="cc-number" type="tel" class="input-lg form-control cc-number" autocomplete="cc-number" required> </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group"> <label for="cc-exp" class="control-label">KART TARIH</label> <input id="cc-exp" type="tel" class="input-lg form-control cc-exp" autocomplete="cc-exp" required> </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group"> <label for="cc-cvc" class="control-label">CVC NO</label> <input id="cc-cvc" type="tel" class="input-lg form-control cc-cvc" autocomplete="off" required> </div>
                            </div>
                        </div>
                        <div class="form-group"> <label for="numeric" class="control-label">KART SAHIBI ISIM-SOYISIM</label> <input type="text" class="input-lg form-control"> </div>
                        <div class="form-group"> <input value="Odeme Yap" type="button" class="btn btn-success btn-lg form-control" style="font-size: .8rem;"> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

