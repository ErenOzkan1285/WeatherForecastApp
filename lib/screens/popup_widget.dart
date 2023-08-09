import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/WeatherModel.dart';

class ShowDetailsDialog extends StatelessWidget {
  const ShowDetailsDialog(
      {super.key, required this.weather, required this.currentDays});

  final WeatherModel weather;
  final List<String> currentDays;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Details'),
      content: SizedBox(
        width: 300,
        height: 500,
        child: SfCartesianChart(
          title: ChartTitle(text: 'Average Temperature'),
          legend: const Legend(isVisible: true),
          series: <CartesianSeries>[
            LineSeries<DataPoint, String>(
              dataSource: <DataPoint>[
                DataPoint(currentDays[0],
                    (weather.list??[])[3].main.feels_like!.roundToDouble()),
                DataPoint(currentDays[1],
                   (weather.list??[])[11].main.feels_like!.roundToDouble()),
                DataPoint(currentDays[2],
                   (weather.list??[])[19].main.feels_like!.roundToDouble()),
                DataPoint(currentDays[3],
                    (weather.list??[])[27].main.feels_like!.roundToDouble()),
                DataPoint(currentDays[4],
                    (weather.list??[])[35].main.feels_like!.roundToDouble()),
              ],
              xValueMapper: (DataPoint point, _) => point.x,
              yValueMapper: (DataPoint point, _) => point.y,
              name: 'Daily Average Temperature',
              color: Colors.red,
            )
          ],
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Pop-up'ı kapat
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class DataPoint {
  final String x;
  final double y;

  DataPoint(this.x, this.y);
}
