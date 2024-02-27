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
class HomeScreen extends StatefulWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _appTokenController = TextEditingController();
  String appToken = "";

  // Connect
  final TextEditingController _connectCustomerIDController =
      TextEditingController();
  String connectCustomerID = "";
  final TextEditingController _connectBankIdentifierController =
      TextEditingController();
  String connectBankIdentifier = "";
  final TextEditingController _connectPaymentDestinationIDController =
      TextEditingController();
  String connectPaymentDestinationID = "";

  // Reconnect
  final TextEditingController _reconnectIDController = TextEditingController();
  String reconnectID = "";

  // Create Beneficiary
  final TextEditingController _customerIDController = TextEditingController();
  String customerID = "";
  final TextEditingController _paymentSourceIDController =
      TextEditingController();
  String paymentSourceID = "";
  final TextEditingController _paymentDestinationIDController =
      TextEditingController();
  String paymentDestinationID = "";

  // Pay
  bool isShowBalances = false;
  final TextEditingController _accountIdController = TextEditingController();
  String accountId = "";
  final TextEditingController _paymentIntentIDController =
      TextEditingController();
  String paymentIntentID = "";

  @override
  Widget build(BuildContext context) {
    var permissions = [
      LeanPermissions.identity,
      LeanPermissions.transactions,
      LeanPermissions.balance,
      LeanPermissions.accounts,
      LeanPermissions.payments
    ];
    var isSandbox = true;
    var environment = 'staging';

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
                      env: environment,
                      appToken: appToken,
                      isSandbox: isSandbox,
                      customerId: connectCustomerID,
                      bankIdentifier: connectBankIdentifier,
                      paymentDestinationId: connectPaymentDestinationID,
                      permissions: permissions,
                      failRedirectUrl:
                          "https://cdn.leantech.me/app/flutter/connect/success",
                      successRedirectUrl:
                          "https://cdn.leantech.me/app/flutter/connect/fail",
                      customization: const {
                        "button_text_color": "white",
                        "theme_color": "red",
                        "button_border_radius": "10",
                        "overlay_color": "pink",
                      },
                      callback: (LeanResponse resp) {
                        if (kDebugMode) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Callback: ${resp.message}"),
                          ));
                        }
                        Navigator.pop(context);
                      },
                      actionCancelled: () => Navigator.pop(context),
                    )));
          });
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
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Lean.reconnect(
                      env: environment,
                      appToken: appToken,
                      reconnectId: reconnectID,
                      isSandbox: isSandbox,
                      showLogs: true,
                      callback: (LeanResponse resp) {
                        if (kDebugMode) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Callback: ${resp.message}"),
                          ));
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
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Lean.createPaymentSource(
                      env: environment,
                      appToken: appToken,
                      customerId: customerID,
                      paymentSourceId: paymentSourceID,
                      paymentDestinationId: paymentDestinationID,
                      isSandbox: isSandbox,
                      showLogs: true,
                      callback: (LeanResponse resp) {
                        if (kDebugMode) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Callback: ${resp.message}"),
                          ));
                        }
                        Navigator.pop(context);
                      },
                      actionCancelled: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ));
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
                height: MediaQuery.of(context).size.height * 0.8,
                child: Lean.pay(
                  env: environment,
                  appToken: appToken,
                  accountId: accountId,
                  paymentIntentId: paymentIntentID,
                  showBalances: isShowBalances,
                  isSandbox: isSandbox,
                  showLogs: true,
                  callback: (LeanResponse resp) {
                    if (kDebugMode) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Callback: ${resp.message}"),
                      ));
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
            body: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/lean.png',
                          width: 100, height: 100),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Application token',
                              ),
                              controller: _appTokenController,
                              onChanged: (value) {
                                setState(() {
                                  appToken = value;
                                });
                              },
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Customer ID',
                              ),
                              controller: _connectCustomerIDController,
                              onChanged: (value) {
                                setState(() {
                                  connectCustomerID = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Bank Identifier',
                              ),
                              controller: _connectBankIdentifierController,
                              onChanged: (value) {
                                setState(() {
                                  connectBankIdentifier = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 14, left: 8, right: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Payment Destination ID',
                              ),
                              controller:
                                  _connectPaymentDestinationIDController,
                              onChanged: (value) {
                                setState(() {
                                  connectPaymentDestinationID = value;
                                });
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => _connect(),
                            style: _buttonStyle(),
                            child: const Text('Connect'),
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 14, left: 8, right: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Reconnect ID',
                              ),
                              controller: _reconnectIDController,
                              onChanged: (value) {
                                setState(() {
                                  reconnectID = value;
                                });
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => _reconnect(),
                            style: _buttonStyle(),
                            child: const Text('Reconnect'),
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Customer ID',
                              ),
                              controller: _customerIDController,
                              onChanged: (value) {
                                setState(() {
                                  customerID = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Payment Source ID',
                              ),
                              controller: _paymentSourceIDController,
                              onChanged: (value) {
                                setState(() {
                                  paymentSourceID = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 14, left: 8, right: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Payment Destination ID',
                              ),
                              controller: _paymentDestinationIDController,
                              onChanged: (value) {
                                setState(() {
                                  paymentDestinationID = value;
                                });
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => _createPaymentSource(),
                            style: _buttonStyle(),
                            child: const Text('Create payment source'),
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Show Balances"),
                                  Switch(
                                    value: isShowBalances,
                                    onChanged: (value) {
                                      setState(() {
                                        isShowBalances = value;
                                      });
                                    },
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Account ID',
                              ),
                              controller: _accountIdController,
                              onChanged: (value) {
                                setState(() {
                                  accountId = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 14, left: 8, right: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Payment Intent ID',
                              ),
                              controller: _paymentIntentIDController,
                              onChanged: (value) {
                                setState(() {
                                  paymentIntentID = value;
                                });
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => _pay(),
                            style: _buttonStyle(),
                            child: const Text('Pay'),
                          ),
                        ]),
                  ),
                ],
              ),
            )));
  }

  // _cardStyle() =>

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
      )),
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
      )),
    );
  }
}
