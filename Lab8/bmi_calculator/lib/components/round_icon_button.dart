import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundIconButton extends StatelessWidget {
  final FaIconData icon; 
  final VoidCallback onPressed;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPressed,
      // 2. Đưa thuộc tính 'child' xuống vị trí cuối cùng
      child: FaIcon(icon),
    );
  }
}