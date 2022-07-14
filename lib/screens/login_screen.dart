import 'package:fl_tips/bloc/authorisation/auth_bloc.dart';
import 'package:fl_tips/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController.text = "barry.allen@example.com";
    _passwordController.text = "SuperSecretPassword!";
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onLoginSubmit() async {
    BlocProvider.of<AuthorisationBloc>(context).add(AuthorisationEvent(
        email: _emailController.text, password: _passwordController.text));
  }

  void onRegisterNavigate() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  void togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void showToast(String error) {
    SnackBar snackBar =
        SnackBar(backgroundColor: Colors.red, content: Text(error));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: BlocListener<AuthorisationBloc, AuthorisationState>(
          listener: (BuildContext context, state) {
            if (state is AuthorisationError) {
              showToast(state.error);
            }
          },
          child: BlocBuilder<AuthorisationBloc, AuthorisationState>(
            builder: (BuildContext context, state) {
              if (state is AuthorisationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.email_outlined),
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: togglePasswordVisibility,
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          border: const OutlineInputBorder(),
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onLoginSubmit,
                              child: const Text('Login'),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: onRegisterNavigate,
                          child: const Text('or Register')),
                      const SizedBox(height: 40),
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }
}
