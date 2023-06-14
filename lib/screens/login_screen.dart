import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widget/text_field_input.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            // svg image
            SvgPicture.asset(
              'assets/logo.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(
              height: 64,
            ),
            // input for email
            TextFieldInput(
                hintText: 'email',
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 24,
            ),
            // input for password
            TextFieldInput(
              hintText: 'password',
              textEditingController: _passwordController,
              textInputType: TextInputType.visiblePassword,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            // login button
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: blueColor,
                ),
                child: const Text("Log in"),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),

            // direction for register page
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("don't have an account? ")),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("signup here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
