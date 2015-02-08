$(function () {
  $.getJSON("/thermometers.json", function(thermometers) {
    _(thermometers).forEach(function(thermometer) {
      var thermometerId = thermometer["id"];
      var readingsUrl = '/thermometers/' + thermometerId + '/temperature_readings.json'

      d3.json(readingsUrl, function(data) {
        data = MG.convert.date(data, 'time', '%Y-%m-%dT%H:%M:%SZ');
        data = MG.convert.number(data, 'fahrenheit');

        MG.data_graphic({
          data: data,
          width: $('.result').width(),
          height: $('.result').height(),
          target: ".room-" + thermometerId,
          x_accessor: "time",
          y_accessor: "fahrenheit",
          interpolate: "monotone",
          height: 200,
          width: 400,
          min_y: 40,
          max_y: 100
        });
      });
    });
  });
});
