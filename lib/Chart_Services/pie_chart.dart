// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// class DonutChart extends StatelessWidget {
//   const DonutChart({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Pie chart
//             PieChart(
//               PieChartData(
//                 startDegreeOffset: 180,
//                 sectionsSpace: 2,
//                 centerSpaceRadius: 110,
//                 sections: [
//                   PieChartSectionData(
//                     value: 68,
//                     color: Colors.black54,
//                     radius: 55,
//                     title: '',
//                     titleStyle: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   PieChartSectionData(
//                     value: 42, // Value for this section
//                     color: Colors.cyan,
//                     radius: 55,
//                     title: '',
//                     titleStyle: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   PieChartSectionData(
//                     value: 100,
//                     color: Colors.transparent,
//                     radius: 100,
//                     title: '',
//                   ),
//                 ],
//               ),
//             ),
//             const  Positioned(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'UCO',
//                     style: TextStyle(
//                       fontSize: 19,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Collections',
//                     style: TextStyle(
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold
//                     ),
//                   ),
//                   Text(
//                     'current months',
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 240, // Position this message box slightly over the chart
//               left: 50,
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Text(
//                   '250 kg',
//                   style: TextStyle(
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 250, // Position this message box slightly over the chart
//               right: 50,
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Text(
//                   '50 kg',
//                   style: TextStyle(
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// DonutChart Component
class DonutChart extends StatelessWidget {
  final double firstValue;
  final double secondValue;
  final String centerTitle;
  final String centerSubtitle;
  final String leftMessage;
  final String rightMessage;

  const DonutChart({
    Key? key,
    required this.firstValue,
    required this.secondValue,
    required this.centerTitle,
    required this.centerSubtitle,
    required this.leftMessage,
    required this.rightMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Pie chart
        PieChart(
          PieChartData(
            startDegreeOffset: 180,
            sectionsSpace: 2,
            centerSpaceRadius: 110,
            sections: [
              PieChartSectionData(
                value: firstValue,
                color: Colors.black54,
                radius: 55,
                title: '',
              ),
              PieChartSectionData(
                value: secondValue,
                color: Colors.cyan,
                radius: 55,
                title: '',
              ),
              PieChartSectionData(
                value: 100,
                color: Colors.transparent,
                radius: 100,
                title: '',
              ),
            ],
          ),
        ),

        // Text in the center of the donut chart
        Positioned(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                centerTitle,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                centerSubtitle,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'current months',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        // Left Message Box
        Positioned(
          top: 20,
          left: 50,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              leftMessage,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),

        // Right Message Box
        Positioned(
          top: 20,
          right: 50,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              rightMessage,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
