import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lean_sdk_flutter/lean_sdk_flutter.dart';

void main() {
  runApp(const Demo());
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
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
        primary: Colors.black,
        minimumSize: const Size(200, 40),
        maximumSize: const Size(200, 40),
      );
}
