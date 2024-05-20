import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/pages/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nomeDoPokemon = '';
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3C5AA6),
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(
              color: Colors.yellow, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color(0xFF3C5AA6),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: controller,
                decoration: const InputDecoration(
                    hintText: "Digite o nome do Pokemon: ",
                    hintStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.yellow)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.yellow, width: 3)),
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    focusColor: Colors.black),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () async {
                  String nomeDoPokemon = controller.text.toLowerCase();
                  Dio dio = Dio();
                  Response retorno = await dio
                      .get('https://pokeapi.co/api/v2/pokemon/$nomeDoPokemon');
                  if (retorno.statusCode == 200) {
                    Map<String, dynamic> pokemonData = {
                      'id': retorno.data['id'],
                      'name': retorno.data['name'],
                      'types': retorno.data['types'],
                      'sprites': retorno.data['sprites'],
                    };
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsPage(pokemonData: pokemonData),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Erro'),
                        content: Text(
                            'Não foi possível encontrar o Pokémon $nomeDoPokemon'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                    backgroundColor: Colors.yellow),
                child: const Text(
                  'Pesquisar',
                  style: TextStyle(color: Color(0xFF3C5AA6)),
                )),
          ],
        ),
      ),
    );
  }
}
