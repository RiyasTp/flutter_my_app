import 'package:flutter/material.dart';
import 'package:my_app/theme/app_widgets/app_texts.dart';

class QuestionButton extends StatelessWidget {
  final String question;
  final String action;
  final void Function()? onTap;
  const QuestionButton({
    required this.question,
    required this.action,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BodyText(question),
            BodyText.bold(action),
          ],
        ),
      ),
    );
  }
}