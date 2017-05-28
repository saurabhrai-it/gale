$(document).ready(function() {
        var len = document.querySelector("#statisticsTable>tbody:nth-of-type(2)").rows.length;
        for (var i = 1; i <= len; i++) {
            var errorRate = document.querySelector("#statisticsTable>tbody:nth-of-type(2)>tr:nth-of-type(" + i + ")>td:nth-of-type(4)").innerHTML;
            if (parseFloat(errorRate.slice(0, -1)) >= 2.00) {
                document.querySelector("#statisticsTable>tbody:nth-of-type(2)>tr:nth-of-type(" + i + ")>td:nth-of-type(4)").style.color = "red";
            } else {
                document.querySelector("#statisticsTable>tbody:nth-of-type(2)>tr:nth-of-type(" + i + ")>td:nth-of-type(4)").style.color = "blue";
            }

            var avgTime = document.querySelector("#statisticsTable>tbody:nth-of-type(2)>tr:nth-of-type(" + i + ")>td:nth-of-type(5)").innerHTML;
            if (parseFloat(avgTime) >= 3000) {
                document.querySelector("#statisticsTable>tbody:nth-of-type(2)>tr:nth-of-type(" + i + ")>td:nth-of-type(5)").style.color = "red";
            } else {
                document.querySelector("#statisticsTable>tbody:nth-of-type(2)>tr:nth-of-type(" + i + ")>td:nth-of-type(5)").style.color = "blue";
            }

        }

    });