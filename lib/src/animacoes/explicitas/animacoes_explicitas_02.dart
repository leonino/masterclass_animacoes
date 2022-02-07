import 'dart:math';

import 'package:flutter/material.dart';

class AnimacoesExplicitasExercicio02 extends StatelessWidget {
  const AnimacoesExplicitasExercicio02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recriando Expasion Tile'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 2,
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

class _MyExpansionTileState extends State<MyExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationRotation;
  late Animation<double> animationFactor;
  var duration = Duration(seconds: 1);

  get title => widget.title;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: duration, vsync: this);
    animationRotation = Tween<double>(begin: 0.0, end: 0.5).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    animationFactor = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        });
      },
      child: ClipRect(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$title'),
                RotationTransition(
                  turns: animationRotation,
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              heightFactor: animationFactor.value,
              child: (controller.isCompleted)
                  ? Container(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/flutter.png'),
                          Text(textoRandomico(), textAlign: TextAlign.justify),
                        ],
                      ),
                    )
                  : null,
            ),
          ],
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
