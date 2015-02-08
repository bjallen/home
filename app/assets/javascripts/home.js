$(function () {
    d3.json('/thermometers/1/temperature_readings.json', function(data) {
        data = MG.convert.date(data, 'time', '%Y-%m-%dT%H:%M:%SZ');
        data = MG.convert.number(data, 'fahrenheit');

        MG.data_graphic({
          data: data,
          width: $('.result').width(),
          height: $('.result').height(),
          target: ".room-1",
          x_accessor: "time",
          y_accessor: "fahrenheit",
          interpolate: "monotone"
        });
    });

    d3.json('/thermometers/2/temperature_readings.json', function(data) {
        data = MG.convert.date(data, 'time', '%Y-%m-%dT%H:%M:%SZ');
        data = MG.convert.number(data, 'fahrenheit');

        MG.data_graphic({
          data: data,
          width: $('.result').width(),
          height: $('.result').height(),
          target: ".room-2",
          x_accessor: "time",
          y_accessor: "fahrenheit",
          interpolate: "monotone"
        });
    });
});