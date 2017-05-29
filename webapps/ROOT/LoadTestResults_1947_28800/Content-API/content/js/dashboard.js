/*
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
var showControllersOnly = false;
var seriesFilter = "";
var filtersOnlySampleSeries = true;

/*
 * Add header in statistics table to group metrics by category
 * format
 *
 */
function summaryTableHeader(header) {
    var newRow = header.insertRow(-1);
    newRow.className = "tablesorter-no-sort";
    var cell = document.createElement('th');
    cell.setAttribute("data-sorter", false);
    cell.colSpan = 1;
    cell.innerHTML = "Requests";
    newRow.appendChild(cell);

    cell = document.createElement('th');
    cell.setAttribute("data-sorter", false);
    cell.colSpan = 3;
    cell.innerHTML = "Executions";
    newRow.appendChild(cell);

    cell = document.createElement('th');
    cell.setAttribute("data-sorter", false);
    cell.colSpan = 7;
    cell.innerHTML = "Response Times (ms)";
    newRow.appendChild(cell);

    cell = document.createElement('th');
    cell.setAttribute("data-sorter", false);
    cell.colSpan = 2;
    cell.innerHTML = "Network (KB/sec)";
    newRow.appendChild(cell);
}

/*
 * Populates the table identified by id parameter with the specified data and
 * format
 *
 */
function createTable(table, info, formatter, defaultSorts, seriesIndex, headerCreator) {
    var tableRef = table[0];

    // Create header and populate it with data.titles array
    var header = tableRef.createTHead();

    // Call callback is available
    if(headerCreator) {
        headerCreator(header);
    }

    var newRow = header.insertRow(-1);
    for (var index = 0; index < info.titles.length; index++) {
        var cell = document.createElement('th');
        cell.innerHTML = info.titles[index];
        newRow.appendChild(cell);
    }

    var tBody;

    // Create overall body if defined
    if(info.overall){
        tBody = document.createElement('tbody');
        tBody.className = "tablesorter-no-sort";
        tableRef.appendChild(tBody);
        var newRow = tBody.insertRow(-1);
        var data = info.overall.data;
        for(var index=0;index < data.length; index++){
            var cell = newRow.insertCell(-1);
            cell.innerHTML = formatter ? formatter(index, data[index]): data[index];
        }
    }

    // Create regular body
    tBody = document.createElement('tbody');
    tableRef.appendChild(tBody);

    var regexp;
    if(seriesFilter) {
        regexp = new RegExp(seriesFilter, 'i');
    }
    // Populate body with data.items array
    for(var index=0; index < info.items.length; index++){
        var item = info.items[index];
        if((!regexp || filtersOnlySampleSeries && !info.supportsControllersDiscrimination || regexp.test(item.data[seriesIndex]))
                &&
                (!showControllersOnly || !info.supportsControllersDiscrimination || item.isController)){
            if(item.data.length > 0) {
                var newRow = tBody.insertRow(-1);
                for(var col=0; col < item.data.length; col++){
                    var cell = newRow.insertCell(-1);
                    cell.innerHTML = formatter ? formatter(col, item.data[col]) : item.data[col];
                }
            }
        }
    }

    // Add support of columns sort
    table.tablesorter({sortList : defaultSorts});
}

$(document).ready(function() {

    // Customize table sorter default options
    $.extend( $.tablesorter.defaults, {
        theme: 'blue',
        cssInfoBlock: "tablesorter-no-sort",
        widthFixed: true,
        widgets: ['zebra']
    });

    var data = {"OkPercent": 92.92149292149293, "KoPercent": 7.078507078507078};
    var dataset = [
        {
            "label" : "KO",
            "data" : data.KoPercent,
            "color" : "#FF6347"
        },
        {
            "label" : "OK",
            "data" : data.OkPercent,
            "color" : "#9ACD32"
        }];
    $.plot($("#flot-requests-summary"), dataset, {
        series : {
            pie : {
                show : true,
                radius : 1,
                label : {
                    show : true,
                    radius : 3 / 4,
                    formatter : function(label, series) {
                        return '<div style="font-size:8pt;text-align:center;padding:2px;color:white;">'
                            + label
                            + '<br/>'
                            + Math.round10(series.percent, -2)
                            + '%</div>';
                    },
                    background : {
                        opacity : 0.5,
                        color : '#000'
                    }
                }
            }
        },
        legend : {
            show : true
        }
    });

    // Creates APDEX table
    createTable($("#apdexTable"), {"supportsControllersDiscrimination": true, "overall": {"data": [0.28209109730848864, 500, 1500, "Total"], "isController": false}, "titles": ["Apdex", "T (Toleration threshold)  ", "F (Frustration threshold)", "Label"], "items": [{"data": [0.5, 500, 1500, "BIG Build Production"], "isController": false}, {"data": [0.0, 500, 1500, "NATGEO Build Production"], "isController": false}, {"data": [1.0, 500, 1500, "BIE Build Staging"], "isController": false}, {"data": [0.5, 500, 1500, "Ocean Build Production"], "isController": false}, {"data": [0.5, 500, 1500, "Ocean Build Staging"], "isController": false}, {"data": [0.0, 500, 1500, "NCCO Build Staging"], "isController": false}, {"data": [0.5, 500, 1500, "Rendering Services Build Production"], "isController": false}, {"data": [0.5, 500, 1500, "Auth Build Staging"], "isController": false}, {"data": [0.0, 500, 1500, "RunTimeBatch ID"], "isController": false}, {"data": [0.0, 500, 1500, "Omni Build"], "isController": true}, {"data": [0.0, 500, 1500, "Transaction Controller4"], "isController": true}, {"data": [0.0, 500, 1500, "Transaction Controller2"], "isController": true}, {"data": [0.0, 500, 1500, "Transaction Controller3"], "isController": true}, {"data": [0.0, 500, 1500, "Transaction Controller1"], "isController": true}, {"data": [0.12162162162162163, 500, 1500, "Ocean RT Main Batch ID"], "isController": false}, {"data": [1.0, 500, 1500, "BIE Build Production"], "isController": false}, {"data": [0.0, 500, 1500, "GDC Build Staging"], "isController": false}, {"data": [0.9864864864864865, 500, 1500, "Auth Build Production"], "isController": false}, {"data": [0.5, 500, 1500, "BIG Build Staging"], "isController": false}, {"data": [0.0, 500, 1500, "NCCO Build Production"], "isController": false}, {"data": [0.5, 500, 1500, "Rendering Services Build Staging"], "isController": false}, {"data": [0.0, 500, 1500, "NATGEO Build Staging"], "isController": false}, {"data": [0.25675675675675674, 500, 1500, "Ocean Incremental Batch ID"], "isController": false}, {"data": [0.5, 500, 1500, "Auth Build Production_galeauth-as01"], "isController": false}, {"data": [0.0, 500, 1500, "SMIT Build Production"], "isController": false}, {"data": [0.0, 500, 1500, "GDC Build Production"], "isController": false}]}, function(index, item){
        switch(index){
            case 0:
                item = item.toFixed(3);
                break;
            case 1:
            case 2:
                item = formatDuration(item);
                break;
        }
        return item;
    }, [[0, 0]], 3);

    // Create statistics table
    createTable($("#statisticsTable"), {"supportsControllersDiscrimination": true, "overall": {"data": ["Total", 777, 55, 7.078507078507078, 1480.5199485199462, 0, 11480, 3534.2, 3949.3999999999996, 4584.960000000005, 0.43959202239486567, 4.871760377935988, 0.0], "isController": false}, "titles": ["Label", "#Samples", "KO", "Error %", "Average", "Min", "Max", "90th pct", "95th pct", "99th pct", "Throughput", "Received", "Sent"], "items": [{"data": ["BIG Build Production", 37, 0, 0.0, 560.7027027027026, 528, 1194, 548.4, 816.0000000000006, 1194.0, 0.021345800819447987, 0.054198885785254315, 0.0], "isController": false}, {"data": ["NATGEO Build Production", 37, 0, 0.0, 2368.5135135135133, 2098, 2649, 2640.2, 2647.2, 2649.0, 0.0213226865893556, 0.10099124019372525, 0.0], "isController": false}, {"data": ["BIE Build Staging", 37, 0, 0.0, 292.6756756756756, 285, 325, 305.4, 311.5, 325.0, 0.021348769070364964, 0.054390677281043846, 0.0], "isController": false}, {"data": ["Ocean Build Production", 37, 0, 0.0, 816.4324324324323, 720, 988, 981.2, 987.1, 988.0, 0.021340740685199273, 0.04980782879304269, 0.0], "isController": false}, {"data": ["Ocean Build Staging", 37, 0, 0.0, 814.5945945945947, 724, 994, 982.4, 986.8, 994.0, 0.021343633655564517, 0.04983598751512802, 0.0], "isController": false}, {"data": ["NCCO Build Staging", 37, 0, 0.0, 2977.4054054054045, 2647, 4043, 3301.4, 3802.7000000000003, 4043.0, 0.021319541318711586, 0.10243373367974706, 0.0], "isController": false}, {"data": ["Rendering Services Build Production", 37, 0, 0.0, 874.9189189189191, 769, 1060, 1026.2, 1038.4, 1060.0, 0.021344323159975125, 0.005148484199720562, 0.0], "isController": false}, {"data": ["Auth Build Staging", 37, 0, 0.0, 869.7837837837839, 748, 1217, 1040.2, 1065.8000000000002, 1217.0, 0.021344347785956574, 0.04124369314183031, 0.0], "isController": false}, {"data": ["RunTimeBatch ID", 37, 0, 0.0, 1853.3513513513515, 1723, 2246, 2021.2, 2078.6000000000004, 2246.0, 0.021421024446020464, 2.455276374636349, 0.0], "isController": false}, {"data": ["Omni Build", 38, 0, 0.0, 6195.289473684212, 5572, 10918, 6500.6, 7806.749999999991, 10918.0, 0.021193246716162194, 0.24440859059889886, 0.0], "isController": true}, {"data": ["Transaction Controller4", 37, 0, 0.0, 4678.8378378378375, 4199, 5699, 5121.6, 5512.700000000001, 5699.0, 0.021287661901298893, 0.1992807880721203, 0.0], "isController": true}, {"data": ["Transaction Controller2", 38, 0, 0.0, 1918.1315789473683, 1570, 2757, 2341.5000000000005, 2578.3999999999996, 2757.0, 0.02125266567151992, 1.0177815950237443, 0.0], "isController": true}, {"data": ["Transaction Controller3", 38, 0, 0.0, 4308.3421052631575, 3497, 5177, 4884.2, 5133.3, 5177.0, 0.02122792365768297, 0.2018043866037836, 0.0], "isController": true}, {"data": ["Transaction Controller1", 38, 38, 100.0, 0.0, 0, 0, 0.0, 0.0, 0.0, 0.021274666015736535, 0.05189855049541979, 0.0], "isController": true}, {"data": ["Ocean RT Main Batch ID", 37, 0, 0.0, 2888.324324324324, 1487, 11480, 4551.200000000003, 5967.500000000009, 11480.0, 0.021303865672793354, 1.3849013989082632, 0.0], "isController": false}, {"data": ["BIE Build Production", 37, 0, 0.0, 290.35135135135135, 286, 301, 295.4, 297.4, 301.0, 0.02134901543533816, 0.05432256075958643, 0.0], "isController": false}, {"data": ["GDC Build Staging", 37, 0, 0.0, 4185.1081081081065, 3774, 4890, 4724.0, 4884.6, 4890.0, 0.02129740327093578, 0.1058630689932257, 0.0], "isController": false}, {"data": ["Auth Build Production", 37, 0, 0.0, 494.10810810810807, 482, 742, 496.4, 522.4000000000003, 742.0, 0.02135130690195422, 0.01770240191382728, 0.0], "isController": false}, {"data": ["BIG Build Staging", 37, 0, 0.0, 564.3513513513511, 528, 770, 717.0, 745.7, 770.0, 0.02134582544883925, 0.054254160813391336, 0.0], "isController": false}, {"data": ["NCCO Build Production", 37, 0, 0.0, 2417.567567567568, 2156, 2731, 2674.2000000000003, 2705.8, 2731.0, 0.021322563709803365, 0.09988704894133471, 0.0], "isController": false}, {"data": ["Rendering Services Build Staging", 37, 0, 0.0, 871.4864864864865, 772, 1047, 1035.4, 1044.3, 1047.0, 0.021344150779696057, 0.005148442619711842, 0.0], "isController": false}, {"data": ["NATGEO Build Staging", 37, 0, 0.0, 2928.621621621621, 2553, 3699, 3370.4, 3602.7000000000003, 3699.0, 0.021315537356055313, 0.10326795002284218, 0.0], "isController": false}, {"data": ["Ocean Incremental Batch ID", 37, 18, 48.648648648648646, 494.6216216216216, 0, 1237, 1075.0, 1114.6000000000001, 1237.0, 0.02143298629273636, 0.05788795714532318, 0.0], "isController": false}, {"data": ["Auth Build Production_galeauth-as01", 37, 0, 0.0, 862.7027027027028, 756, 1040, 1023.2, 1026.5, 1040.0, 0.02134495114025306, 0.041183451706471155, 0.0], "isController": false}, {"data": ["SMIT Build Production", 37, 37, 100.0, 14.0, 0, 246, 1.2000000000000028, 242.4, 246.0, 0.02135537361803317, 0.03194964099885431, 0.0], "isController": false}, {"data": ["GDC Build Production", 37, 0, 0.0, 3651.2972972972975, 3401, 3971, 3898.6000000000004, 3954.8, 3971.0, 0.021310540654176, 0.10338941989252576, 0.0], "isController": false}]}, function(index, item){
        switch(index){
            // Errors pct
            case 3:
                item = item.toFixed(2) + '%';
                break;
            // Mean
            case 4:
            // Mean
            case 7:
            // Percentile 1
            case 8:
            // Percentile 2
            case 9:
            // Percentile 3
            case 10:
            // Throughput
            case 11:
            // Kbytes/s
            case 12:
            // Sent Kbytes/s
                item = item.toFixed(2);
                break;
        }
        return item;
    }, [[0, 0]], 0, summaryTableHeader);

    // Create error table
    createTable($("#errorsTable"), {"supportsControllersDiscrimination": false, "titles": ["Type of error", "Number of errors", "% in errors", "% in all samples"], "items": [{"data": ["Non HTTP response code: java.net.UnknownHostException/Non HTTP response message: smit-as02.prod.gale.web", 37, 67.27272727272727, 4.761904761904762], "isController": false}, {"data": ["Non HTTP response code: org.apache.http.NoHttpResponseException/Non HTTP response message: The target server failed to respond", 18, 32.72727272727273, 2.3166023166023164], "isController": false}]}, function(index, item){
        switch(index){
            case 2:
            case 3:
                item = item.toFixed(2) + '%';
                break;
        }
        return item;
    }, [[1, 1]]);

        // Create top5 errors by sampler
    createTable($("#top5ErrorsBySamplerTable"), {"supportsControllersDiscrimination": false, "overall": {"data": ["Total", 777, 55, "Non HTTP response code: java.net.UnknownHostException/Non HTTP response message: smit-as02.prod.gale.web", 37, "Non HTTP response code: org.apache.http.NoHttpResponseException/Non HTTP response message: The target server failed to respond", 18, null, null, null, null, null, null], "isController": false}, "titles": ["Sample", "#Samples", "#Errors", "Error", "#Errors", "Error", "#Errors", "Error", "#Errors", "Error", "#Errors", "Error", "#Errors"], "items": [{"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": [], "isController": false}, {"data": ["Ocean Incremental Batch ID", 37, 18, "Non HTTP response code: org.apache.http.NoHttpResponseException/Non HTTP response message: The target server failed to respond", 18, null, null, null, null, null, null, null, null], "isController": false}, {"data": [], "isController": false}, {"data": ["SMIT Build Production", 37, 37, "Non HTTP response code: java.net.UnknownHostException/Non HTTP response message: smit-as02.prod.gale.web", 37, null, null, null, null, null, null, null, null], "isController": false}, {"data": [], "isController": false}]}, function(index, item){
        return item;
    }, [[0, 0]], 0);

});
