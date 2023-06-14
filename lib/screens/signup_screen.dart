import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widget/text_field_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    _bioController.dispose();
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
              flex: 2,
              child: Container(),
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
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1686686200559-3b58bd444f86?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                  // backgroundColor: ,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            // input for name
            TextFieldInput(
                hintText: 'username',
                textEditingController: _userNameController,
                textInputType: TextInputType.text),
            const SizedBox(
              height: 24,
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
            // input for bio
            TextFieldInput(
                hintText: 'write about you',
                textEditingController: _bioController,
                textInputType: TextInputType.text),
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
                    child: const Text("already have an account? ")),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("login here",
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
