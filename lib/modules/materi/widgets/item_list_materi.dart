import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemListMateri extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isProgress;
  final double progress;

  const ItemListMateri({
    super.key,
    required this.onTap,
    required this.title,
    required this.isProgress,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.44,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: isProgress == true
                    ? AssetImage("assets/images/background_materi1.png")
                    : AssetImage("assets/images/background_materi2.png"),
                fit: BoxFit.cover),
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              isProgress == false
                  ? Positioned(
                      left: 18,
                      top: 12,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Positioned(
                      left: 12,
                      top: 12,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
              isProgress == false
                  ? Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/lock.svg',
                              width: 30,
                              height: 30,
                            ),
                            AnimatedFlipCounter(
                              value: 0,
                              duration: const Duration(milliseconds: 500),
                              suffix: "%",
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color:
                                    progress >= 0.5 ? Colors.grey : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/block_of_cubes.png",
                                width: 40, height: 40),
                            AnimatedFlipCounter(
                              value: progress * 100,
                              duration: const Duration(milliseconds: 500),
                              suffix: "%",
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: progress >= 0.5
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              if (isProgress == false)
                Center(
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: progress),
                      duration: const Duration(milliseconds: 700),
                      builder: (context, value, child) =>
                          CircularProgressIndicator(
                        value: 0,
                        strokeWidth: 5,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          value > 0.5 ? Colors.green : Colors.orange,
                        ),
                      ),
                    ),
                  ),
                )
              else
                Center(
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: progress),
                      duration: const Duration(milliseconds: 700),
                      builder: (context, value, child) =>
                          CircularProgressIndicator(
                        value: value,
                        strokeWidth: 5,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          value > 0.5 ? Colors.green : Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
