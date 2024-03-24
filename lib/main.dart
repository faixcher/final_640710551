import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://cpsu-api-49b593d4e146.herokuapp.com/api/2_2566/final/web_types'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("*ต้องกรอกข้อมูล")),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'URL *',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "รายละเอียด",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Text('ระบุประเภทเว็บเลว'),
            Text(data[0]['title']),
          ],
        ));
  }

  AppBar MyAppBar() {
    return AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Column(
            children: [
              Text(
                "Webby Fondue",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "ระบบรายงานเว็ปเลวๆ",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
