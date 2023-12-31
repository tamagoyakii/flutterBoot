import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterBootPlus(),
    );
  }
}

class FlutterBootPlus extends StatelessWidget {
  const FlutterBootPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Text(
              'FlutterBoot Plus',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PlusFeatures(features: features),
          const Column(
            children: [
              Text(
                'Restore subscription',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Auto-renews for \$25/month until canceled',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: FilledButton(
              onPressed: null,
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),
              child: Text('Subscribe'),
            ),
          ),
        ],
      ),
    );
  }
}

class PlusFeatures extends StatelessWidget {
  final List<Feature> features;

  const PlusFeatures({
    super.key,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: features.length,
        itemBuilder: (context, index) => ListTile(
          leading: SizedBox(
            width: 40,
            height: 40,
            child: Center(child: features[index].icon),
          ),
          title: Text(
            features[index].title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(features[index].description),
          isThreeLine: true,
        ),
      ),
    );
  }
}

class Feature {
  final Icon icon;
  final String title;
  final String description;

  Feature({
    required this.icon,
    required this.title,
    required this.description,
  });
}

List<Feature> features = [
  Feature(
    icon: const Icon(Icons.bolt, size: 30),
    title: 'Premium features',
    description:
        'Plus subscribers have access to FlutterBoot+ and our latest beta features.',
  ),
  Feature(
    icon: const Icon(Icons.whatshot, size: 30),
    title: 'Priority access',
    description:
        'You\'ll be able to use FlutterBoot+ even when demand is high ',
  ),
  Feature(
    icon: const Icon(Icons.speed, size: 30),
    title: 'Ultra-fast',
    description: 'Enjoy even faster response speeds when using FlutterBoot',
  ),
];
