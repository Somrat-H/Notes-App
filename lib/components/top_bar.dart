
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class TopBar extends StatelessWidget {
  bool status;
  Function() onPressed;
  TopBar({super.key, required this.status, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 61, 57, 57),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: (){},
               icon: const Icon(
                Icons.menu,
                color: Colors.white,)),
              SizedBox(
                height: 45,
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Your Notes',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )
                  ),
                ),
              ),
              IconButton(onPressed: onPressed, icon: status == false ? const Icon(Icons.list,
              color: Colors.white,
              ): const Icon(Icons.grid_view,
              color: Colors.white,
              )),
              const CircleAvatar(
                backgroundImage: AssetImage('image/avatar.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}