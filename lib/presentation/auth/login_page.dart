import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:money_bag/presentation/auth/registration_page.dart';
import 'package:money_bag/presentation/auth/util/validator_rules.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final showPassword = useState(false);
    final formkey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 200, bottom: 40),
                child: Text('Log In', style: TextStyle(fontSize: 25)),
              ),
              TextFormField(
                controller: emailController,
                validator: ValidatorRules.email,
                decoration: const InputDecoration(
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                validator: ValidatorRules.password,
                obscureText: !showPassword.value,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffix: InkWell(
                      onTap: () {
                        showPassword.value = !showPassword.value;
                      },
                      child: showPassword.value
                          ? const Icon(
                              CupertinoIcons.eye,
                              color: Colors.deepPurple,
                            )
                          : const Icon(
                              CupertinoIcons.eye_fill,
                              color: Colors.grey,
                            )),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.deepPurple,
                  )),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.deepPurple,
                  )),
                ),
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  formkey.currentState?.validate();
                },
                child: const Text("Log In"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegistrationPage()));
                  },
                  child: Text("SignUp"))
            ]),
      ),
    );
  }
}
