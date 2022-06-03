import 'package:flutter/material.dart';

class MenuExpandedWidget extends StatelessWidget {
  const MenuExpandedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Criar",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),
              ),
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: const Icon(
                  Icons.close
                )
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: (){}, 
            icon: const Icon(
              Icons.play_circle
            ), 
            label: const Text("Criar um Short")
          ),
          //Footer
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: (){}, 
            icon: const Icon(
              Icons.upload
            ), 
            label: const Text("Enviar um vídeo")
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: (){}, 
            icon: const Icon(
              Icons.tap_and_play_rounded
            ), 
            label: const Text("Transmitir ao vivo")
          ),
        ],
      ),
    );
  }
}