import 'dart:io';

// from https://programming-idioms.org/idiom/75/compute-lcm/749/dart
int math_lcm(int a, int b) => (a * b) ~/ math_gcd(a, b);
int math_gcd(int a, int b) {
  while (b != 0) {
    var t = b;
    b = a % t;
    a = t;
  }
  return a;
}

class Monkey {
  final items = <int>[];
  var op1 = 0, op2 = 0; // "old"->0, N->N
  var op = 0; // "+"->'+'.codeUnitAt(0), "*"->'*'.codeUnitAt(0)
  var div_test = 0;
  var throw_t = 0, throw_f = 0;
}

void main() {
  final monkeys = <Monkey>[];
  final processed = <int>[];
  var lcm = 1;
  final lines = File('input.txt').readAsLinesSync();
  final num_monkeys = (lines.length + 1) ~/ 7;
  for (int i = 0; i < num_monkeys; i++) {
    final items = lines[i * 7 + 1].substring(18).split(', ');
    final ops = lines[i * 7 + 2].substring(19).split(' ');
    final div_test = lines[i * 7 + 3].substring(21);
    final throw_t = lines[i * 7 + 4].substring(29);
    final throw_f = lines[i * 7 + 5].substring(30);
    final monkey = Monkey();
    for (final item in items) {
      monkey.items.add(int.parse(item));
    }
    monkey.op1 = int.tryParse(ops[0]) ?? 0;
    monkey.op = ops[1].codeUnitAt(0);
    monkey.op2 = int.tryParse(ops[2]) ?? 0;
    monkey.div_test = int.parse(div_test);
    monkey.throw_t = int.parse(throw_t);
    monkey.throw_f = int.parse(throw_f);
    monkeys.add(monkey);
    processed.add(0);
    lcm = math_lcm(lcm, monkey.div_test);
  }
  final PLUS = '+'.codeUnitAt(0);
  final TIMES = '*'.codeUnitAt(0);
  for (int round = 0; round < 10000; round++) {
    for (int n = 0; n < num_monkeys; n++) {
      final monkey = monkeys[n];
      for (var item in monkey.items) {
        if (monkey.op == PLUS) {
          item = ((monkey.op1 == 0) ? item : monkey.op1) +
              ((monkey.op2 == 0) ? item : monkey.op2);
        } else if (monkey.op == TIMES) {
          item = ((monkey.op1 == 0) ? item : monkey.op1) *
              ((monkey.op2 == 0) ? item : monkey.op2);
        }
        item %= lcm;
        if (item % monkey.div_test == 0) {
          monkeys[monkey.throw_t].items.add(item);
        } else {
          monkeys[monkey.throw_f].items.add(item);
        }
      }
      processed[n] += monkey.items.length;
      monkey.items.clear();
    }
  }
  processed.sort();
  print(processed[num_monkeys - 1] * processed[num_monkeys - 2]);
}
