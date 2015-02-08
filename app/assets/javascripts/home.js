$(function () {
  $.getJSON("/thermometers.json", function(thermometers) {
    _.forEach(thermometers, function(thermometer) {
      var thermometerId = thermometer["id"];
      var readingsUrl = '/thermometers/' + thermometerId + '/temperature_readings.json'

      d3.json(readingsUrl, function(data) {
        data = _.forEach(data, function(reading) {
          reading["time"] = moment(reading["time"]).toDate();
        });
        data = MG.convert.number(data, 'fahrenheit');

        MG.data_graphic({
          data: data,
          width: $('.result').width(),
          height: $('.result').height(),
          target: ".room-" + thermometerId,
          x_accessor: "time",
          y_accessor: "fahrenheit",
          interpolate: "monotone",
          small_text: true,
          height: 200,
          width: 400,
          min_y: 55,
          max_y: 80,
          xax_format: function(date) {
            return moment(date).local().format('ha');
          }
        });
      });
    });
  });
});
