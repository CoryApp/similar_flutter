import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:similar_flutter/similar_flutter.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async => await RustLib.init());
  test('Can call rust function', () async {
    expect(
        diff(
            text1: "Hello World\nThis is the second line.\nThis is the third.",
            text2:
                "Hellol Welt\nThis is the second line\nThis is life.\nMoar and more"),
        "Hello, Tom!");
  });
}
