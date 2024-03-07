import 'package:shopping/Pages/home_page.dart';
import 'package:shopping/Pages/not_found.dart';
import 'package:shopping/Pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {
  Map<String, WidgetBuilder>? _routes;

  AppState? _state;

  @override
  void initState() {
    super.initState();
    _state = AppState();

    _routes = {
      WelcomePage.routeName: (_) => const WelcomePage(),
      HomePage.routeName: (_) => const HomePage(),
    };
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        inProvider<AppState>(_state!),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Gotham'),
        title: 'Shop',
        onGenerateRoute: (settings) {

          if (_routes!.containsKey(settings.name)) {
            final builder = _routes![settings.name];
            return inPageRoute(
                builder!(context), RouteSettings(name: settings.name));
          }

          return inPageRoute(const NotFound());
        },
        // Mirgration to Navigator 2.0
        // merge request: https://github.com/flutter/flutter/pull/51435
        // migration guide: https://flutter.dev/docs/release/breaking-changes/route-navigator-refactoring
        onGenerateInitialRoutes: (initialRoute) {
          return <Route>[
            inPageRoute(
                const WelcomePage(), RouteSettings(name: WelcomePage.routeName))
          ];
        }

        // supportedLocales: [//TO DO DEFINE SUPOORTED LANGSSSSS],
      ),
    );
  }
}

bool neverNotify(_, __) => false;

Provider<T> inProvider<T>(T value) =>
    Provider<T>.value(value: value, updateShouldNotify: neverNotify);

MaterialPageRoute inPageRoute(Widget child, [RouteSettings? settings]) =>
    MaterialPageRoute(builder: (context) => child, settings: settings);
