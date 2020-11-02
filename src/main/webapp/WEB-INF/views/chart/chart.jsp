<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/ionicons.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="/resources/css/flaticon.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css2/style.css">
<link rel="stylesheet" href="/resources/css2/responsive.css">
</head>
<body>

	<jsp:include page="../includes/menu.jsp" />
	
	<div class="hero-wrap hero-bread"
		style="background-image: url('/resources/images/bg_6.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">Admin Chart</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span
							class="mr-2"><a href="index.html">Chart</a></span>
					</p>
				</div>
			</div>
		</div>
	</div>
	

		<div class="container-fluid" id="container-wrapper" style="margin: 0 auto;">
          <div class="d-sm-flex align-items-center justify-content-between mb-4" style="margin-top: 30px;">
            <h1 class="h3 mb-0 text-gray-800">Admin Chart</h1>
          </div>
          
         
		
		
          

          <div class="row mb-3">
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div>
                      <div class="text-xs font-weight-bold text-uppercase mb-1">누적 판매액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><p id="counter1"></p></div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-success mr-2"><i class="fa fa-arrow-up"></i>펀딩 판매액</span><br>
                        <span id="counter1-1"></span><br>
                        <span class="text-success mr-2"><i class="fa fa-arrow-up"></i>상품 판매액</span><br>
                        <span id="counter1-2"></span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-primary"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Earnings (Annual) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div>
                      <div class="text-xs font-weight-bold text-uppercase mb-1">총 회원 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><p id="counter2"></p></div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span><br>
                        <span>Since last years</span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-shopping-cart fa-2x text-success"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- New User Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-300">
                <div class="card-body" style="height: 220px;">
                  <div class="row no-gutters align-items-center">
                    <div>
                      <div class="text-xs font-weight-bold text-uppercase mb-1">누적 주문건 수</div>
                      <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><p id="counter3"></p></div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-success mr-2"><i class="fas fa-arrow-up"></i>펀딩 주문건 수</span><br>
                        <span id="counter3-1"></span><br>
                        <span class="text-success mr-2"><i class="fas fa-arrow-up"></i>상품 주문건 수</span><br>
                        <span id="counter3-2"></span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-users fa-2x text-info"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div>
                      <div class="text-xs font-weight-bold text-uppercase mb-1">총 상품 개수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><p id="counter4"></p></div>
                      <div class="mt-2 mb-0 text-muted text-xs">
                        <span class="text-success mr-2"><i class="fas fa-arrow-up"></i>펀딩 상품 개수</span><br>
                        <span id="counter4-1"></span><br>
                        <span class="text-success mr-2"><i class="fas fa-arrow-up"></i>일반 상품 개수</span><br>
                        <span id="counter4-2"></span>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-warning"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

         <!-- Row -->
          <div class="row">
            <!-- Area Charts -->
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <b style="color: black;">2020년도 월별 매출액</b>
                </div>
                <div class="card-body">
                  <div style="width: 100%; height: 50%;" class="about-author d-flex p-4 bg-light">
					<canvas id="myChart"></canvas>
				  </div>
                  <hr>
                  Styling for the area chart can be found in the
                  <code>/js/demo/chart-area-demo.js</code> file.
                </div>
              </div>
            </div>
            <!-- Bar Chart -->
            <div class="col-lg-8">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <b style="color: black;">2020년도 상품 & 펀딩 월별 주문건 수 </b>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <div style="width: 100%; height: 410px;" class="about-author d-flex p-4 bg-light">
						<canvas id="myChart2"></canvas>
					</div>
                  </div>
                  <hr>
                  Styling for the bar chart can be found in the <code>/js/demo/chart-bar-demo.js</code> file.
                </div>
              </div>
            </div>
            <!-- Donut Chart -->
            <div class="col-lg-4">
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                   <b style="color: black;">2020년도 월별 회원가입자 수</b>
                </div>
                <div class="card-body">
                  <div class="chart-pie pt-4">
                    <div style="width: 100%; height: 60%;" class="about-author d-flex p-4 bg-light">
						<canvas id="myChart3"></canvas>
					</div>
                  </div>
                  <hr>
                  Styling for the donut chart can be found in the <code>/js/demo/chart-pie-demo.js</code> file.
                </div>
              </div>
            </div>
          </div>
         </div>
        </div>




	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<script src="/resources/js/jquery.stellar.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/aos.js"></script>
	<script src="/resources/js/jquery.animateNumber.min.js"></script>
	<script src="/resources/js/bootstrap-datepicker.js"></script>
	<script src="/resources/js/scrollax.min.js"></script>
	<script src="/resources/js/google-map.js"></script>
	<script src="/resources/js/main.js"></script>
	<script type="text/javascript" src="/resources/js/message.js"></script>
	<script type="text/javascript" src="/resources/js/chart.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript" src="/resources/js/message.js"></script>
	<script type="text/javascript">
	
	</script>
<script>
function numberCounter(target_frame, target_number) {
    this.count = 0; this.diff = 0;
    this.target_count = parseInt(target_number);
    this.target_frame = document.getElementById(target_frame);
    this.timer = null;
    this.counter();
};
numberCounter.prototype.counter = function() {
    var self = this;
    this.diff = this.target_count - this.count;
     
    if(this.diff > 0) {
        self.count += Math.ceil(this.diff / 5);
    }
     
    this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
     
    if(this.count < this.target_count) {
        this.timer = setTimeout(function() { self.counter(); }, 20);
    } else {
        clearTimeout(this.timer);
    }
};
//우선 컨텍스트를 가져옵니다. 
var ctx = document.getElementById("myChart").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/

	$(document).ready(function(){

		ChartService.otMChart(function(result){

			var myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ["2020-01월", "2020-02월", "2020-03월", "2020-04월", "2020-05월", 
				        		"2020-06월", "2020-07월", "2020-08월", "2020-09월", "2020-10월"],
			        datasets: [{
			            label: '매출액',
			            data: [result.mon1, result.mon2, result.mon3, result.mon4, result.mon5, result.mon6, result.mon7,
			            	   result.mon8, result.mon9, result.mon10], // 그래프의 데이터가 들어갈부분
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.6)',
			                'rgba(54, 162, 235, 0.6)',
			                'rgba(255, 206, 86, 0.6)',
			                'rgba(75, 192, 192, 0.6)',
			                'rgba(153, 102, 255, 0.6)',
			                'rgba(255, 159, 64, 0.6)',
			                'rgba(255, 99, 132, 0.6)',
			                'rgba(54, 162, 235, 0.6)',
			                'rgba(255, 206, 86, 0.6)'
			            ],
			            borderColor: [
			                'rgba(255,99,132,1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)',
			                'rgba(255,99,132,1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                    
			                }
			            }]
			        }
			    }
			});

			
			
			});

		ChartService.pMChart(function(result1){
			ChartService.fMChart(function(result2){

				var ctx2 = document.getElementById('myChart2');
				  
				var config = {
					type: 'line',
					data: {
						labels: [ // Date Objects
							'2020-01월',
							'2020-02월',
							'2020-03월',
							'2020-04월',
							'2020-05월',
							'2020-06월',
							'2020-07월',
							'2020-08월',
							'2020-09월',
							'2020-10월'
						],
						datasets: [{
							label: '일반상품 주문건 수',
							backgroundColor: 'rgba(75, 192, 192, 1)',
							borderColor: 'rgba(75, 192, 192, 1)',
							fill: false,
							data: [
								result1.mon1,
								result1.mon2,
								result1.mon3,
								result1.mon4,
								result1.mon5,
								result1.mon6,
								result1.mon7,
								result1.mon8,
								result1.mon9,
								result1.mon10
							],
						}, {
							label: '펀딩상품 주문건 수',
							backgroundColor: 'rgba(255, 99, 132, 1)',
							borderColor: 'rgba(255, 99, 132, 1)',
							fill: false,
							data: [
								result2.mon1,
								result2.mon2,
								result2.mon3,
								result2.mon4,
								result2.mon5,
								result2.mon6,
								result2.mon7,
								result2.mon8,
								result2.mon9,
								result2.mon10,
							],
						}]
					},
					options: {
						maintainAspectRatio: false,
						title: {
							text: 'Chart.js Time Scale'
						},
						scales: {
							yAxes: [{
								scaleLabel: {
									display: true,
									labelString: '차트'
								}
							}]
						},
					}
				};
				
				var myChart2 = new Chart(ctx2, config);

				new numberCounter("counter3", result2.mon1 + result2.mon2 + result2.mon3 + result2.mon4 + result2.mon5
						+ result2.mon6 + result2.mon7 + result2.mon8 + result2.mon9 + result2.mon10
						+ result1.mon1 + result1.mon2 + result1.mon3 + result1.mon4 + result1.mon5
						+ result1.mon6 + result1.mon7 + result1.mon8 + result1.mon9 + result1.mon10);
				new numberCounter("counter3-1", result2.mon1 + result2.mon2 + result2.mon3 + result2.mon4 + result2.mon5
						+ result2.mon6 + result2.mon7 + result2.mon8 + result2.mon9 + result2.mon10);
				new numberCounter("counter3-2", result1.mon1 + result1.mon2 + result1.mon3 + result1.mon4 + result1.mon5
						+ result1.mon6 + result1.mon7 + result1.mon8 + result1.mon9 + result1.mon10 + "건");
				
				});
			});

		ChartService.mMChart(function(result3){

			data = { 
					datasets: 
						[{ 
							backgroundColor: ['rgba(255, 99, 132, 0.5)','rgba(54, 162, 235, 0.5)','rgba(255, 206, 86, 0.5)',
								'#00A5E3','#82F9B7','#E6B36D','#C65FF9','#FFD700','#87F5F5'
											  ],
							 data: [result3.mon1, result3.mon2, result3.mon3, result3.mon4, 
								 result3.mon5, result3.mon6, result3.mon7, result3.mon8, result3.mon9,result3.mon10] 
						 }],
						 	// 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남 
						 	labels: ['2020-01월',
									 '2020-02월',
									 '2020-03월',
									 '2020-04월',
									 '2020-05월',
									 '2020-06월',
									 '2020-07월',
									 '2020-08월',
									 '2020-09월',
									 '2020-10월'] }; 
			 // 가운데 구멍이 없는 파이형 차트
			  var ctx3 = document.getElementById("myChart3"); 
			  var myPieChart = new Chart(ctx3, { type: 'pie', data: data, options: {} }); 

			});

		ChartService.tcMChart(function(result){
			ChartService.tMChart(function(result2){
			
			new numberCounter("counter1", result.totalCost);
			new numberCounter("counter1-1", result.fundingTotal);
			new numberCounter("counter1-2", result.productTotal);
			new numberCounter("counter2", result2.totalMember);
			
			});
		});
		
		ChartService.pftMChart(function(result){

			new numberCounter("counter4", result.p_id + result.fp_id);
			new numberCounter("counter4-1", result.p_id);
			new numberCounter("counter4-2", result.fp_id);

			});		
		});
	

</script>
<jsp:include page="../includes/footer.jsp" />
</body>
</html>