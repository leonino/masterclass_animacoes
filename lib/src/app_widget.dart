import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'animacoes/explicitas/animacoes_explicitas_01.dart';
import 'animacoes/explicitas/animacoes_explicitas_02.dart';
import 'animacoes/implicitas/animacoes_implicitas_02.dart';
import 'animacoes/implicitas/animacoes_implicitas_01.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/impricita01': (context) => const AnimacoesImplicitasExercicio01(),
        '/impricita02': (context) => const AnimacoesImplicitasExercicio02(),
        '/explicita01': (context) => const AnimacoesExplicitasExercicio01(),
        '/explicita02': (context) => const AnimacoesExplicitasExercicio02(),
      },
    );
  }
}
