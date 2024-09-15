import 'package:finance/features/tela_inicial/tela_inicial.dart';
import 'package:flutter/material.dart';


class Pub1 extends StatelessWidget {
  const Pub1({Key? key}) : super(key: key);
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
                "Se Toque - Grupo de Apoio e Prevenção do Câncer",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700], // Título em verde
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
                      'Desde 2002, o Grupo Se Toque é uma organização sem fins lucrativos que se dedica à prevenção do câncer.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      'Realizam campanhas de conscientização sobre o câncer em diversos segmentos da sociedade, oferecendo'
                          ' palestras, orientações sobre o autoexame das mamas e compartilhando depoimentos de pessoas que venceram'
                          ' a doença.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/Se toque - Foto 1.png",
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Hoje, a principal missão é a CASA DE APOIO SE TOQUE, um lugar digno e '
                          'acolhedor que proporciona o máximo de conforto às pessoas em tratamento contra a doença.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      "assets/images/se_toque_imagem.png",
                      width: 400,
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
                  backgroundColor: Colors.red[700], // Fundo verde
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
