// ignore: file_names
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(
        onPressed: (){
          query = "";
        }, 
        icon: const Icon(Icons.clear)
      ), 
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
  
    return IconButton(
      onPressed: (){
        close(context, "");
      }, 
      icon: const Icon(Icons.arrow_back_ios_new_rounded)
    );  
  }

  @override
  Widget buildResults(BuildContext context) {
    //debugPrint("Resultado: pesquisa realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //debugPrint("Resultado: digitado " + query);
    late List<String> lista;

    if(query.isNotEmpty){
      lista = [
        "Android",
        "Android Navegação",
        "IOS",
        "Jogos"
      ];

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(lista[index]),
          );
        }
      );
    }else{
      return const Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }
  }

}