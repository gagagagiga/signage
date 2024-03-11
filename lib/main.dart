import 'package:flutter/material.dart';

const rowDivider = SizedBox(width: 20);
const colDivider = SizedBox(height: 10);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textEditingController =
  new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Message:'),
              colDivider,
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a message',
                ),
              ),
              colDivider,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => openFullscreenDialog(
                        context, textEditingController.text),
                    child: const Text('OK'),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                    onPressed: () => textEditingController.clear(),
                    icon: const Icon(Icons.clear),
                    label: const Text('Clear'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openFullscreenDialog(BuildContext context, String message) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scaffold(
            appBar: AppBar(
              leading: SizedBox(width: 20),
              actions: [
                IconButton(
                  icon: const Icon(Icons.close),
                  style: IconButton.styleFrom(foregroundColor: Colors.black12),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            body:
            // LayoutBuilder(
            //   builder: (context, constraints) {
            //     final width = constraints.maxWidth;
            //     var fontSize = 16.0;
            //     if (width <= 480) {
            //       fontSize = 16.0;
            //     } else if (width > 480 && width <= 960) {
            //       fontSize = 22.0;
            //     } else {
            //       fontSize = 28.0;
            //     }
            //     return Center(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Text(
            //             message,
            //             textAlign: TextAlign.center,
            //             style: TextStyle(fontSize: constraints.maxHeight*2/3),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // )

            // Center(
            // child: LayoutBuilder(
            //   builder: (BuildContext context, BoxConstraints constraints) {
            //     return Text(
            //       message,
            //       style: TextStyle(fontSize: constraints.maxHeight/2),
            //     );
            //   },
            // ),
            // ),

            Center(
              child: Column(children: <Widget>[
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
