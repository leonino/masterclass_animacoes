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

class _MyExpansionTileState extends State<MyExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationRotation;
  late Animation<double> animationAlign;
  var duration = const Duration(milliseconds: 300);
  var isExpanded = false;

  get title => widget.title;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: duration, vsync: this);
    animationRotation = Tween<double>(begin: 0.0, end: 0.5).animate(controller);
    animationAlign = Tween<double>(begin: 0.1, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (controller.value == 0) {
            isExpanded = true;
            controller.forward();
          } else {
            isExpanded = false;
            controller.reverse();
          }
        });
      },
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return ClipRect(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$title'),
                      RotationTransition(
                        turns: animationRotation,
                        child: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                    width: double.infinity,
                  ),
                  Align(
                    heightFactor: animationAlign.value,
                    alignment: Alignment.center,
                    child: (isExpanded)
                        ? Column(
                            children: <Widget>[
                              Image.asset('assets/flutter.png'),
                              Text(textoRandomico(),
                                  textAlign: TextAlign.justify),
                            ],
                          )
                        : null,
                  ),
                ],
              ),
            );
          }),
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
  //var end = Random().nextInt(texto.length);
  return texto.substring(0, 150);
}
