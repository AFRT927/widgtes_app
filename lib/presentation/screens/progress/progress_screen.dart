import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text('Circular Progress Indicator'),
          SizedBox(height: 10,),
          CircularProgressIndicator(
            strokeWidth: 4,
            backgroundColor: Colors.black38,            
          ),
          SizedBox(height: 20,),
          Text('Circular Indicator Controlado'),
          SizedBox(height: 20,),
          _ControllerProgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}