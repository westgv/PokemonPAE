import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
      appBar: AppBar(
        title: const Text('Home Page',style: TextStyle(
          color: Colors.yellow,
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(),


            ElevatedButton(onPressed: () async{
              Dio dio = Dio();
              Response retorno =
                  await dio.get('https://pokeapi.co/api/v2/pokemon/ditto');
              setState(() {
                nomeDoPokemon = retorno.data['name'];
              });
              print(retorno.data('abilities'));
            },
             child: const Text('Clique aqui vai')),
          ],
        ),
      ),
    );
  }
}

