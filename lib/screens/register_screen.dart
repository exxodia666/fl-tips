import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = false;
  bool _confirmationVisible = false;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmationController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmationController = TextEditingController();
    _emailController.text = 'test@spike.com';
    _passwordController.text = '1234567';
    _confirmationController.text = '1234567';
  }

  @override
  void dispose() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmationController = TextEditingController();
    super.dispose();
  }


  void toggleConfirmationVisibility() {
    setState(() {
      _confirmationVisible = !_confirmationVisible;
    });
  }


  void togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void onRegisterSubmit() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
      ),
      body: Container(
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
                        : Icons.visibility_off)
                ),
                border: const OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _confirmationController,
              obscureText: !_confirmationVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: toggleConfirmationVisibility,
                    icon: Icon(_confirmationVisible
                        ? Icons.visibility
                        : Icons.visibility_off)
                ),
                border: const OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: onRegisterSubmit,
                      child: const Text('Register')),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],

        ),
      ),
    );
  }
}
