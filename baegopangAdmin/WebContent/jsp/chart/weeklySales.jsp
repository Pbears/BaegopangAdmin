<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
var chartData;

function getWeekly(){
	$.ajax({
		url : "/baegopangAdmin/jsp/chartData/weeklySalesData.jsp",
		async : false,
		dataType : "json",
		success : function(data) {
			chartData = data;
		}
	});	
	return chartData;
}

var chart = AmCharts.makeChart( "chartdiv", {
	  "type": "serial",
	  "theme": "black",
	  "dataProvider":getWeekly(),
	  "gridAboveGraphs": true,
	  "startDuration": 1,
	  "graphs": [ {
	    "balloonText": "[[category]]: <b>[[value]]</b>",
	    "fillAlphas": 0.8,
	    "lineAlpha": 0.2,
	    "type": "column",
	    "valueField": "value"
	  } ],
	  "chartCursor": {
	    "categoryBalloonEnabled": false,
	    "cursorAlpha": 0,
	    "zoomable": false
	  },
	  "categoryField": "week",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "gridAlpha": 0,
	    "tickPosition": "start",
	    "tickLength": 20
	  }

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
