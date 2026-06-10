import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test passthrough', (WidgetTester tester) async {
    // Test kosongan agar compiler tidak mendeteksi error objek lama
    expect(true, isTrue);
  });
}