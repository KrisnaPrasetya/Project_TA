import 'package:flutter/material.dart';

class AnimatedContainerButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color containerColor;
  final Color borderColor;
  final double borderWidth;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final bool enableAnimation;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;

  const AnimatedContainerButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.containerColor = Colors.blue,
    this.borderColor = Colors.transparent,
    this.borderWidth = 2,
    this.width = 200,
    this.height = 60,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.enableAnimation = true,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  State<AnimatedContainerButton> createState() => _AnimatedContainerButtonState();
}

class _AnimatedContainerButtonState extends State<AnimatedContainerButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.enableAnimation) {
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.enableAnimation) {
      _controller.reverse();
    }
    widget.onTap!();
  }

  void _handleTapCancel() {
    if (widget.enableAnimation) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: widget.enableAnimation ? _scaleAnimation.value : 1.0,
            child: Container(
              width: widget.width,
              height: widget.height,
              padding: widget.padding,
              decoration: BoxDecoration(
                color: widget.containerColor,
                borderRadius: widget.borderRadius,
                border: Border.all(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                ),
              ),
              alignment: widget.alignment,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}