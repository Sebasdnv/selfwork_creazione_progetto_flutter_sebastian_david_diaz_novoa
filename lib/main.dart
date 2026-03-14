import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("First App"), centerTitle: true),
        body: Container(
          height: size.height * 1,
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          Text("prima linea"),
                          Text("seconda linea"),
                          Text("terza linea"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.star, color: Colors.green),
                          Icon(Icons.home, color: Colors.blueAccent),
                          Icon(Icons.person, color: Colors.amber),
                        ],
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Image.asset(
                                'assets/images/flutterimg.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Image.asset(
                                'assets/images/flutterimg.jpg',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                print("indirizzamento alla home");
                              },
                              icon: Icon(Icons.home),
                            ),
                            IconButton(
                              onPressed: () {
                                print("indirizzamento alla dashboard");
                              },
                              icon: Icon(Icons.menu),
                            ),
                            IconButton(
                              onPressed: () {
                                print("indirizzamento alla pagina profilo");
                              },
                              icon: Icon(Icons.person),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("prima linea"),
                            Text("seconda linea"),
                            Text("terza linea"),
                            SizedBox(height: constraints.maxHeight * 0.1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.star, color: Colors.green),
                                Icon(Icons.home, color: Colors.blueAccent),
                                Icon(Icons.person, color: Colors.amber),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.6,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: (constraints.maxWidth * 0.6) * 0.6,
                                  height: constraints.maxHeight * 0.7,
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/flutterimg.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: (constraints.maxWidth * 0.6) * 0.4,
                                  height: constraints.maxHeight * 0.7,
                                  child: Container(
                                    child: Image.asset(
                                      'assets/images/flutterimg.jpg',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      print("indirizzamento alla home");
                                    },
                                    icon: Icon(Icons.home),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      print("indirizzamento alla dashboard");
                                    },
                                    icon: Icon(Icons.menu),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      print("indirizzamento alla pagina profilo");
                                    },
                                    icon: Icon(Icons.person),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}