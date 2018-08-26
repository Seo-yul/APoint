$(()=>{
	"use strict";
	$("li").removeClass('active')
	$("#home").addClass('active')
	$("#logstat").addClass('active')
	var chuser="null"
	$.goattendance = ()=>{
		var userdevice = $("input[name=ud]").val()
		if(userdevice.length<1)
		alert("기기등록을 먼저 해주세요.")
		else var ch = confirm("출석하시겠습니까?")
		if(ch==true){
			var url = "http://apoint.cf/apoint/member/attendance.do"
			$(location).attr('href', url);
		} 
	}
	
	
	$.checkattend = (name,day)=>{
	   if(chuser=="null"){
			alert("학생을 선택해주세요")
		}else{
		    var flag = confirm(name+"을(를) 출석처리 하시겠습니까?")
		if(flag==true){
			$("#uid").val(chuser)
			$("#udt").val(day)
			$("#gocheck").attr("action","switchattend")
			$("#gocheck").attr("method","POST")
			$("#gocheck").submit()
			}
		}
	}
	
	$.checkabsence = (name,day)=>{
		 if(chuser=="null"){
				alert("학생을 선택해주세요")
			}else{
			    var flag = confirm(name+"을(를) 결석처리 하시겠습니까?")
			if(flag==true){
				$("#uid").val(chuser)
				$("#udt").val(day)
				$("#gocheck").attr("action","switchabsence")
				$("#gocheck").attr("method","POST")
				$("#gocheck").submit()
				}
			}
	}
	
	$.goregistdevice = ()=>{
		var userdevice = $("input[name=ud]").val()
		if(userdevice.length>1)
		alert("기기는 한번만 등록할 수 있습니다.")
		else var ch = confirm("기기는 한번만 등록할 수 있습니다!")
		if(ch==true){
			var url = "http://apoint.cf/apoint/member/registdevice"
			$(location).attr('href', url);
		} 
	}
	
	
	$.todayattend= ()=>{
		if(chuser=="null"){
			alert("학생을 선택해주세요")
		}else{
			var flag = confirm(chuser+"번을 출석처리 하시겠습니까?")
			if(flag==true){
			$("#uid").val(chuser)
			$("#gocheck").attr("action","todayattend")
			$("#gocheck").attr("method","POST")
			$("#gocheck").submit()
			}
			
		}
	}
	$.todayabsence= ()=>{
		if(chuser=="null"){
			alert("학생을 선택해주세요")
		}else{
			var flag = confirm(chuser+"번을 결석처리 하시겠습니까?")
			if(flag==true){
				$("#uid").val(chuser)
				$("#gocheck").attr("action","todayabsence")
				$("#gocheck").attr("method","POST")
				$("#gocheck").submit()
				}
		}
	}
	
	$("#idselect").change(function(){
		chuser = $("#idselect").val()
		$(".select-user").css("display","none")
		$("."+chuser).css("display","")
		
		
	})
	
})