import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fyp_code/models/questions.dart';

import 'package:fyp_code/screens/result.dart';
import 'package:fyp_code/Dashboard.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:fyp_code/models/question.dart';
import 'package:http/http.dart' as http; // Import for API communication
import 'package:get/get.dart';



class HealthAssessmentScreen extends StatefulWidget {
  const HealthAssessmentScreen({Key? key}) : super(key: key);

  @override
  State<HealthAssessmentScreen> createState() => _HealthAssessmentScreenState();
}

class _HealthAssessmentScreenState extends State<HealthAssessmentScreen> {
  int _currentQuestionIndex = 0;
  String? _userAge;

  
  List<String> _userAnswers = [];


  @override
  void initState() {
    super.initState();
    // Initialize _userAnswers with null values to match the length of questions
    _userAnswers = List.filled(questions.length, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Health Assessment',

        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.to(Dashboard());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(questions[_currentQuestionIndex].question),

            // Render appropriate UI based on question type
            if (questions[_currentQuestionIndex].type == QuestionType.numeric)
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) => _userAge= value,
              ),
            if (questions[_currentQuestionIndex].type == QuestionType.multipleChoice)
              Column(
                children: questions[_currentQuestionIndex].options.map((option) {
                  return RadioListTile(
                    title: Text(option),
                    value: option,
                    groupValue: _userAnswers[_currentQuestionIndex],
                    onChanged: (value) => setState(() => _userAnswers[_currentQuestionIndex] = value as String),
                  );
                }).toList(),
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _currentQuestionIndex > 0 ? _prevQuestion : null,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _currentQuestionIndex < questions.length - 1 ? _nextQuestion : null,
                  child: const Text('Next'),
                ),
                if (_currentQuestionIndex == questions.length - 1)
                  ElevatedButton(
                    onPressed: _submitAnswers,
                    child: const Text('Submit'),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _nextQuestion() {
    setState(() => _currentQuestionIndex++);
  }

  void _prevQuestion() {
    setState(() => _currentQuestionIndex--);
  }
  Future<void> _submitAnswers() async {
    Map<String, dynamic> data = {
      'answers': _userAnswers,
      'age': _userAge, // Include age in the data
    };
















    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/api/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data), // Send the entire data map
      );


      if (response.statusCode == 200) {
        final result = jsonDecode(response.body)['prediction'];
        // Handle the result and navigate to the ResultScreen with the result
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(result: result),
          ),
        );
      } else {
        // Handle API error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting answers. Please try again.')),
        );
      }
    } catch (error) {
      // Handle network or other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please check your internet connection.')),
      );
    }
  }
}










// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:fyp_code/models/questions.dart';
// import 'package:fyp_code/screens/result.dart';
// import 'package:fyp_code/models/question.dart';
// import 'package:http/http.dart' as http;
//
// class HealthAssessmentScreen extends StatefulWidget {
//   const HealthAssessmentScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HealthAssessmentScreen> createState() => _HealthAssessmentScreenState();
// }
//
// class _HealthAssessmentScreenState extends State<HealthAssessmentScreen> {
//   int _currentQuestionIndex = 0;
//   List<String?> _userAnswers = [];
//   String? _userAge;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize _userAnswers with null values to match the length of questions
//     _userAnswers = List.filled(questions.length, null);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Health Assessment'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text(questions[_currentQuestionIndex].question),
//
//             // Render appropriate UI based on question type
//             if (questions[_currentQuestionIndex].type == QuestionType.numeric)
//               GestureDetector(
//                 onTap: () {
//                   // Trigger a rebuild by tapping anywhere on the screen
//                   setState(() {});
//                 },
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   onChanged: (value) {
//                     // Check if the numeric input is not empty
//                     setState(() {
//                       _userAge = value.isNotEmpty ? value : null;
//
//
//                     });
//                   },
//                 ),
//               ),
//             if (questions[_currentQuestionIndex].type == QuestionType.multipleChoice)
//               Column(
//                 children: questions[_currentQuestionIndex].options.map((option) {
//                   return RadioListTile(
//                     title: Text(option),
//                     value: option,
//                     groupValue: _userAnswers[_currentQuestionIndex],
//                     onChanged: (value) {
//                       // Check if a multiple-choice option is selected
//                       setState(() => _userAnswers[_currentQuestionIndex] = value as String);
//                     },
//                   );
//                 }).toList(),
//               ),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _currentQuestionIndex > 0 ? _prevQuestion : null,
//                   child: const Text('Previous'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _canProceed() ? _nextQuestion : null,
//                   child: const Text('Next'),
//                 ),
//                 if (_currentQuestionIndex == questions.length - 1)
//                   ElevatedButton(
//                     onPressed: _canProceed() ? _submitAnswers : null,
//                     child: const Text('Submit'),
//                   ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   bool _canProceed() {
//     // Check if the current question is answered
//     if (_userAnswers[_currentQuestionIndex] == null) return false;
//
//     // Check for numeric input questions
//     if (questions[_currentQuestionIndex].type == QuestionType.numeric) {
//       // Check if the numeric input is not empty
//       return _userAge != null && _userAge!.isNotEmpty;
//     }
//
//     return true;
//   }
//
//   void _nextQuestion() {
//     setState(() => _currentQuestionIndex++);
//   }
//
//   void _prevQuestion() {
//     setState(() => _currentQuestionIndex--);
//   }
//
//   Future<void> _submitAnswers() async {
//     try {
//       // Create a dictionary to store user data
//       Map<String, dynamic> userData = {
//         'age': _userAge,
//         'answers': _userAnswers,
//       };
//
//       final response = await http.post(
//         Uri.parse('http://127.0.0.1:5000/predict'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(userData),
//       );
//
//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body)['predictions'];
//         // Handle the result and navigate to the ResultScreen with the result
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResultScreen(result: result),
//           ),
//         );
//       } else {
//         // Handle API error
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error submitting answers. Please try again.')),
//         );
//       }
//     } catch (error) {
//       // Handle network or other errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred. Please check your internet connection.')),
//       );
//     }
//   }
// }
//
























//  import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// import 'package:fyp_code/models/questions.dart';
// //
// //
//  import 'package:fyp_code/screens/result.dart';
// //
// // import 'package:fyp_code/widgets/answer_card.dart';
// // import 'package:fyp_code/widgets/next_button.dart';
//
//
// import 'package:fyp_code/models/question.dart';
// import 'package:http/http.dart' as http; // Import for API communication
//  import 'package:get/get.dart';
//
//
//
//  class HealthAssessmentScreen extends StatefulWidget {
//    const HealthAssessmentScreen({Key? key}) : super(key: key);
//
//    @override
//    State<HealthAssessmentScreen> createState() => _HealthAssessmentScreenState();
//  }
//
//  class _HealthAssessmentScreenState extends State<HealthAssessmentScreen> {
//    int _currentQuestionIndex = 0;
//    List<String> _userAnswers = [];
//
//    @override
//    void initState() {
//      super.initState();
//      // Initialize _userAnswers with null values to match the length of questions
//      _userAnswers = List.filled(questions.length, '');
//    }
//
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(
//          title: const Text('Health Assessment'),
//        ),
//        body: SingleChildScrollView(
//          child: Column(
//            children: [
//              Text(questions[_currentQuestionIndex].question),
//
//              // Render appropriate UI based on question type
//              if (questions[_currentQuestionIndex].type == QuestionType.numeric)
//                TextField(
//                  keyboardType: TextInputType.number,
//                  onChanged: (value) => _userAnswers[_currentQuestionIndex] = value,
//                ),
//              if (questions[_currentQuestionIndex].type == QuestionType.multipleChoice)
//                Column(
//                  children: questions[_currentQuestionIndex].options.map((option) {
//                    return RadioListTile(
//                      title: Text(option),
//                      value: option,
//                      groupValue: _userAnswers[_currentQuestionIndex],
//                      onChanged: (value) => setState(() => _userAnswers[_currentQuestionIndex] = value as String),
//                    );
//                  }).toList(),
//                ),
//
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: [
//                  ElevatedButton(
//                    onPressed: _currentQuestionIndex > 0 ? _prevQuestion : null,
//                    child: const Text('Previous'),
//                  ),
//                  ElevatedButton(
//                    onPressed: _currentQuestionIndex < questions.length - 1 ? _nextQuestion : null,
//                    child: const Text('Next'),
//                  ),
//                  if (_currentQuestionIndex == questions.length - 1)
//                    ElevatedButton(
//                      onPressed: _submitAnswers,
//                      child: const Text('Submit'),
//                    ),
//                ],
//              )
//            ],
//          ),
//        ),
//      );
//    }
//
//    void _nextQuestion() {
//      setState(() => _currentQuestionIndex++);
//    }
//
//    void _prevQuestion() {
//      setState(() => _currentQuestionIndex--);
//    }
//
//    Future<void> _submitAnswers() async {
//      try {
//        final response = await http.post(Uri.parse('http://127.0.0.1:5000/predict'
//            ),
//            headers: {'Content-Type': 'application/json'},
//            body: jsonEncode({'answers': _userAnswers}));
//
//        if (response.statusCode == 200) {
//          final result = jsonDecode(response.body)['predictions'];
//          // Handle the result and navigate to the ResultScreen with the result
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (context) => ResultScreen(result: result),
//            ),
//          );
//        } else {
//          // Handle API error
//          ScaffoldMessenger.of(context).showSnackBar(
//            SnackBar(content: Text('Error submitting answers. Please try again.')),
//          );
//        }
//      } catch (error) {
//        // Handle network or other errors
//        ScaffoldMessenger.of(context).showSnackBar(
//          SnackBar(content: Text('An error occurred. Please check your internet connection.')),
//        );
//      }
//    }
//  }
//
//
