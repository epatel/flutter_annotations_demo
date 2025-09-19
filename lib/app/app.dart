import 'package:flutter_annotations_demo/index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(
              title: 'Flutter Demo Home Page',
            ),
          ),
          ...options.map(
            (option) => GoRoute(
              path: option['route'],
              builder: (context, state) => option['screen'](),
            ),
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
