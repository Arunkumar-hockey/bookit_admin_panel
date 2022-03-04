import 'package:admin_panel/constants/style.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


class UserBarChart extends StatelessWidget {
  final List<charts.Series<dynamic,String>> seriesList;
  final bool animate;

  UserBarChart(this.seriesList, { this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory UserBarChart.withSampleData() {
    return  UserBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('Today', 2),
      OrdinalSales('Yesterday', 4),
      OrdinalSales('2 days', 10),
      OrdinalSales('24 Jun', 50),
      OrdinalSales('23 July', 185),
      OrdinalSales('22 Oct', 1050),
      OrdinalSales('21 Dec', 1300),

    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(blue),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.count,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int count;

  OrdinalSales(this.year, this.count);
}
