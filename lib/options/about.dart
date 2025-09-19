import 'package:flutter_annotations_demo/index.dart';

// ------------------------------------------------------------

@Initializer()
class AboutOption {
  AboutOption();

  static void Function()? initialize() {
    addOption({
      'title': 'About',
      'route': '/about',
      'icon': Icons.info,
      'screen': () => const AboutScreen(),
    });

    return null;
  }
}

// ------------------------------------------------------------

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('About'),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Text('About'),
      ),
    );
  }
}
