import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fyp_code/activity.dart';
import 'package:fyp_code/screens/assessment.dart';
import 'package:fyp_code/Dashboard.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ResultScreen extends StatelessWidget {
  final String result;

  const ResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> valueNotifier = ValueNotifier(_calculatePercentage(result) / 100);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SimpleCircularProgressBar(
              valueNotifier: valueNotifier,
              mergeMode: true,
              backColor: Colors.grey, // Optional background color
              // size: 15,
              // key: 150,
              fullProgressColor: _getColor(result),
              onGetText: (double value) {
                return Text(
                  '${(value * 100).toInt()}', // Display percentage as integer
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              },
            ),




            // CircularPercentageIndicator(
            //   radius: 150,
            //   lineWidth: 15,
            //   percent: _calculatePercentage(result),
            //   center: Text(result),
            //   progressColor: _getColor(result),
            // ),
            const SizedBox(height: 20),
            Text(
              _getResultString(result), // Display the result in string format
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),

            if (result == '0')
              Text(
                'You are recommended to consult a psychologist.',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => {
                Get.to(ActivityPage(), transition: Transition.leftToRightWithFade)
              },
              child: const Text('Check Activities'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {

                Get.to(Dashboard(),transition: Transition.leftToRight);
    },
              child: const Text('Go to Dashboard')
            ),
          ],
        ),
      ),
    );

  }
  String _getResultString(String result) {
    switch (result) {
      case '0':
        return 'Severe Depression';
      case '1':
        return 'Moderately Severe Depression';
      case '2':
        return 'Moderate Depression';
      case '3':
        return 'Mild Depression';
      case '4':
        return 'Normal';
      default:
        return 'Unknown Result'; // Handle unexpected values
    }
  }

  double _calculatePercentage(String result) {
    switch (result) {
      case '4':
        return 100;
      case '3':
        return 99;
      case '2':
        return 98;
      case '1':
        return 97;
      default:
        return 100; // Handle unexpected values
    }
  }

  Color _getColor(String result) {
    switch (result) {
      case '4':
        return Colors.green;
      case '3':
        return Colors.blue;
      case '2':
        return Colors.orange;
      case '1':
        return Colors.yellow;
      default:
        return Colors.red;
    }
  }
}










// import 'package:flutter/material.dart';
// import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
//
// import 'package:fyp_code/models/questions.dart';
// import 'package:fyp_code/screens/assessment.dart';
//
// import 'package:fyp_code/widgets/next_button.dart';
//
// // ResultScreen
// class ResultScreen extends StatelessWidget {
//   final String result;
//
//   const ResultScreen({Key? key, required this.result}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Assessment Result'),
//       ),
//       body: Center(
//         child: CircularPercentageIndicator(
//           radius: 150,
//           lineWidth: 15,
//           percent: _calculatePercentage(result), // Map result to percentage
//           center: Text(result),
//           progressColor: _getColor(result), // Map result to color
//         ),
//       ),
//     );
//   }
//
// // ... functions for calculating percentage and color based on result
// }
//
//
//
//
//
//
// //
// // class ResultScreen extends StatelessWidget {
// //   const ResultScreen({
// //     super.key, required result,
// //    // required this.score,
// //   });
// //
// //   //final int score;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //         children: [
// //           const SizedBox(width: 1000),
// //           const Text(
// //             'Your Score: ',
// //             style: TextStyle(
// //               fontSize: 34,
// //               fontWeight: FontWeight.w500,
// //             ),
// //           ),
// //           Stack(
// //             alignment: Alignment.center,
// //             children: [
// //               SizedBox(
// //                 height: 250,
// //                 width: 250,
// //                 child: CircularProgressIndicator(
// //                   strokeWidth: 10,
// //                   value: 5 / 9,
// //                   color: Colors.green,
// //                   backgroundColor: Colors.white,
// //                 ),
// //               ),
// //               Column(
// //                 children: [
// //                   //Text(
// //                     //score.toString(),
// //                    // style: const TextStyle(fontSize: 80),
// //                  // ),
// //                   const SizedBox(height: 10),
// //                   Text(
// //                     '${(5 / questions.length * 100).round()}%',
// //                     style: const TextStyle(fontSize: 25),
// //                   )
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
