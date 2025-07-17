import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/graphcontroller.dart';

class HeartBarChart extends StatelessWidget {
  const HeartBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final graphController = Get.find<GraphController>();
    final data = graphController.healthData;

    return BarChart(
      BarChartData(
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: false),
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
        barGroups: List.generate(
          data.length,
              (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: data[index].heartRate.toDouble(),
                width: 14,
                borderRadius: BorderRadius.circular(6),
                gradient: const LinearGradient(
                  colors: [Colors.redAccent, Colors.pink],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
