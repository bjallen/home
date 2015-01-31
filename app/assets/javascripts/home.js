$(function () {
    $.getJSON('/thermometers/1/temperature_readings.json', function (json) {
        $('#container').highcharts({
            title: {
                text: 'Hourly Average Temperature',
                x: -20 //center
            },
            xAxis: {
                categories: _.map(json, function(reading) { return reading["time"] })
            },
            yAxis: {
                title: {
                    text: 'Temperature (°F)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '°F'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                name: 'James’ Room',
                data: _.map(json, function(reading) { return parseFloat(reading["fahrenheit"]) })
            }]
        });
    });
});