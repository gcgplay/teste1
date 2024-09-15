import 'package:finance/common/constants/app_colors.dart';
import 'package:finance/common/constants/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:finance/features/cadastro/pagina_cadastro.dart';
import 'package:finance/features/tela_login/tela_login.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50.0),
            Expanded(
              flex: 0,
              child: Container(
                color: AppColors.white,
                child: Image.asset(
                  'assets/images/Ajude fundo.png',
                  height: 200, // Defina a altura máxima desejada
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              '“Juntos, transformamos solidariedade em esperança.”',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.dourado,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.dourado,
                minimumSize: Size(140, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ).copyWith(
                overlayColor: MaterialStateProperty.all(AppColors.white.withOpacity(0.5)),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TelaLogin(), // Substitua pelo nome correto da sua classe de tela inicial
                  ),
                );
              },
              child: Text(
                'Entrar',
                style: AppTextStyles.mediumText.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Já possui conta? ',
                  style: AppTextStyles.smallTextBlack.copyWith(),
                  children: [
                    TextSpan(
                      text: 'Cadastre-se',
                      style: AppTextStyles.smallText.copyWith(color: AppColors.dourado),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PaginaCadastro(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
