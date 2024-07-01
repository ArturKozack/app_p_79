import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  final Widget child;

  const TextBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
        ),
        LayoutBuilder(
          builder: (_, constraint) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () => FocusScope.of(context).unfocus(),
                        ),
                      ),
                      child,
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
