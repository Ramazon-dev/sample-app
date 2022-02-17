import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_functions.dart';
import 'package:sample_app_getx/controller/main/main_controller.dart';

import 'package:sample_app_getx/main.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(const MyApp(currentLocale: 'ru'));

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  // });

  test(
    "Function money formatter",
    () {
      /// test 1
      expect(BaseFunctions.moneyFormat(1000), "1 000");

      /// test 2
      expect(BaseFunctions.moneyFormat(100.0), "100");

      /// test 3
      expect(BaseFunctions.moneyFormat(-100.0), "-100");

      /// test 4
      expect(BaseFunctions.moneyFormat(-100.00), "-100");

      /// test 5
      expect(BaseFunctions.moneyFormat(-100.01), "-100.01");

      /// test 6
      expect(BaseFunctions.moneyFormat(0.0), "0");
    },
  );

  test(
    "Function money formatter symbol",
    () {
      /// test 1
      expect(BaseFunctions.moneyFormatSymbol(1000), "1 000 sum");

      /// test 2
      expect(BaseFunctions.moneyFormatSymbol(100.0), "100 sum");

      /// test 3
      expect(BaseFunctions.moneyFormatSymbol(-100.0), "-100 sum");

      /// test 4
      expect(BaseFunctions.moneyFormatSymbol(-100.00), "-100 sum");

      /// test 5
      expect(BaseFunctions.moneyFormatSymbol(-100.01), "-100.01 sum");

      /// test 6
      expect(BaseFunctions.moneyFormatSymbol(0.0), "0 sum");
    },
  );

  test(
    "Function MainController",
    () {
      var ctr = Get.put(MainController());
      ctr.setMenu(BottomMenu.profile);
      ctr.setLoading(true);

      /// test 1
      expect(ctr.bottomMenu, BottomMenu.profile);

      /// test 2
      expect(ctr.isLoading, true);
    },
  );
}
