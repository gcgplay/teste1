import 'package:finance/features/tela_inicial/tela_inicial.dart';
import 'package:flutter/material.dart';


class Pub2 extends StatelessWidget {
  const Pub2({Key? key}) : super(key: key);

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
                "Sociedade São Vicente de Paulo",
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
                      "Comunidade Bom Pastor",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900], // Título em vermelho vinho
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Borda cinza
                        borderRadius: BorderRadius.circular(
                            8), // Cantos arredondados
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
                            'Foi criada em 23 de abril de 1833, em Paris, na França, por um grupo de 6 jovens universitários católicos e um'
                                ' senhor mais velho, com o objetivo de aliviar o sofrimento das pessoas vulneráveis e fortalecer a fé de'
                                ' seus membros.',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Uma grande rede de Caridade, formada pelos voluntários, que se reúnem em Conferências. Elas são grupos que se'
                                ' reúnem em paróquias, escolas, residências e têm como objetivo organizar o serviço prestado por seus membros '
                                'às famílias favorecidas.',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 16),
                          Container(
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              // Cor de fundo cinza claro
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.grey), // Borda cinza
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Banco Bradesco",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text("Agência: 1791-4"),
                                Text("Conta Corrente: 031550-8"),
                                Text("CNPJ: 34.127.563/0001-67"),
                                Text("Conselho Nacional SSVP"),
                              ],
                            ),
                          ),
                          SizedBox(height: 32),
                          // Espaço entre a imagem e o botão
                          ElevatedButton(
                            onPressed: () {
                              // Adicione a lógica para ação do botão "AJUDAR" aqui
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[500], // Fundo verde
                              foregroundColor: Colors.white, // Letras brancas
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "AJUDAR",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}