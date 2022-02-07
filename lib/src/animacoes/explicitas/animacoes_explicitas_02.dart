import 'dart:math';

import 'package:flutter/material.dart';

class AnimacoesImplicitasExercicio02 extends StatelessWidget {
  const AnimacoesImplicitasExercicio02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recriando Expasion Tile')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return MyExpansionTile(title: 'My Expansion Tile $index');
          },
        ),
      ),
    );
  }
}

class MyExpansionTile extends StatefulWidget {
  const MyExpansionTile({Key? key, required this.title}) : super(key: key);

  final String title;
  //final String subtitulo;

  @override
  State<MyExpansionTile> createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> {
  bool isExpanded = false;
  var duration = Duration(seconds: 1);
  get title => widget.title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: ClipRect(
        child: ListTile(
          title: Text('$title'),
          trailing: AnimatedRotation(
            curve: Curves.ease,
            duration: Duration(milliseconds: 300),
            turns: isExpanded ? 0.5 : 0.0,
            child: Icon(Icons.keyboard_arrow_down),
          ),
          subtitle: AnimatedAlign(
            alignment: Alignment.topCenter,
            heightFactor: isExpanded ? 1 : 0,
            duration: duration,
            child: isExpanded
                ? Column(
                    children: <Widget>[
                      Image.asset('assets/flutter.png'),
                      Text(textoRandomico(), textAlign: TextAlign.justify),
                    ],
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

String textoRandomico() {
  const texto = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eu est ornare,
interdum purus sit amet, venenatis elit. Vivamus fermentum ex id feugiat ornare.
Vivamus condimentum neque id arcu rutrum, nec feugiat lectus congue. Aliquam mi
dui, lacinia non rhoncus eu, suscipit ut sapien. Ut dictum tincidunt lorem non maximus.
Quisque mattis finibus auctor.
''';
  var end = Random().nextInt(texto.length);
  return texto.substring(0, end);
}
