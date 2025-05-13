import 'package:flutter/material.dart';
import 'package:flutter_app_teste/menu.dart';

class AppTeste extends StatefulWidget {
  const AppTeste({super.key});

  @override
  State<AppTeste> createState() => _AppTesteState();
}

final TextEditingController loginUser = TextEditingController();
final TextEditingController senhaUser = TextEditingController();

final String username = "tiago";
final String password = "123";

validarUser(String login, String senha) {
  if (login != username || senha != password) {
    return false;
  } else {
    return true;
  }
}

class _AppTesteState extends State<AppTeste> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // esse é o painel do login
      decoration: BoxDecoration(
        // uso para colocar o backgroud
        color: const Color(0xFF017092),
        image: DecorationImage(
          image: NetworkImage(
            //image backgroud
            'https://images.unsplash.com/photo-1557683316-973673baf926?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29sb3IlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Container(
              //container de login
              padding: EdgeInsets.all(10),
              width: 500,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFFFFFFF),
              ),
              child: Column(
                children: [
                  Text("Login"), // begin login
                  TextFormField(
                    controller: loginUser,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      enabledBorder: OutlineInputBorder(
                        gapPadding: double.minPositive,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ), // end login
                  SizedBox(height: 28),
                  Center(
                    child: Text(
                      "Senha",
                      style: TextStyle(fontFamily: "Montserrat"),
                    ),
                  ), // begin senha
                  TextFormField(
                    controller: senhaUser,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      enabledBorder: OutlineInputBorder(
                        gapPadding: double.minPositive,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ), // end senha
                  SizedBox(height: 60), // butão login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.account_circle),
                        label: Text("Registrar conta"),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          // ignore: avoid_print
                          print(validarUser(loginUser.text, senhaUser.text));

                          if (validarUser(loginUser.text, senhaUser.text) ==
                              true) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Menu(),
                              ),
                            );
                          } else {
                            // ignore: avoid_print
                            print("Usuario não encontrado");
                          }
                        },
                        icon: Icon(Icons.arrow_forward),
                        label: Text("Entrar"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
