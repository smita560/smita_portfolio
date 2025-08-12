import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:js'as js;

class HoverIcon extends StatefulWidget {
  final String assetPath;
  final String url;
  final Color color;
  final double size;

  const HoverIcon({
    super.key,
    required this.assetPath,
    required this.url,
    required this.color,
    this.size = 24,
  });

  @override
  State<HoverIcon> createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? Matrix4.translationValues(0, -5, 0) // move up on hover
            : Matrix4.identity(),
        child: InkWell(
          onTap: () {
            js.context.callMethod('open', [widget.url]);
          },
          child: SvgPicture.asset(
            widget.assetPath,
            height: widget.size,
            color: _isHovered ? Colors.black : widget.color,
          ),
        ),
      ),
    );
  }
}
