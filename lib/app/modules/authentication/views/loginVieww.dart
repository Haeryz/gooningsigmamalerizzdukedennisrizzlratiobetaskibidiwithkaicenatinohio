import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:gooningsigmamalerizzdukedennisrizzlratiobetaskibidiwithkaicenatinohio/app/routes/app_pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticationController _authController = Get.put(AuthenticationController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            Obx(() {
              return ElevatedButton(
                onPressed: _authController.isLoading.value
                    ? null
                    : () {
                        _authController.loginUser(
                          _emailController.text,
                          _passwordController.text,
                        );
                        Get.toNamed(Routes.TASK);
                      },
                child: _authController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Login'),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              Get.toNamed(Routes.AUTHENTICATION);
            }, child: Text("mewing"))
          ],
        ),
      ),
    );
  }
}
