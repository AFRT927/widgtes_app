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
          Text('Circular Y Linear controlados'),
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
    return StreamBuilder<double>(
      stream: Stream.periodic(Duration(milliseconds: 300), (value){
          return (value*2)/100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 4,
                backgroundColor: Colors.black12,            
              ),
              const SizedBox(width: 20,),
              Expanded(            
                child: LinearProgressIndicator(
                  value: progressValue,
                )
                )
            ],
          ),
          );
      }
    );
  }
}