import 'package:flutter/material.dart';

class AnimacoesImplicitasExercicio01 extends StatefulWidget {
  const AnimacoesImplicitasExercicio01({Key? key}) : super(key: key);

  @override
  _AnimacoesImplicitas01State createState() => _AnimacoesImplicitas01State();
}

class _AnimacoesImplicitas01State
    extends State<AnimacoesImplicitasExercicio01> {
  var isCircular = true;
  var duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    move() {
      setState(() {
        isCircular = !isCircular;
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text('Desafio do Botão Flutuante')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedAlign(
          alignment: (isCircular) ? Alignment.bottomRight : Alignment.topCenter,
          duration: duration,
          child: GestureDetector(
            onTap: move,
            child: AnimatedContainer(
              duration: duration,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(isCircular ? 100 : 0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
