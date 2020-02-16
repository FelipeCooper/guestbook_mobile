import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:guestbook_mobile/app/messages/messages_page.dart';

main() {
  testWidgets('MessagesPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(MessagesPage(title: 'Messages')));
    final titleFinder = find.text('Messages');
    expect(titleFinder, findsOneWidget);
  });
}
