String deleteLast(String op) {
  return op.substring(0, op.length - 1);
}

bool isNan(String value) {
  return double.tryParse(value) == null;
}

double doOperation(String op) {
  double result = 0;
  int pos = 0;
  String charAct;
  String part1;
  String part2;
  String? part3;
  int posNext = -1;
  for (var i = 0; i < op.length; i++) {
    charAct = String.fromCharCode(op.codeUnitAt(i));
    if (isNan(charAct)) {
      part1 = op.substring(pos, i);
      print(part1);
      posNext = posOfNextCharacter(op);
      part2 = op.substring(i + 1, posNext == -1 ? op.length : posNext);
      print(part2);
      if (posNext != -1) {
        part3 = op.substring(posNext);
        print(part3);
      }

      result = double.parse(part1) + double.parse(part2);

      switch (charAct) {
        case '+':
          result = double.parse(part1) + double.parse(part2);
          break;
        case '-':
          result = double.parse(part1) - double.parse(part2);
          break;
        case '×':
          result = double.parse(part1) * double.parse(part2);
          break;
        case '÷':
          result = double.parse(part1) / double.parse(part2);
          break;
        default:
      }

      if (posNext != -1) {
        op = result.toInt().toString() + part3.toString();
        i = 0;
        print(op);
      } else {
        break;
      }
    }
  }

  return result;
}

int posOfNextCharacter(String op) {
  bool flag = false;
  int pos = -1;
  String charAct;
  for (var i = 0; i < op.length; i++) {
    charAct = String.fromCharCode(op.codeUnitAt(i));

    if (isNan(charAct)) {
      if (flag) {
        pos = i;
        break;
      } else
        flag = true;
    }
  }

  return pos;
}
