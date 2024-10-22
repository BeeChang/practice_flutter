import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class AppColors {
  static final black100 = HexColor.fromHex('#222040');
  static final black80 = HexColor.fromHex('#4E4D66');
  static final black60 = HexColor.fromHex('#7A798C');
  static final black40 = HexColor.fromHex('#A6A6B2');
  static final black20 = HexColor.fromHex('#D2D2D8');
  static final black10 = HexColor.fromHex('#E9E9EC');
  static final black5 = HexColor.fromHex('#F4F4F5');
  static final black2 = HexColor.fromHex('#FAFAFB');
  static final white = HexColor.fromHex('#FFFFFF');

  static final primary120 = HexColor.fromHex('#00B951');
  static final primary100 = HexColor.fromHex('#00D35C');
  static final primary80 = HexColor.fromHex('#33DC7D');
  static final primary60 = HexColor.fromHex('#66E59E');
  static final primary40 = HexColor.fromHex('#99EEBE');
  static final primary20 = HexColor.fromHex('#CCF6DE');
  static final primary10 = HexColor.fromHex('#E5FAEE');
  static final primary5 = HexColor.fromHex('#F2FDF7');

  static final accent100 = HexColor.fromHex('#0078FF');
  static final accent80 = HexColor.fromHex('#3393FF');
  static final accent60 = HexColor.fromHex('#66AEFF');
  static final accent40 = HexColor.fromHex('#99C9FF');
  static final accent20 = HexColor.fromHex('#CCE4FF');
  static final accent10 = HexColor.fromHex('#E6F2FF');
  static final accent5 = HexColor.fromHex('#F2F8FF');

  static final secondary100 = HexColor.fromHex('#E03B00');
  static final secondary80 = HexColor.fromHex('#E66233');
  static final secondary60 = HexColor.fromHex('#EC8966');
  static final secondary40 = HexColor.fromHex('#F3B199');
  static final secondary20 = HexColor.fromHex('#F9D8CC');
  static final secondary10 = HexColor.fromHex('#FCECE6');
  static final secondary5 = HexColor.fromHex('#FEF5F2');

  static final warning = HexColor.fromHex('#FFC107');
  static final error = HexColor.fromHex('#DA0000');
}
