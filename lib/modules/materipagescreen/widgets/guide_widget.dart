import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VideoGuideOverlay extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final bool initiallyVisible;
  final Duration autoDismissAfter;

  const VideoGuideOverlay({
    Key? key,
    required this.child,
    required this.onTap,
    this.initiallyVisible = true,
    this.autoDismissAfter = const Duration(seconds: 5),
  }) : super(key: key);

  @override
  State<VideoGuideOverlay> createState() => _VideoGuideOverlayState();
}

class _VideoGuideOverlayState extends State<VideoGuideOverlay> with SingleTickerProviderStateMixin {
  bool _showOverlay = true;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _showOverlay = widget.initiallyVisible;
    
    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    
    // Auto-dismiss after specified duration if needed
    if (widget.initiallyVisible && widget.autoDismissAfter != Duration.zero) {
      Future.delayed(widget.autoDismissAfter, () {
        if (mounted && _showOverlay) {
          _hideOverlay();
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _hideOverlay() {
    _animationController.forward().then((_) {
      if (mounted) {
        setState(() {
          _showOverlay = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The child widget (video player)
        widget.child,
        
        // Guide overlay
        if (_showOverlay)
          Positioned.fill(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: GestureDetector(
                onTap: () {
                  _hideOverlay();
                  widget.onTap();
                },
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Lottie animation
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Lottie.asset(
                            'assets/lottie/click.json',
                            repeat: true,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Instruction text
                        Text(
                          'Tap untuk memutar video',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}