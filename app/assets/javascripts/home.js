$(function () {
    d3.json('/thermometers/1/temperature_readings.json', function(data1) {
        data1 = MG.convert.date(data1, 'time', '%Y-%m-%dT%H:%M:%SZ');
        data1 = MG.convert.number(data1, 'fahrenheit');

        MG.data_graphic({
          data: data1,
          width: $('.result').width(),
          height: $('.result').height(),
          target: ".room-1",
          x_accessor: "time",
          y_accessor: "fahrenheit",
          interpolate: "monotone"
        });
    });

    d3.json('/thermometers/2/temperature_readings.json', function(data2) {
        data2 = MG.convert.date(data2, 'time', '%Y-%m-%dT%H:%M:%SZ');
        data2 = MG.convert.number(data2, 'fahrenheit');

        MG.data_graphic({
          data: data2,
          width: $('.result').width(),
          height: $('.result').height(),
          target: ".room-2",
          x_accessor: "time",
          y_accessor: "fahrenheit",
          interpolate: "monotone"
        });
    });
});