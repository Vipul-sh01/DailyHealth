import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/graphcontroller.dart';

class StepLineChart extends StatelessWidget {
  const StepLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    final graphController = Get.find<GraphController>();
    final data = graphController.healthData;

    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                int index = value.toInt();
                return index >= 0 && index < data.length
                    ? Text(data[index].day, style: const TextStyle(fontSize: 12))
                    : const Text('');
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            gradient: const LinearGradient(colors: [Colors.blue, Colors.cyan]),
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [Colors.blue.withOpacity(0.3), Colors.cyan.withOpacity(0.1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            spots: List.generate(
              data.length,
                  (index) => FlSpot(index.toDouble(), data[index].steps.toDouble()),
            ),
          ),
        ],
      ),
    );
  }
}
