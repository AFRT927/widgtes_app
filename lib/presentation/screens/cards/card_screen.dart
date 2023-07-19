import 'package:flutter/material.dart';

const List<Map<String, dynamic>> cards =  [
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {

  static const String name = 'card_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Screen'),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
    
          children: [
          
          // spread
          ...cards.map(
          (c) => _CardType1(elevation: c['elevation'], lable: c['label']),
          ),
    
                  ...cards.map(
          (c) => _CardType2(elevation: c['elevation'], lable: c['label']),
          )
    
          ],
    
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {

  final String lable;
  final double elevation;

  const _CardType1({   
    required this.elevation,
    required this.lable
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.more_vert_outlined))
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(lable),
              )
          ],
        ),
        ),
    );
  }
}

class _CardType2 extends StatelessWidget {

  final String lable;
  final double elevation;

  const _CardType2({   
    required this.elevation,
    required this.lable
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: colors.primary
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.more_vert_outlined))
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('$lable - outline'),
              )
          ],
        ),
        ),
    );
  }
}