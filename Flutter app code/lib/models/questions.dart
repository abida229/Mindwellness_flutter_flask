
import 'package:fyp_code/models/question.dart';
import 'question.dart';


const List<Question> questions = [
  Question(
    question: '1. Little interest or pleasure in doing things',
    options: [
      '0) Not at all',
      '1) Several days',
      '2) More than half the days',
      '3) Nearly every day',
    ],
    type: QuestionType.multipleChoice, // Added default type
  ),
  Question(
    question: '2.	Feeling down, depressed or hopeless',

    options: [
      '0) Not at all',
      '1) Several days',
      '2) More than half the days',
      '3) Nearly every day',
    ],
    type: QuestionType.multipleChoice, // Added default type
  ),
  Question(
    question: '3. Trouble falling or staying asleep or sleeping too much',

    options: [
      '0) Not at all',
      '1) Several days',
      '2) More than half the days',
      '3) Nearly every day',
    ],
    type: QuestionType.multipleChoice, // Added default type
  ),
  Question(
    question: '4.	Feeling tired or having little energy',

    options: [
      '0) Not at all',
      '1) Several days',
      '2) More than half the days',
      '3) Nearly every day',
    ],
    type: QuestionType.multipleChoice, // Added default type
  ),
  Question(
    question: '5.	Poor appetite or overeating',

    options: [
      '0) Not at all',
      '1) Several days',
      '2) More than half the days',
      '3) Nearly every day',
    ],
    type: QuestionType.multipleChoice, // Added default type
  ),
  Question(
    question: '6.	Feeling bad about yourself __ or that you are a failure or have let yourself or your family down ',

    options: [
      '0) Not at all',
      '1) Several days',
      '2) More than half the days',
      '3) Nearly every day',
    ],
    type: QuestionType.multipleChoice, // Added default type
  ),
  Question(
    question: '7.	Trouble concentrating on things such as reading the newspaper or watching television',

    options: [
      '0) Not at all',
      '1) Several days',
      '2) More than half the days',
      '3) Nearly every day',
    ],
    type: QuestionType.multipleChoice, // Added default type
  ),
  Question(
    question: '8.	Moving or speaking so slowly that other people could have noticed. Or the opposite being __ so figety or restless that you have been moving around a lot more than usual',

    options: [
      '0) Not at all',
      '1) Several days',
      '2) More than half the days',
      '3) Nearly evert day',
    ],
    type: QuestionType.multipleChoice, // Added default type
  ),
  Question(
    question:
    '9.	Thoughts that you would be better off dead or of hurting yourself.',

    options: [
      '0) Not at all',
      '1) Several days',
      '2) More than half the days',
      '3) Nearly every day',
    ],
    type: QuestionType.multipleChoice, // Added default type
  ),


  Question(
    question: '10. Your gender:',
    options: ['Male', 'Female'],
   type: QuestionType.multipleChoice, // Added default type
  ),
  Question(
    question: '11. Time period of taking assessment:',
    options: ['Morning', 'Evening', 'Mid Day'],
    type: QuestionType.multipleChoice, // Added default type
  ),
  Question(
    question: '12. Your age:',
    type: QuestionType.numeric, // Added for type identification
  ),
];