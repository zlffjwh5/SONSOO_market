console.log("Chart Module!!!!!!!!");

var ChartService = (function(){

	function mMChart(callback,error){
	
		$.get("/chart/ct/mMchart.json", function(result){
			if(callback){
				
				callback(result);
			}
		}).fail(function(){
			if(error){
				
				error();
			}
		});
	}
	function pMChart(callback, error){
		$.get("/chart/ct/pMchart.json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(){
			if(error){
				error();
			}
		});
	}
	
	function fMChart(callback, error){
		$.get("/chart/ct/fMchart.json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(){
			if(error){
				error();
			}
		});
	}
	
	function otMChart(callback, error){
		$.get("/chart/ct/otMchart.json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(){
			if(error){
				error();
			}
		});
	}
	
	function tcMChart(callback, error){
		$.get("/chart/ct/tcMchart.json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(){
			if(error){
				error();
			}
		});
	}
	
	function tMChart(callback, error){
		$.get("/chart/ct/tMchart.json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(){
			if(error){
				error();
			}
		});
	}
	
	function pftMChart(callback, error){
		$.get("/chart/ct/pftMchart.json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(){
			if(error){
				error();
			}
		});
	}

	
	return{
	
		mMChart : mMChart,
		pMChart : pMChart,
		fMChart : fMChart,
		otMChart : otMChart,
		tcMChart : tcMChart,
		tMChart : tMChart,
		pftMChart : pftMChart
	
	};

})();

