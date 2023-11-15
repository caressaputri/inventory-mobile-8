import 'package:flutter/material.dart';
import 'package:inventory_mobile/screens/inventorylist_form.dart';
import 'package:inventory_mobile/screens/menu.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
            child: Column(
              children: [
                Text(
                  'Inventory mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("cool", style: TextStyle(color: Color.fromARGB(100, 50, 100, 3),))
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Redirection ke MyHomePage
            onTap:(){
              Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => HomePage(),)
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add item'),
            // Redirection ke InventoryPageForm
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InventoryPageForm()));
            }
          )
        ]
      )
    );
  }
}