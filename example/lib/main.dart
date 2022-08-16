import 'package:flutter/material.dart';
import 'package:link_sdk_flutter/lean_flutter_sdk.dart';

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
    var leanView = LeanViewWidget(
      appToken: "d52f0c33-d721-480f-aa59-a37546baaae7",
      callback: (message) => print(message),
    );

    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff00BCD1),
            body: Column(
              children: <Widget>[
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () => leanView.connect(
                      customerId: "8c73ae1a-ed23-4e16-84c6-eb0ffc476946",
                      permissions: [
                        "identity",
                        "transactions",
                        "balance",
                        "accounts"
                      ]),
                  child: Text('Connect'),
                ),
                SizedBox(
                    height: size.height - 68,
                    width: size.height,
                    child: leanView)
              ],
            )));
  }
}
