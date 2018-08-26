$(()=>{
	"use strict";
	$("li").removeClass('active')
	$("#dictionary").addClass('active')
	$("#logstat").addClass('active')
	
	$("#kanjiSearch").on("click",function(){
		var kan = $("#kanji").val()
		if(kan.length<1){
			alert("검색 내용을 입력해주세요")
		}else{
		$("#siraberu").attr("action","dic/sagasu.do")
		$("#siraberu").attr("method","POST")
		$("#siraberu").submit()
		}
	})
//	$("#kanji input[name=searchKanji]").keypress(function(e) {
//		if (e.keyCode == 13){
//			alert("!")
//			var kan = $("#kanji").val()
//			if(kan.length<1){
//				alert("검색 내용을 입력해주세요")
//			}else{
//			$("#siraberu").attr("action","dic/sagasu.do")
//			$("#siraberu").attr("method","POST")
//			$("#siraberu").submit()
//			}
//			} 
//		});  
	
	$("#src-lang").change(function(){
		var it = $("#src-lang").val()
		if(it!="ko"){
			$("#target-lang").val("ko")
		}
		if(it=="ko"){
			$("#target-lang").val("ja")
		}
	})
	$("#target-lang").change(function(){
		var it = $("#target-lang").val()
		if(it!="ko"){
			$("#src-lang").val("ko")
		}
		if(it=="ko"){
			$("#src-lang").val("ja")
		}
	})
	
	$("#transtxt").on('click',function(){
		$.ajax({
			url:'dic/trans.do',					//action
			type:'POST',						//method
			data: {
				"srcLang" :$("#src-lang").val()
				,"targetLang" : $("#target-lang").val()
				,"transQuery" : $("#trans-query").val()
				},
			success: function(data){  //data는 응답값
				$(".transbox").text(data.translatedText)
			},
			error:function(request,status,error){
//				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				$(".transbox").text("알려지지않은 에러발생.")
			}
		})
		
		
	})
	
})