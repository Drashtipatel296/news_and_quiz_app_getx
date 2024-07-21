import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizController quizController = Get.put(QuizController());

    return Scaffold(
      backgroundColor: const Color(0xff242A40),
      appBar: AppBar(
        leading: const Icon(Icons.menu,color: Colors.white,),
        backgroundColor: const Color(0xff2D4159),
        title: const Text(
          'Quiz App',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        final question = quizController.questions[quizController.currentQuestionIndex.value];
        return Padding(
          padding: const EdgeInsets.only(top: 100, left: 15, right: 15,bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quiz: ${quizController.questions.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Text(
                    '10:00 min',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(color: Colors.grey),
              const SizedBox(height: 35),
              Text(
                "${quizController.currentQuestionIndex.value + 1}. ${question.question}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
              ...List.generate(question.options.length, (index) {
                final isSelected = quizController.selectedAnswerIndex.value == index;
                final isCorrect = quizController.isAnswered.value &&
                    index == question.rightAnswerIndex;
                final backgroundColor = isCorrect
                    ? Colors.green
                    : isSelected
                    ? Colors.red
                    : const Color(0xffCCDDE7);
                return GestureDetector(
                  onTap: () {
                    if (!quizController.isAnswered.value) {
                      quizController.checkAnswer(index);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                                color: Color(0xffE78230), shape: BoxShape.circle),
                            alignment: Alignment.center,
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            question.options[index],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (quizController.isAnswered.value) {
                    quizController.nextQuestion(context);
                  }
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffE78230),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'NEXT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
