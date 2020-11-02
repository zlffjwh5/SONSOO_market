/**
 * 
 */

var cardNumberFormat = /^((?:4\d{3})|(?:5[1-5]\d{2})|(?:6011)|(?:3[68]\d{2})|(?:30[012345]\d))[ -]?(\d{4})[ -]?(\d{4})[ -]?(\d{4}|3[4,7]\d{13})$/;
var expDateFormat = /^((0[1-9])|(1[0-2]))\/(\d{2})$/;
var securityCodeFormat = /^([0-9]{3,4})$/;

var str = '<img id="icon" src="/resources/images/xicon.png" width="15" height="20" style="margin-left: 5px; margin-right: 5px;"><b class="d-flex" id="info" style="float: right;"></b>';
var oicon = "/resources/images/oicon.png";

$(document).ready(function() {

					//카드번호 형식 검사
					$('#cardNumber').change(function() {
						if(!cardNumberFormat.test($('#cardNumber').val())){
							$('#number #info').remove();
							$('#number #icon').remove();
							$('#number').append(str);
							$("#number #info").html('카드번호를 정확하게 입력해주세요.');
							$('#cardNumber').focus();
						}
						
						if(cardNumberFormat.test($('#cardNumber').val())){
							$("#number #info").remove();
							$("#number #icon").attr("src",oicon);
							$("#cardNumber").attr("readonly", true);
							$('#numberChecked').val('true');
							$('#expDate').focus();
						}
					});

					//만료일 형식 검사
					$('#expDate').change(function() {
						if(!expDateFormat.test($('#expDate').val())){
							$('#exp #info').remove();
							$('#exp #icon').remove();
							$('#exp').append(str);
							$("#exp #info").html('만료일을 정확하게 입력해주세요.');
							$('#expDate').focus();
						}
						
						if(expDateFormat.test($('#expDate').val())){
							$("#exp #info").remove();
							$("#exp #icon").attr("src",oicon);
							$("#expDate").attr("readonly", true);
							$('#expChecked').val('true');
							$('#securityCode').focus();
						}
					});

					//cvc,cvv 형식 검사
					$('#securityCode').change(function() {
						if(!securityCodeFormat.test($('#securityCode').val())){
							$('#security #info').remove();
							$('#security #icon').remove();
							$('#security').append(str);
							$("#security #info").html('코드를 정확하게 입력해주세요.');
							$('#securityCode').focus();
						}
						
						if(securityCodeFormat.test($('#securityCode').val())){
							$("#security #info").remove();
							$("#security #icon").attr("src",oicon);
							$("#securityCode").attr("readonly", true);
							$('#securityChecked').val('true');
						}
					});

					
					
});
		