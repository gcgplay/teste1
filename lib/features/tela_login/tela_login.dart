import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finance/features/tela_inicial/tela_inicial.dart'; // Importe a página TelaInicial

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  // Controladores de texto para email e senha
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Chave para o formulário para validação
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Método para autenticar o usuário no Firebase
  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return; // Se o formulário não for válido, não faz nada
    }

    try {
      // Autentica o usuário com e-mail e senha no Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Se a autenticação for bem-sucedida, redireciona para a TelaInicial
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TelaInicial()),
      );
    } on FirebaseAuthException catch (e) {
      // Exibe uma mensagem de erro dependendo do código do erro
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'Usuário não encontrado';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Senha incorreta';
      } else {
        errorMessage = 'Erro: ${e.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  // Método para enviar e-mail de redefinição de senha
  Future<void> _sendPasswordResetEmail() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira seu e-mail')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail de redefinição enviado')),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: <Widget>[
            // Título da página
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(50),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            // Formulário de Login
            Form(
              key: _formKey,
              child: Column(
                children: [
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu e-mail';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira sua senha';
                        }
                        return null;
                      },
                    ),
                  ),
                  // Botão de Login
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      onPressed: _login, // Aciona o método de login
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  // Link para "Esqueceu a senha"
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: TextButton(
                      onPressed: () {
                        _showForgotPasswordDialog();
                      },
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para mostrar o diálogo de redefinição de senha
  void _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Redefinir Senha'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Insira seu e-mail para receber um link de redefinição de senha.'),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
                _sendPasswordResetEmail(); // Envia o e-mail de redefinição de senha
              },
              child: const Text('Enviar'),
            ),
          ],
        );
      },
    );
  }
}

