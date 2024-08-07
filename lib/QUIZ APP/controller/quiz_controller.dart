import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/QUIZ%20APP/screen/alertdialog_screen.dart';
import '../model/questions_model.dart';

class QuizController extends GetxController {
  var currentQuestionIndex = 0.obs;
  var score = 0.obs;
  var isAnswered = false.obs;
  var selectedAnswerIndex = (-1).obs;

  final List<Question> questions = [
    Question(
      question: "Who is 'Father of AI'?",
      options: ['John McCarthy', 'Alan Turing', 'Marvin Minsky', 'Arthur Samuel'],
      rightAnswerIndex: 0,
    ),
    Question(
      question: "Which planet is known as the Red Planet?",
      options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
      rightAnswerIndex: 1,
    ),
    Question(
      question: "Who was the first person to walk on the moon?",
      options: ['Yuri Gagarin', 'Neil Armstrong', 'Buzz Aldrin', 'Michael Collins'],
      rightAnswerIndex: 1,
    ),
    Question(
      question: "What do you call a fish with no eyes?",
      options: ['Blind as a bat', 'Fish', 'Dory', "Nemo's older brother"],
      rightAnswerIndex: 1,
    ),
    Question(
      question: "Which bird is a symbol of peace?",
      options: ['Eagle', 'Dove', 'Hawk', 'Crow'],
      rightAnswerIndex: 1,
    ),
    Question(
      question: "What is the smallest bone in the human body?",
      options: ['Stapes (in the ear)', 'Patella (kneecap)', 'Tibia (shinbone)', 'Clavicle (collarbone)'],
      rightAnswerIndex: 0,
    ),
    Question(
      question: "What is the smallest country in the world?",
      options: ['Monaco', 'San Marino', 'Vatican City', 'Liechtenstein'],
      rightAnswerIndex: 2,
    ),
    Question(
      question: "What is the hardest natural substance on Earth?",
      options: ['Gold', 'Iron', 'Platinum', 'Diamond'],
      rightAnswerIndex: 3,
    ),
    Question(
      question: "Which bird can fly backwards?",
      options: ['Eagle', 'Sparrow', 'Hummingbird', 'Parrot'],
      rightAnswerIndex: 2,
    ),
    Question(
      question: "What sport is known as the 'king of sports'?",
      options: ['Baseball', 'Basketball', 'Soccer (Football)', 'Tennis'],
      rightAnswerIndex: 2,
    ),
  ];

  void checkAnswer(int index) {
    if (!isAnswered.value) {
      selectedAnswerIndex.value = index;
      isAnswered.value = true;
      if (index == questions[currentQuestionIndex.value].rightAnswerIndex) {
        score.value++;
      }
    }
  }

  void nextQuestion(BuildContext context) {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      isAnswered.value = false;
      selectedAnswerIndex.value = -1;
    } else {
      showScoreDialog(context, score.value, questions.length);
    }
  }
}
