<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var chartData;

function getGenderly(){
	$.ajax({
		url : "/baegopangAdmin/jsp/chartData/genderSalesData.jsp",
		async : false,
		dataType : "json",
		success : function(data) {
			chartData = data;
		}
	});	
	return chartData;
}
var chart = AmCharts.makeChart( "chartdiv", {
	  "type": "pie",
	  "theme": "light",
	  "dataProvider": getGenderly(),
	  "titleField": "gender",
	  "valueField": "value",
	  "labelRadius": 5,

	  "radius": "42%",
	  "innerRadius": "60%",
	  "labelText": "[[gender]]"
	} );
</script>

<style>
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}							
</style>

<div id="chartdiv"></div>	
