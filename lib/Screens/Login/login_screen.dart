
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Screens/login/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey key = GlobalKey();
  double cardHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(getCardHeight);
  }

  void getCardHeight(_) {
    final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    setState(() {
      cardHeight = renderBox.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("get the card height ::: $cardHeight");
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: GetBuilder<LoginController>(
        builder: (value) => SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double containerWidth =
                        constraints.maxWidth > 600 ? 600 : constraints.maxWidth * 0.9;

                    if (constraints.maxWidth <= 600) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            // const SizedBox(height: 50),
                            // Center(
                            //   child: FlutterLogo(
                            //     size: constraints.maxWidth * 0.4,
                            //   ),
                            // ),
                            const SizedBox(height: 20),
                            Text(
                              'Absolin',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const SizedBox(height: 20),
                            buildLoginForm(context),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width >= 600 ? 400 : 500,
                              child: buildLoginForm(context),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Wrap(
      children: [
        Container(
          key: key,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.primary,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: MaterialButton(
                        onPressed: () {
                          // if (formKey.currentState!.validate()) {
                          //   controller.userLogin();
                          // }
                          print("Button pressed, form validation starting...");
                              if (formKey.currentState!.validate()) {
                                print("Form is valid, calling userLogin...");
                                controller.userLogin();
                              } else {
                                print("Form is invalid, skipping userLogin call.");
                              }
                          // Get.toNamed(Routes.dashboardView);
                        },
                        height: 45,
                        color: Theme.of(context).colorScheme.primary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Center(
                          child: Text(
                            "Login In",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Sign in with your Username and Password",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CommonComponents.defaultTextField(
                          context,
                          title: 'Username',
                          hintText: 'Enter Username',
                          controller: controller.usernameController,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9" "]'))],
                          validator: (String? val) {
                            if (val == '') {
                              return 'Please enter a valid username';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onChange: (val) {},
                        ),
                        const SizedBox(height: 20),
                        CommonComponents.defaultTextField(
                          context,
                          title: 'Password',
                          hintText: 'Enter Password',
                          obscureText: controller.obscureText,
                          controller: controller.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          validator: (String? val) {
                            if (val == '' || val!.length < 3) {
                              return 'Please enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          onChange: (val) {},
                          suffixIcon: IconButton(
                            color: Colors.grey,
                            icon: Icon(
                              controller.obscureText ? Icons.visibility_off : Icons.visibility,
                            ),
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              setState(() {
                                controller.obscureText = !controller.obscureText;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
