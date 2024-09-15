import 'package:finance/features/pub2/pub2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finance/features/pub1/pub1.dart';
import 'package:finance/features/pub3/pub3.dart';


class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final TextEditingController _searchController = TextEditingController();
  List<Article> filteredArticles = articles;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final searchKeyword = _searchController.text.toLowerCase();
    setState(() {
      filteredArticles = articles.where((article) {
        return article.title.toLowerCase().contains(searchKeyword);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/Ajude fundo.png',
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    CarouselSlider(
                      items: [
                        Image.asset('assets/images/agasalho.png'),
                        Image.asset('assets/images/doe_sangue.png'),
                      ],
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Pesquisar por Entidade',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredArticles.length,
                      itemBuilder: (context, index) {
                        final article = filteredArticles[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0), // Espaçamento nas bordas esquerda e direita
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          article.title,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          article.subtitle,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10, width: 10,),
                                    Image.asset(
                                      article.imagePath,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(height: 10, width: 10,),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (index == 0) {
                                      // Navegar para a tela Pub1 quando o botão da SSVP for pressionado
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pub1()));
                                    } else if (index == 1) {
                                      // Navegar para a tela Pub2 quando o botão do Se Toque for pressionado
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pub2()));
                                    } else if (index == 2) {
                                      // Navegar para a tela Pub3 quando o botão do Se Toque for pressionado
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pub3()));
                                    } else if (index == 3) {
                                      // Navegar para a tela Pub4 quando o botão do Se Toque for pressionado
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pub3()));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.yellow,
                                  ),
                                  child: Text('AJUDAR'),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class Article {
  final String title;
  final String subtitle;
  final String imagePath;


  Article({
    required this.title,
    required this.subtitle,
    required this.imagePath,

  });
}
//Artigos
final List<Article> articles = [
  Article(
    title: "Se Toque - Grupo de Apoio e Prevenção do Câncer",
    subtitle: "Orientar e incentivar a detecção precoce do câncer e promover o acolhimento aos pacientes oncológicos e seus familiares.",
    imagePath: "assets/images/se_toque.jpeg",
  ),
  Article(
    title: "SSVP - Bom Pastor",
    subtitle: "Em seu trabalho caritativo auxilia diariamente cerca de 30 milhões de pessoas, por meio da dedicação dos cerca de 800 mil voluntários que formam a SSVP.",
    imagePath: "assets/images/ssvp.png",
  ),
  Article(
    title: "Associação Cuidado Humano",
    subtitle: "Ajudar as pessoas com doenças terminais de uma maneira mais humana.",
    imagePath: "assets/images/cuidado_humano.jpeg",
  ),
  Article(
    title: "Associação de Amparo a Pacientes com Câncer (ASAPAC)",
    subtitle: "Atendimento ao portador de cârcer, apoiando-o durante todo o processo do seu tratamento",
    imagePath: "assets/images/asapac_logo.png",
  ),

];