import 'package:flutter/material.dart';
import 'package:my_app/theme/colors/app_colors.dart';
import 'package:my_app/theme/typography/text_styles.dart';
import 'package:my_app/theme/white_space/space_helper.dart';

class MyButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;

  const MyButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
  })  : outline = false,
        super(key: key);

  const MyButton.outline({
    Key? key,
    required this.title,
    this.onTap,
    this.leading,
  })  : disabled = false,
        busy = false,
        outline = true,
        super(key: key);
        

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          width: double.infinity,
          height: 48,
          alignment: Alignment.center,
          decoration: !outline
              ? BoxDecoration(
                  color: !disabled ?kcPrimary  : kcDisabled,
                  borderRadius: BorderRadius.circular(8),
                )
              : BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: kcPrimary,
                    width: 1,
                  )),
          child: !busy
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leading != null) leading!,
                    if (leading != null) hSpaceMin,
                    Text(
                      title,
                      style: bodyStyle.copyWith(
                        fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                        color: !outline ? Colors.white : kcPrimary,
                      ),
                    ),
                  ],
                )
              :const CircularProgressIndicator(
                  strokeWidth: 4,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
        ),
      ),
    );
  }
}
