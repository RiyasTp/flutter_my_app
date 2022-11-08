import 'package:flutter/material.dart';
import 'package:my_app/theme/typography/text_styles.dart';

class H1 extends Text{
  const H1(super.data,{Key? key}):super(
    key: key,
    style: heading1Style
  );
}
class H2 extends Text{
  const H2(super.data,{Key? key}):super(
    key: key,
    style: heading2Style
  );
}
class H3 extends Text{
  const H3(super.data,{Key? key}):super(
    key: key,
    style: heading3Style
  );
}
class Headline extends Text{
  const Headline(super.data,{Key? key}):super(
    key: key,
    style: headlineStyle
  );
}
class SubHeading extends Text{
  const SubHeading(super.data,{Key? key}):super(
    key: key,
    style: subheadingStyle
  );
}
class BodyText extends Text{
  const BodyText(super.data,{Key? key}):super(
    key: key,
    style: bodyStyle,
  );
   BodyText.bold(super.data,{Key? key}):super(
    key: key,
    style: bodyStyle.copyWith(fontWeight: FontWeight.w800),
  );

}