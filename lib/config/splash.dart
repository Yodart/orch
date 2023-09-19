import 'package:flutter/material.dart';

import '../../interface/infra/scale.dart';
import '../../interface/infra/typography.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: UIScale.width(7),
              width: UIScale.width(7),
              child: CircularProgressIndicator(color: Colors.black.withOpacity(0.25), strokeWidth: 1.5),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: UIScale.padding.bottom + UIScale.width(5)),
              child: UIText(
                'Orch, Inc.',
                fontSize: UITextSize.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
