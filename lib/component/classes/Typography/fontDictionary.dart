import 'package:flutter/material.dart';

const pColorL = Color(0xFFF3F5F8);
const pColorD = Color(0xFF1F1F1F);
const gColorD = Color(0xFFD3C7C7);
const sColor = Color(0xFF5F5AC9);
const gColor = Color(0xFF888888);
const tColor = Color(0xFF7DB634);
const rColor = Color(0xFFEB6338);
const taskCo = Color(0xFF873AB6);

class FontStyles {
  static const TextStyle H1 = TextStyle(
    fontSize: 45.0,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle NT = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle H2 = TextStyle(
    fontSize: 18.5,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle H2C = TextStyle(
      fontSize: 18.5,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.lineThrough,
      color: gColor);
  static const TextStyle H2W = TextStyle(
    fontSize: 18.5,
    color: pColorL,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle date = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
  );

  // ... other font styles as needed

  static TextStyle getTextStyle(TextStyleType type) {
    switch (type) {
      case TextStyleType.primary:
        return H1;
      case TextStyleType.Notetitle:
        return NT;
      case TextStyleType.secondary:
        return H2;
      case TextStyleType.completed:
        return H2C;
      case TextStyleType.secondaryW:
        return H2W;
      case TextStyleType.third:
        return date;

      // ... other cases
      default:
        return H1;
    }
  }
}

enum TextStyleType {
  primary,
  Notetitle,
  secondary,
  completed,
  secondaryW,
  third,
  // ... other types
}
// Text(
// "style",
// style: TextStyle(
// fontFamily: 'Edu',
// ),
// ),
// Text(
// "style",
// style: TextStyle(
// fontFamily: 'Glyphic',
// ),
// ),
// Text(
// "style",
// style: TextStyle(
// fontFamily: 'Figtree',
// ),
// ),
// Text(
// "style",
// style: TextStyle(
// fontFamily: 'Oswald',
// ),
// ),
// Text(
// "style",
// style: TextStyle(
// fontFamily: 'Gummy',
// ),
// ),
