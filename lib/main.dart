import 'package:app_base_flutter/core/values/sizeconfig.dart';
import 'package:app_base_flutter/datasource/local_data_source/constants/hive_constants.dart';
import 'package:app_base_flutter/di/injectable.dart';
import 'package:app_base_flutter/environment/environment.dart';
import 'package:app_base_flutter/repository/base_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: Env.fileName);
  Env.loadBuildConfig();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    await initHiveStorage();
    await initHiveForFlutter();
    await configureDependencies();
    final client=await initGraphQL();
    final ValueNotifier<GraphQLClient> clientNotifier = ValueNotifier(client);
    runApp(GraphQLProvider(
      client: clientNotifier,
      child: const MyApp(),
    ));
  });
}

Future initHiveStorage() async {
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  return Hive.init(appDocumentDirectory.path);
}

Future<GraphQLClient> initGraphQL() async {
  // Initialize GraphQL client
  final HttpLink httpLink = HttpLink(
    dotenv.env['BASE_URL'] ?? 'https://api-staging.qawqal.com/graphql',
  );
  await Hive.openBox(HiveConstants.SESSIONS.SESSION_AUTH_BOX);
  final token=getIt<BaseRepository>().accessToken;
  final AuthLink authLink = AuthLink(
    getToken: () async => "Bearer $token", // Replace with your token
  );
  final Link link = authLink.concat(httpLink);
  final GraphQLClient client = GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore()),
  );
  return client;
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return getIt<GetMaterialApp>();
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).primaryTextTheme.bodyLarge,
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'CURRENT FLAVOR: ${Env.currentFlavor.name}',
              style: Theme.of(context).primaryTextTheme.displaySmall,
            ),
            Text(
              'You have pushed the button this many times:${Env.currentFlavor.name}',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColorLight,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
