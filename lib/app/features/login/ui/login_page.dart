import 'package:flutter/material.dart';
import 'package:flutter_value_notifier/flutter_value_notifier.dart';
import 'package:poke_teste/app/features/login/interactor/login_entity.dart';
import 'package:poke_teste/app/features/login/interactor/login_interceptor.dart';
import 'package:poke_teste/app/style/poke_teste_icons.dart';
import 'package:poke_teste/app/widgets/button/button.dart';
import 'package:poke_teste/app/widgets/input/email_input.dart';
import 'package:poke_teste/app/widgets/input/password_input.dart';

class LoginPage extends StatefulWidget {
  final Logininteractor loginInterceptor;
  const LoginPage({super.key, required this.loginInterceptor});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    widget.loginInterceptor.verifyLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF173EA5),
        body: ValueNotifierBuilder<Logininteractor, LoginEntity>(
            builder: (context, value) {
          return AnimatedContainer(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
            duration: const Duration(milliseconds: 1000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Poke_testeIcon(
                  icon: Poke_testeIconsEnum.pokedex,
                  width: 202,
                  height: 68,
                ),
                const SizedBox(
                  height: 12,
                ),
                EmailInput(
                  textEditingController: value.emailController,
                  placeholder: 'Digite seu e-mail',
                  onChange: (text) {
                    context.read<Logininteractor>().setEmail(text);
                  },
                  onSubmit: () {},
                ),
                const SizedBox(
                  height: 12,
                ),
                PasswordInput(
                  textEditingController: value.passwordController,
                  placeholder: 'Qual sua senha?',
                  obscureText: false,
                  onChange: (text) {
                    context.read<Logininteractor>().setPassword(text);
                  },
                  onSubmit: () {},
                ),
                const SizedBox(
                  height: 12,
                ),
                Poke_testeButton(
                  text: 'Entrar',
                  color: ButtonColorEnum.red,
                  onPress: () {
                    context.read<Logininteractor>().login();
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
