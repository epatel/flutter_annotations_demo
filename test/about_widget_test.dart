import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_annotations_demo/index.dart';

void main() {
  testWidgets('About screen renders title and markdown', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutScreen(),
      ),
    );

    // AppBar title
    expect(find.text('About'), findsOneWidget);

    // Renders a Markdown widget
    expect(find.byType(Markdown), findsOneWidget);

    // Back button icon exists
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
}
