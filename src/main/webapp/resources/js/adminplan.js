$(()=>{
	"use strict";
	$("li").removeClass('active')
	$("#home").addClass('active')
	$("#logstat").addClass('active')
	
	var date = new Date();
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();

    if (month < 10) month = "0" + month;
    if (day < 10) day = "0" + day;

    var today = year + "-" + month + "-" + day;       
    $("#wpdate").attr("value", today);
	$("#mpdate").attr("value", today);
	
	
	$("#weekbtn").on("click",function(){
		var todo = $("#wtoDo").val()
		var pdate = $("#wpdate").val()
		if(pdate.length<1){
			alert("날짜를 입력해주세요")
		}else{
			if(todo.length<1){
				alert("주간계획을 입력해주세요")
			}else{
			$("#weekform").attr("action","plan/addWeekPlan")
			$("#weekform").attr("method","POST")
			$("#weekform").submit()
			}
		}
		
	})
	
	$("#monthbtn").on("click",function(){
		var todo = $("#mtoDo").val()
		var pdate = $("#mpdate").val()
		if(pdate.length<1){
			alert("날짜를 입력해주세요")
		}else{
			if(todo.length<1){
				alert("월간계획을 입력해주세요")
			}else{
			$("#monthform").attr("action","plan/addMonthPlan")
			$("#monthform").attr("method","POST")
			$("#monthform").submit()
			}	
		}
		
	})
	
})