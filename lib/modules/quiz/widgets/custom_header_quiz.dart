import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_ta/modules/quiz/controller/quiz_controller.dart';

class CustomHeaderQuiz extends StatefulWidget {
  final QuizController controller;
  const CustomHeaderQuiz({super.key, required this.controller});

  @override
  State<CustomHeaderQuiz> createState() => _CustomHeaderQuizState();
}

class _CustomHeaderQuizState extends State<CustomHeaderQuiz>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  // Data for circular progress
  final double finalProgress = 0.75; // 75% progress
  final int dummyCurrentScore = 120;
  final int dummyMaxScore = 300;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500), // Animation duration
    );

    // Create progress animation from 0 to final value
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: finalProgress,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation when widget is built
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFC100), Color(0xFFFFBE00)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.065,
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.21,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.32,
            child: Text(
              'Informasi Poin Kamu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.11,
            left: MediaQuery.of(context).size.width * 0.39,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.01), // Responsive spacing between title and progress
                Column(
                  children: [
                    AnimatedBuilder(
                      animation: _progressAnimation,
                      builder: (context, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              height: MediaQuery.of(context).size.width * 0.23,
                              child: CircularProgressIndicator(
                                value: _progressAnimation.value,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  (_progressAnimation.value >= 0.80)
                                      ? Colors.green
                                      : (_progressAnimation.value >= 0.50)
                                          ? Colors.orange
                                          : Colors.red[200]!,
                                ),
                                strokeWidth: 8,
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.012,
                              child: Text(
                                '${(_progressAnimation.value * 100).toInt()}%',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: (_progressAnimation.value >= 0.80)
                                      ? Colors.green
                                      : (_progressAnimation.value >= 0.50)
                                          ? Colors.orange
                                          : Colors.red[200]!,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              height: MediaQuery.of(context).size.width * 0.23,
                              child: Lottie.asset(
                                'assets/lottie/trophy.json',
                                repeat: false,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.24,
            left: MediaQuery.of(context).size.width * 0.26,
            child: Row(
              children: [
                Text(
                  'Total Poin Kamu ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 40, 32, 9),
                  ),
                ),
                AnimatedBuilder(
                  animation: _progressAnimation,
                  builder: (context, child) {
                    // Animate the score text as well
                    final currentScore = (dummyCurrentScore *
                            _progressAnimation.value /
                            finalProgress)
                        .toInt();
                    return Text(
                      '$currentScore ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 40, 32, 9),
                      ),
                    );
                  },
                ),
                Text(
                  'dari $dummyMaxScore',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
