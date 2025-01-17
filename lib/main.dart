import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';
import 'remote_control.dart';

/// Global access to the navigator state for showing an error dialog.
final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: 'AppNavigator');

/// Flag to avoid showing multiple error dialogs.
var showingErrorDialog = false;

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    Zone.current.handleUncaughtError(details.exception, details.stack!);
  };

  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    var prefs = await SharedPreferences.getInstance();
    runApp(VlcRemote(prefs: prefs, settings: Settings(prefs)));
  }, (error, stackTrace) async {
    print('$error\n\n$stackTrace');
    // if (showingErrorDialog ||
    //     navigatorKey.currentState?.overlay?.context == null) {
    //   return;
    // }
    // showingErrorDialog = true;
    // await showDialog(
    //   context: navigatorKey.currentState!.overlay!.context,
    //   builder: (context) => AlertDialog(
    //     title: const Text('Unhandled Error'),
    //     content: SingleChildScrollView(
    //       child: Column(
    //         children: <Widget>[
    //           Text('$error\n\n$stackTrace'),
    //         ],
    //       ),
    //     ),
    //     actions: <Widget>[
    //       TextButton(
    //         child: const Text('COPY ERROR DETAILS'),
    //         onPressed: () {
    //           Clipboard.setData(
    //             ClipboardData(text: '$error\n\n$stackTrace'),
    //           );
    //         },
    //       )
    //     ],
    //   ),
    // );
    // showingErrorDialog = false;
  });
}

class VlcRemote extends StatelessWidget {
  final SharedPreferences prefs;
  final Settings settings;

  const VlcRemote({
    Key? key,
    required this.prefs,
    required this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Remote Control for VLC',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: RemoteControl(prefs: prefs, settings: settings),
    );
  }
}
