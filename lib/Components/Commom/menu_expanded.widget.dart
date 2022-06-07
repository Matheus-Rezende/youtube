import 'package:flutter/material.dart';

class MenuExpandedWidget extends StatelessWidget {

  final String title;
  final String submenu1;
  final String submenu2;
  final String submenu3;
  final Icon icon1;
  final Icon icon2;
  final Icon icon3;

  const MenuExpandedWidget({Key? key, required this.title, required this.submenu1, required this.submenu2, required this.submenu3, required this.icon1, required this.icon2, required this.icon3}) : super(key: key);

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
              Text(
                title,
                style: const TextStyle(
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
            icon: icon1,
            label: Text(submenu1)
          ),
          //Footer
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: (){}, 
            icon: icon2,
            label: Text(submenu2)
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: (){}, 
            icon: icon3,
            label: Text(submenu3)
          ),
        ],
      ),
    );
  }
}