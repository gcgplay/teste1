import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart'; // Biblioteca para formatação de campos
import 'package:finance/common/constants/app_colors.dart';
import 'package:finance/features/onboarding/onboarding_page.dart'; // Importe a página de Onboarding

class PaginaCadastro extends StatelessWidget {
  const PaginaCadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: const RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // Controladores de texto
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Chave para o formulário para validação
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(); // Inicializa o Firebase
  }

  // Método para cadastrar usuário e redirecionar para Onboarding
  Future<void> _register() async {
    try {
      // Cria usuário no Firebase Auth (e-mail e senha)
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Redireciona para a OnboardingPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    } catch (e) {
      // Exibe mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            child: const Text(
              'Cadastro de Usuário',
              style: TextStyle(
                color: AppColors.dourado,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
          // Formulário de Cadastro
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Campo de Nome
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Campo de E-mail
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Campo de Senha
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Campo de Telefone
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: phoneController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefone',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: '(XX) X XXXX-XXXX',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                  ),
                ),
                // Botão de Cadastro
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    onPressed: _register, // Aciona o método de cadastro
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(color: AppColors.dourado),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
