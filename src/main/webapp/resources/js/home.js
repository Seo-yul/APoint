$(()=>{
	"use strict";
	//상단 네비바에 페이지마다 눌림효과를 주기위함
	$("li").removeClass('active');
	$("#home").addClass('active');
	$("#logstat").addClass('active');
	
	//setInterval 내장함수를 이용해 1초마다 실시간 갱신
	setInterval(() => {
		$.ajax({
			url:"time",					//action
			type:"GET",						//method
			success: function(data){  //data는 응답값
				$("#time").html(data)
			},
			error:function(request,status,error){
//				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
		})
		
	}, 1000)
})