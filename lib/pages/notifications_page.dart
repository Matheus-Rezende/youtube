import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  final items = List<String>.generate(20, (i) => 'Notificação ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notificações"),
      ),
      body: items.isNotEmpty ? 
        ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          final item = items[index];
          return Card(
            child: Dismissible(
              key: Key(item),
              behavior: HitTestBehavior.translucent,
              movementDuration: const Duration(microseconds: 50),
              background: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.only(right: 30),
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
                ScaffoldMessenger.of(context)
                  .showSnackBar(
                  SnackBar(
                    content: Text(
                      "Notificação $item removida",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16
                      ),
                      )
                    )
                  );
              }, 
              child: ListTile(
                title: Text(item),
              )
            )
          );
        }
      ) : const Center(
        child: Text("Não há mais notificações"),
      )
    );
  }
}