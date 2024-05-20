import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> pokemonData;
  
  const DetailsPage({super.key, required this.pokemonData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 60, 165),
      appBar: AppBar(
        title: const Text("Pokemon Page"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 60, 165),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(pokemonData['sprites']['front_default'], scale: 0.5,),
              Text('ID: ${pokemonData['id']}', style: TextStyle(color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.w600),),
              Text('Name: ${pokemonData['name']}', style: TextStyle(color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.w600),),
              Text('Type: ${pokemonData['types'][0]['type']['name']}', style: TextStyle(color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.w600),),
              
            ],
          ),
        ),
      ),
    );
  }
}