import 'package:finance/features/tela_inicial/tela_inicial.dart';
import 'package:flutter/material.dart';

class Pub3 extends StatelessWidget {
  const Pub3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tela Inicial'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TelaInicial(),
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Associação Cuidado Humano",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700], // Título em verde
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Borda cinza
                  borderRadius: BorderRadius.circular(8), // Cantos arredondados
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'História',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'A Associação Cuidado Humano surgiu de um sonho em ajudar as pessoas com doenças terminais de uma maneira mais humana.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/grupo_cuidado.png",
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Atualmente a ACH atende mais de 200 pacientes de 27 municípios de Minas Gerais, que recebem todo o apoio psicológico, suporte nutricional, fraldas geriátricas, visitas domiciliares, cestas básicas, orientações relacionadas aos direitos do paciente com câncer além de oficinas socioeducativas que contribuem para melhorar a qualidade de vida e o bem-estar dos pacientes, proporcionando alívio e uma maior esperança de cura num momento tão difícil de luta contra o câncer.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/grupo_cuidado_2.png",
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32), // Espaço entre a imagem e o botão
              ElevatedButton(
                onPressed: () {
                  // Adicione a lógica para ação do botão "AJUDAR" aqui
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[500], // Fundo verde
                  foregroundColor: Colors.white, // Letras brancas
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("AJUDAR", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
