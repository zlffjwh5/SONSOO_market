console.log("Message Module....");

var MessageService = (function(){

	function add(message, callback, error){
		console.log("add reply............");
		
		$.ajax({
			type : 'post',
			url : '/msg/newMsg',
			data : JSON.stringify(message),
			contentType : 'application/json; charset=utf-8',
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function getReadMsgList(param, callback, error){
		
		var reader = param.reader;
		var page = param.page || 1;
		
		$.getJSON("/msg/rp/" + reader + "/" + page + ".json",
			function(data){
				if(callback){
					//callback(data);
					callback(data.readMsgCnt, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});	
	}
	
	function getSendMsgList(param, callback, error){
		
		var sender = param.sender;
		var page = param.page || 1;
		
		$.getJSON("/msg/sp/" + sender + "/" + page + ".json",
			function(data){
				if(callback){
					//callback(data);
					callback(data.sendMsgCnt, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});	
	}
	
	function readMsgDelete(msg_seq, callback, error){
		$.ajax({
			type : 'delete',
			url : '/msg/rp/' + msg_seq,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function sendMsgDelete(msg_seq, callback, error){
		$.ajax({
			type : 'delete',
			url : '/msg/sp/' + msg_seq,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function getSendMessage(msg_seq, callback, error){
		$.get("/msg/sp/" + msg_seq + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function getReadMessage(msg_seq, callback, error){
		$.get("/msg/rp/" + msg_seq + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function notReadMsgCount(reader, callback, error){
		$.get("/msg/rmc/" + reader + ".json", function(result){
			if(callback){
				
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function displayTime(timeValue) {

			var today = new Date();
			var gap = today.getTime() - timeValue;
			var dateObj = new Date(timeValue);
			var str = "";

			if (gap < (1000 * 60 * 60 * 24)) {
				var hh = dateObj.getHours();
				var mi = dateObj.getMinutes();
				var ss = dateObj.getSeconds();

				return [ (hh > 9 ? '' : '0') + hh, ':',
						(mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ]
						.join('');
			} else {
				var yy = dateObj.getFullYear();
				var mm = dateObj.getMonth() + 1;
				var dd = dateObj.getDate();

				return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
						(dd > 9 ? '' : '0') + dd ].join('');
			}
		}
		
		function readMsgCheck(MsgCheck, callback, error){
			console.log("RNO : " + MsgCheck.msg_seq);
			
			$.ajax({
				type : 'put',
				url : '/msg/' + MsgCheck.msg_seq,
				data : JSON.stringify(MsgCheck),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er){
					error(er);
				}
			});
		}
		
	
		function unreadMsg3Cnt(param, callback, error){
		
		var reader = param.reader;
		
		$.getJSON("/msg/rm3/" + reader + ".json",
			function(data){
				if(callback){
					
					callback(data);
				}
			}).fail(function(xhr,status,err){
				if(error){
					error();
				}
			});
		}
		
		function sendMsgMemberCheck(reader, callback, error){
		$.get("/msg/smc/" + reader + ".json", function(result){
			if(callback){
				
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	return {
		add : add,
		getReadMsgList : getReadMsgList,
		getSendMsgList : getSendMsgList,
		readMsgDelete : readMsgDelete,
		sendMsgDelete : sendMsgDelete,
		getSendMessage : getSendMessage,
		getReadMessage : getReadMessage,
		displayTime : displayTime,
		readMsgCheck : readMsgCheck,
		notReadMsgCount : notReadMsgCount,
		unreadMsg3Cnt : unreadMsg3Cnt,
		sendMsgMemberCheck : sendMsgMemberCheck
		};
	
})();