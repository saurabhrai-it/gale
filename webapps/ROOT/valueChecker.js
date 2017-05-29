$(document).ready(function() {
	   for(var j = 1;j <=2;j++){
        var len = document.querySelector("#statisticsTable>tbody:nth-of-type(" + j + ")").rows.length;
        for (var i = 1; i <= len; i++) {
            var errorRate = document.querySelector("#statisticsTable>tbody:nth-of-type(" + j + ")>tr:nth-of-type(" + i + ")>td:nth-of-type(4)").innerHTML;
            if (parseFloat(errorRate.slice(0, -1)) >= 2.00) {
                document.querySelector("#statisticsTable>tbody:nth-of-type(" + j + ")>tr:nth-of-type(" + i + ")>td:nth-of-type(4)").style.color = "red";
            } else {
                document.querySelector("#statisticsTable>tbody:nth-of-type(" + j + ")>tr:nth-of-type(" + i + ")>td:nth-of-type(4)").style.color = "blue";
            }

            var avgTime = document.querySelector("#statisticsTable>tbody:nth-of-type(" + j + ")>tr:nth-of-type(" + i + ")>td:nth-of-type(5)").innerHTML;
            if (parseFloat(avgTime) >= 3000) {
                document.querySelector("#statisticsTable>tbody:nth-of-type(" + j + ")>tr:nth-of-type(" + i + ")>td:nth-of-type(5)").style.color = "red";
            } else {
                document.querySelector("#statisticsTable>tbody:nth-of-type(" + j + ")>tr:nth-of-type(" + i + ")>td:nth-of-type(5)").style.color = "blue";
            }
			
			document.querySelector("#statisticsTable>tbody:nth-of-type(" + j + ")>tr:nth-of-type(" + i + ")>td:nth-of-type(13)").style.display="none";
         }
		}
		
		document.querySelector("#generalInfos>tbody>tr:nth-of-type(4)").style.display="none";
		
		var getElementByXPath = function(a){b=document;return b.evaluate(a,b,null,9,null).singleNodeValue};
		getElementByXPath('.//*[@data-column="12"]').style.display="none";
		
		var widthCol = document.querySelector(".tablesorter-colgroup>col:nth-of-type(13)");
		widthCol.style.width = "0%";
		
		var URL = document.URL;
		
		var testNumber = URL.split('_');
		document.querySelector("#generalInfos>tbody>tr:nth-of-type(1)>td:nth-of-type(1)").innerHTML = "Load Test Number:";
		document.querySelector("#generalInfos>tbody>tr:nth-of-type(1)>td:nth-of-type(2)").innerHTML = testNumber[1];
		
		var isError = getElementByXPath(".//*[@id='top5ErrorsBySamplerTable']/tbody[1]/tr/td[3]").innerHTML;
		console.log(isError);
		var errorDisplay = document.querySelector(".col-lg-12>div:nth-of-type(2)>div");
		var errorDisplay5 = document.querySelector(".col-lg-12>div:nth-of-type(3)>div");
		
		if(parseInt(isError)==0)
		{
			errorDisplay.style.display = "none";
			errorDisplay5.style.display = "none";
		}
    });