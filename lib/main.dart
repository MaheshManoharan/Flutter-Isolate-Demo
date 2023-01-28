import 'dart:isolate';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

void isolateFunction(int finalNum)
{
 int _count = 0;

 for(int i=0; i<finalNum; i++)
 {
  _count++;
  if((_count % 100) == 0)
  {
    print("isolate "+ _count.toString());
  }
 }
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> 
{
 int count = 0;

  @override
  void initState() {
    super.initState();
    Isolate.spawn(isolateFunction, 1000);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(count.toString()),
              ElevatedButton(
                onPressed: () {
                  count++;
                  setState(() {});
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
