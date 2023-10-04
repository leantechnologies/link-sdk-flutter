import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:lean_sdk_flutter/lean_sdk_flutter.dart';

void main() {
  runApp(const MyApp());
}

/// Route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'app/flutter/connect/success',
          builder: (BuildContext context, GoRouterState state) {
            return const SuccessScreen();
          },
        ),
        GoRoute(
          path: 'app/flutter/connect/fail',
          builder: (BuildContext context, GoRouterState state) {
            return const FailScreen();
          },
        ),
      ],
    ),
  ],
);

/// Main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

/// Home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appToken = "";
    var customerId = "";
    var reconnectId = "";
    var paymentDestinationId = "";
    var paymentIntentId = "";
    var permissions = [
      LeanPermissions.identity,
      LeanPermissions.transactions,
      LeanPermissions.balance,
      LeanPermissions.accounts,
      LeanPermissions.payments
    ];
    var isSandbox = true;

    _connect() {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                    child: Lean.connect(
                  showLogs: true,
                  appToken: appToken,
                  customerId: customerId,
                  permissions: permissions,
                  failRedirectUrl: "https://leantech.me/app/flutter/connect/success",
                  successRedirectUrl: "https://leantech.me/app/flutter/connect/fail",
                  customization: const {
                    "button_text_color": "white",
                    "theme_color": "red",
                    "button_border_radius": "10",
                    "overlay_color": "pink",
                  },
                  callback: (resp) {
                    if (kDebugMode) {
                      print("Callback: $resp");
                    }
                    Navigator.pop(context);
                  },
                  actionCancelled: () => Navigator.pop(context),
                )));
          });
    }

    _createPaymentSource() {
      showDialog(
          context: context,
          builder: (BuildContext context) => Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SizedBox(
                    child: Lean.createPaymentSource(
                      appToken: appToken,
                      customerId: customerId,
                      isSandbox: isSandbox,
                      callback: (resp) {
                        if (kDebugMode) {
                          print("Callback: $resp");
                        }
                        Navigator.pop(context);
                      },
                      actionCancelled: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ));
    }

    _reconnect() {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                    child: Lean.reconnect(
                  appToken: appToken,
                  reconnectId: reconnectId,
                  isSandbox: isSandbox,
                  env: 'development',
                  callback: (resp) {
                    if (kDebugMode) {
                      print("Callback: $resp");
                    }
                    Navigator.pop(context);
                  },
                  actionCancelled: () => Navigator.pop(context),
                )));
          });
    }

    _pay() {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                child: Lean.pay(
                  appToken: appToken,
                  paymentIntentId: paymentIntentId,
                  isSandbox: isSandbox,
                  callback: (resp) {
                    if (kDebugMode) {
                      print("Callback: $resp");
                    }
                    Navigator.pop(context);
                  },
                  actionCancelled: () => Navigator.pop(context),
                ),
              ),
            );
          });
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/lean.png',
                        width: 100, height: 100),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _connect(),
                      style: _buttonStyle(),
                      child: const Text('Connect'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _createPaymentSource(),
                      style: _buttonStyle(),
                      child: const Text('Create payment source'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _reconnect(),
                      style: _buttonStyle(),
                      child: const Text('Reconnect'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pay(),
                      style: _buttonStyle(),
                      child: const Text('Pay'),
                    ),
                  ],
                ),
              ],
            )));
  }

  _buttonStyle() => ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.black,
        minimumSize: const Size(200, 40),
        maximumSize: const Size(200, 40),
      );
}

/// Success screen
class SuccessScreen extends StatelessWidget {
  /// Constructs a [SuccessScreen]
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Success')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Account connected."),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to the Home screen'),
            ),
          ],
        )
      ),
    );
  }
}

/// Fail screen
class FailScreen extends StatelessWidget {
  /// Constructs a [FailScreen]
  const FailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Failed')),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Failed to connect account."),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Go back to the Home screen'),
              ),
            ],
          )
      ),
    );
  }
}
