import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          )
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      "assets/images/profile.jpg",
                      
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Matheus Alves"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Gerenciar sua conta do Google",
                        style: TextStyle(
                          color: Colors.blue
                        ),
                      ),
                      
                    ],
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              )
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.co_present_rounded), 
              label: const Text('Seu canal') 
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.security_rounded), 
              label: const Text('Ativar modo de navegação anônima') 
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.add_reaction), 
              label: const Text('Adicionar conta') 
            ),
            const Divider(
              color: Colors.grey,
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.workspace_premium), 
              label: const Text('Seus benefícios do Premium') 
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.attach_money_rounded), 
              label: const Text('Compras e assinaturas') 
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.timeline_outlined), 
              label: const Text('Tempo de exibição') 
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.person), 
              label: const Text('Seus dados no YouTube') 
            ),
            const Divider(
              color: Colors.grey,
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.settings), 
              label: const Text('Configurações') 
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.help), 
              label: const Text('Ajuda e feedback') 
            ),
            const Divider(
              color: Colors.grey,
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.spatial_audio), 
              label: const Text('YouTube Studio') 
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.music_note), 
              label: const Text('YouTube Music') 
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.sports_kabaddi_sharp), 
              label: const Text('YouTube Kids') 
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                "Política de privacidade • Termos de serviço",
                style: TextStyle(  
                    color: Colors.grey
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}