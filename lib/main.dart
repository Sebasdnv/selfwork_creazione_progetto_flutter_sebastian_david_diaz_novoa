import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  final List<Map<String, String>> prodotti = const [
    {"nome": "Prodotto 1", "prezzo": "20€", "immagine": "assets/images/flutterimg.jpg"},
    {"nome": "Prodotto 2", "prezzo": "50€", "immagine": "assets/images/flutterimg.jpg"},
    {"nome": "Prodotto 3", "prezzo": "80€", "immagine": "assets/images/flutterimg.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, 
      
      home: Scaffold(
        appBar: AppBar(title: const Text("First App"), centerTitle: true),
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          },
          child: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
        ),
        
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
                        children: const [
                          Text("prima linea"),
                          Text("seconda linea"),
                          Text("terza linea"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
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
                        flex: 4, 
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: prodotti.length,
                          itemBuilder: (context, index) {
                            return Card.filled(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(prodotti[index]['immagine']!, width: 100),
                                  Text(prodotti[index]['nome'] ?? 'Nome non disponibile'),
                                  Text(prodotti[index]['prezzo']!),
                                ],
                              ),
                            );
                          },
                        ),
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
                              icon: const Icon(Icons.home),
                            ),
                            IconButton(
                              onPressed: () {
                                print("indirizzamento alla dashboard");
                              },
                              icon: const Icon(Icons.menu),
                            ),
                            IconButton(
                              onPressed: () {
                                print("indirizzamento alla pagina profilo");
                              },
                              icon: const Icon(Icons.person),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } 
                else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: prodotti.length,
                          itemBuilder: (context, index) {
                            return Card.filled(
                              child: Column(
                                children: [
                                  Image.asset(prodotti[index]['immagine']!, height: 100, fit: BoxFit.cover),
                                  Text(prodotti[index]['nome'] ?? 'Nome non disponibile'),
                                  Text(prodotti[index]['prezzo']!),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      
                      SizedBox(
                        height: constraints.maxHeight * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                print("indirizzamento alla home");
                              },
                              icon: const Icon(Icons.home),
                            ),
                            IconButton(
                              onPressed: () {
                                print("indirizzamento alla dashboard");
                              },
                              icon: const Icon(Icons.menu),
                            ),
                            IconButton(
                              onPressed: () {
                                print("indirizzamento alla pagina profilo");
                              },
                              icon: const Icon(Icons.person),
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