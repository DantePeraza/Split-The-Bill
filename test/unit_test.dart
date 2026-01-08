import 'package:final_proj/utils/tools.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Tests for adding tip to a total amount.
  group("totalWithTip", () {
    test(
      'adds 15% tip to 100 = 115.00',
      () {
        expect(Tools.totalWithTip(100, 15), equals(115.00));
      },
    );

    test(
      'adds 18% tip to 12.34 rounds to 14.56',
      () {
        expect(Tools.totalWithTip(12.34, 18), equals(14.56));
      },
    );

    test(
      'zero tip returns same total',
      () {
        expect(Tools.totalWithTip(80, 0), equals(80.00));
      },
    );

    test(
      'throws ArgumentError on negative total',
      () {
        expect(() => Tools.totalWithTip(-10, 10), throwsArgumentError);
      },
    );

    test(
      'throws ArgumentError on negative tip',
      () {
        expect(() => Tools.totalWithTip(50, -5), throwsArgumentError);
      },
    );
  });

  // Tests for per-person total with tip and party size.
  group("perPersonTotal", () {
    test(
      '120 with 15% tip split by 3 = 46.00',
      () {
        expect(Tools.perPersonTotal(120, 15, 3), equals(46.00));
      },
    );

    test(
      '100 with 10% tip split by 4 = 27.50',
      () {
        expect(Tools.perPersonTotal(100, 10, 4), equals(27.50));
      },
    );

    test(
      'supports custom decimals (3.667)',
      () {
        expect(Tools.perPersonTotal(10, 10, 3, decimals: 3), equals(3.667));
      },
    );

    test(
      'throws ArgumentError on party size zero',
      () {
        expect(() => Tools.perPersonTotal(50, 10, 0), throwsArgumentError);
      },
    );

    test(
      'throws ArgumentError on negative party size',
      () {
        expect(() => Tools.perPersonTotal(50, 10, -2), throwsArgumentError);
      },
    );

    test(
      'throws ArgumentError on negative total',
      () {
        expect(() => Tools.perPersonTotal(-1, 10, 2), throwsArgumentError);
      },
    );

    test(
      'throws ArgumentError on negative tip',
      () {
        expect(() => Tools.perPersonTotal(50, -1, 2), throwsArgumentError);
      },
    );
  });
}
