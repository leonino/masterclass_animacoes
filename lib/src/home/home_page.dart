import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Animações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 30, height: 30),
            const Text('Implicitas'),
            const SizedBox(width: 10, height: 10),
            CustomButton(
              titulo: 'Desafio do Botão Flutuante',
              onTap: () {
                Navigator.of(context).pushNamed('/impricita01');
              },
            ),
            CustomButton(
              titulo: 'Recriando Expasion Tile',
              onTap: () {
                Navigator.of(context).pushNamed('/impricita02');
              },
            ),
            const SizedBox(width: 30, height: 30),
            const Text('Explicitas / Controladas'),
            const SizedBox(width: 10, height: 10),
            CustomButton(
              titulo: 'Desafio do Botão Flutuante',
              cor: Colors.redAccent,
              onTap: () {
                Navigator.of(context).pushNamed('/explicita01');
              },
            ),
            CustomButton(
              titulo: 'Recriando Expasion Tile',
              cor: Colors.redAccent,
              onTap: () {
                Navigator.of(context).pushNamed('/explicita02');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String titulo;
  final VoidCallback onTap;
  final Color cor;
  final double borderRadiusCircular;

  const CustomButton({
    Key? key,
    required this.titulo,
    required this.onTap,
    this.cor = Colors.blueAccent,
    this.borderRadiusCircular = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(2.0),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(borderRadiusCircular),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              wordSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
