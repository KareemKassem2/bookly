import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Credential Class
class Credentials {
  Credentials(this.username, this.password);
  final String username;
  final String password;
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({required this.onLogIn, super.key});

  /// Called when users sign in with [Credentials].
  final ValueChanged<Credentials> onLogIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 700) {
            // Display Desktop View
            return Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/images/intro-1660552487.webp',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.70,
                    child: LoginForm(onLogIn: onLogIn),
                  ),
                ),
              ],
            );
          } else {
            // Display Mobile View
            return Column(
              children: [
                Expanded(
                  child: LoginForm(onLogIn: onLogIn),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({required this.onLogIn, super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueChanged<Credentials> onLogIn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Logo.png',
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: 'Username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(
                AppRouter.kHomePage,
              );
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
