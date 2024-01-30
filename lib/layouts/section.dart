import 'package:flutter/material.dart';

class SectionWithTitleAndButton extends StatelessWidget {
  final String title;
  final String buttonText;
  final List<Widget> children;

  const SectionWithTitleAndButton({
    super.key,
    required this.title,
    required this.buttonText,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Handle "See All" button tap
                },
                child: Text(buttonText),
              ),
            ],
          ),
        ),
        ...children,
      ],
    );
  }
}
