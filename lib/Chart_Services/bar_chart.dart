import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../App-Colors/app_colors.dart';
import '../ModelView_Controller/model_view_controller.dart';
import '../Models/model_class.dart';
class ChartScreen extends StatelessWidget {
  final BarChartController controller = Get.put(BarChartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const  Center(child: CircularProgressIndicator());
        }
        if (controller.barChartData.value.days.isEmpty) {
          return const Center(child: Text('No data available'));
        }
        return BarChart(
          BarChartData(
            barTouchData: barTouchData,
            titlesData: titlesData,
            borderData: borderData,
            barGroups: getBarGroups(controller.barChartData.value.days),
            gridData: const FlGridData(show: false),
            alignment: BarChartAlignment.spaceBetween,
            maxY: 5,
            groupsSpace: 2,
          ),
        );
      }),
    );
  }

  List<BarChartGroupData> getBarGroups(List<DayData> days) {
    return List.generate(days.length, (index) {
      final dayData = days[index];
      return BarChartGroupData(
        x: index,
        barRods: createBarRods(dayData.values.map((e) => (e is int) ? e.toDouble() : e as double).toList()),
        barsSpace: 3,
      );
    });
  }
  List<BarChartRodData> createBarRods(List<double> values) {
    List<Color> barColors = [
      Colors.lightBlue,
      Colors.blue,
      Colors.amber,
      Colors.purple,
    ];

    return List.generate(values.length, (index) {
      return BarChartRodData(
        toY: values[index],
        color: barColors[index % barColors.length],
        width: 5,
        borderRadius: BorderRadius.circular(2),
      );
    });
  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      getTooltipColor: (group) => Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 8,
      getTooltipItem: (BarChartGroupData group, int groupIndex,
          BarChartRodData rod, int rodIndex) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          const TextStyle(
            color: AppColors.contentColorCyan,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 30,
        getTitlesWidget: (value, meta) {
          final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
          return SideTitleWidget(
            axisSide: meta.axisSide,
            space: 4,
            child: Text(
              days[value.toInt() % days.length],
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          );
        },
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: 1,
        getTitlesWidget: (value, meta) {
          final style = const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          );
          return Text('${value.toInt()}kg', style: style);
        },
      ),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );
}
