
		$(document).ready(function() {
			
			var id = $('#id').val();

				/* 주문번호 생성 */
				$.ajax({
						url:'orderNumber',
						type:'POST',
						success:function(data){
							if(data!=null){
								$('#o_number').attr('readonly', true);
								$('#o_number').val(data.trim());
							}
							
						} 
				});

				


				/* 배송지 선택에 따른 회원 정보 조회 */
				function addrRecall(){
                	$.ajax({
                   		url:'getMember?id='+id,
                   		type:'GET',
                   		dataType: 'json',
                   		contentType:'application/json;charset=UTF-8',
                   		success:function(data){
                      		if(data!=null){
                         			$('#info').text('주문자의 정보와 동일한 배송지가 입력됩니다.');
                         			$('#name').val(data.name);
                         			$('#phone').val(data.phone);
                         			$('#postcode').val(data.postcode);
                         			$('#address').val(data.address);
                         			$('#detailAddress').val(data.detailAddress);
                         			$('#extraAddress').val(data.extraAddress);
                         			$('#coupon').val(data.coupon);
                         			$('#reg_date').val(data.reg_date);
                      		}
                   		}
                	});
				}


				addrRecall();

                $('#sameAddr').click(function(){
                	addrRecall();
				});

				$('#newAddr').click(function(){
					$('#info').text('새로운 배송지를 입력해주세요.');
					$('#name').val('');
                    $('#phone').val('');
                    $('#postcode').val('');
                    $('#address').val('');
                    $('#detailAddress').val('');
                    $('#extraAddress').val('');
                    $('#coupon').val('');
                    $('#reg_date').val('');
				});


				/* 회원이 보유하고 있는 쿠폰 목록 조회 */
				var couponName = "";
				var discount = "";
				
				$.ajax({
					 url:'getCoupon?id='+$('#id').val(),
	                   type:'GET',
	                   dataType: 'json',
	                   contentType:'application/json;charset=UTF-8',
	                   success:function(data){
	                      if(data!=null){
	                    	  $("#couponUsed").append("<option value='' selected>보유 목록</option>");
	                    	  for(i=0; i<data.length; i++){
		                    	  couponName = data[i].couponName;
		                    	  discount = data[i].discount;
	                    		  $("#couponUsed").append('<option value="'+discount+'">'+couponName+'</option>');
	                          }
	                    	  $("#couponUsed").append("<option value='0'>미적용</option>");
	                      }
	                   },
	                   error:function(data){$("#couponUsed").append("<option value='0'>미적용</option>");},
	                   fail:function(data){$("#couponUsed").append("<option value='0'>미적용</option>");}
				});


				/* 쿠폰에 따른 할인 적용 */
				$('#couponApply').click(function() {
					$('#couponUsed').attr('selected',false);
					$('#couponUsed').attr('selected',true);

					$('#discount').html($('#couponUsed').val());
					
					var totCost = $('#cost').html()-$('#couponUsed').val();

					$('#totCost').html(totCost);
					$('#totalCost').val(totCost);
				});
				
				
});
			
			//radio 버튼 중복 선택 방지
			if($("#paymentForm input[value='kakaoPay']").prop('checked', true)){
					$("#paymentForm input[value='cardPay']").prop('checked', false);
					$("#paymentForm input[id='policy']").val('');
			}

			if($("#paymentForm input[value='cardPay']").prop('checked', true)){
					$("#paymentForm input[value='kakaoPay']").prop('checked', false);
					$("#paymentForm input[id='policy']").val('');
			}

			//약관 동의 체크 후 체크 해제처리 시 'checked' 속성이 유지되는 발생하는 오류 방지
			function getValue(val,cnt){
				var count = Number(cnt) + 1;

				$('#cnt').val(count);
				
				if(count%2==0) $("#paymentForm input[id='policy']").val('');
				else if(count==1||count%3>=0) $("#paymentForm input[id='policy']").val('checked');
			}

			
		/* 결제 처리 */
		function payment(val){
			if(val=='' || val==null) alert('결제 진행을 원하시면 약관을 읽고 동의해주세요.');
			else if($('#couponUsed').val()=='' || $('#couponUsed').val()==null) alert('쿠폰 적용 여부를 선택해주세요.');
			else{
					var st = $("#paymentForm input[name=optradio]:checked").val();

					var data = {
							"partner_order_id": $('#id').val(),
							"partner_user_id": $('#id').val(),
							"item_name": $('#p_name').val(),
							"quantity": $('#qty').val(),
							"total_amount": $('#totalCost').val()
			 		};
			 		
				if(st=='kakaoPay') {
					alert('consol창에서 카카오페이 결제 URL을 복사한 후 주소창에 입력하여 결제를 진행해주세요.');
					$.ajax({
						url:'kakaoPay',
						type:'POST',
						data:JSON.stringify(data),
						dataType: 'json',
					 	async: false,
						contentType:'application/json;charset=UTF-8',
						success:function(data){
	   					}
					});
				}else if(st=='cardPay'){

					$('#payProcess').submit();
					
				}else { alert('결제 방법을 선택해주세요.'); }
			
			}
		}//결제 프로세스 END
			




//우편번호 찾기 
function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }			 