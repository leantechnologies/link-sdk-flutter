import 'package:flutter/material.dart';
import 'package:link_sdk_flutter/lean_sdk.dart';

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
    var appToken = "3405cab6-5e6c-4925-a14a-b3ba8914d315";
    var customerId = "3bb14718-2cab-423a-a133-0d94cb2a721f";
    var reconnectId = "";
    var paymentDestinationId = "";
    var paymentIntentId = "";
    var permissions = [
      Permission.identity,
      Permission.transactions,
      Permission.balance,
      Permission.accounts
    ];
    var isSandbox = true;

    _connect() {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.red,
          context: context,
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8, // control the size of the Lean SDK view
              child: Lean.connect(
                appToken: appToken,
                customerId: customerId,
                permissions: permissions,
                isSandbox: isSandbox,
                callback: (resp) => print("Callback: $resp"),
              ),
            );
          });
    }

    _createPaymentSource() {
      showDialog(
          context: context,
          builder: (BuildContext context) => Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Lean.createPaymentSource(
                appToken: appToken,
                customerId: customerId,
                isSandbox: isSandbox,
                callback: (resp) => print("Callback: $resp"),
              ),
            ),
          ));
    }

    _reconnect() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Lean.reconnect(
          appToken: appToken,
          reconnectId: reconnectId,
          isSandbox: isSandbox,
          callback: (resp) => print("Callback: $resp"),
        ),),
      );
    }

    _pay() { }

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
