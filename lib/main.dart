import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_task_0',
      home: InputPage(),
    );
  }
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('task 0'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Insert number'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Insert number'),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                _navigateToResult(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
  void _navigateToResult(BuildContext context) {
    if (_controller1.text.isNotEmpty && _controller2.text.isNotEmpty) {
      int num1 = int.parse(_controller1.text);
      int num2 = int.parse(_controller2.text);
      int sum = num1 + num2;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(result: sum),
        ),
      );
    }
  }
}

class ResultPage extends StatelessWidget {
  final int result;

  ResultPage({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Text(
          'Sum= $result',
          style: const TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}


