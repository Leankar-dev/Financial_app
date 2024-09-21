// Classe auxiliar que sobrecarrega a atuação do TextInputFormatter
// para formatar o texto digitado no campo para maiusculo
//

import 'package:flutter/services.dart';

class UppercaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
