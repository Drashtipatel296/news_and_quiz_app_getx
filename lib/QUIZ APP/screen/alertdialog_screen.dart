import 'dart:ui';

import 'package:flutter/material.dart';

void showScoreDialog(BuildContext context, int score, int totalQuestions) {
  final percentage = ((score / totalQuestions) * 100).toStringAsFixed(1);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffCBDCE6).withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.emoji_events,
                  color: Colors.yellow.shade800,
                  size: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Congrats!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '$percentage% Score',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Quiz completed successfully.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'You attempted ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: '$totalQuestions questions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      TextSpan(
                        text: ' and from that ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: '$score answers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      TextSpan(
                        text: ' are correct.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Share with us:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.telegram, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.circle_notifications, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
