import 'package:flutter/material.dart';
import 'package:inventory_mobile/widgets/left_drawer.dart';

class Items {
  final String name;
  final IconData icon;
  final Color color;

  Items(this.name, this.icon, this.color);
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Items> items = [
    Items("View Item", Icons.inventory_2_sharp, Colors.blue),
    Items("Add Item", Icons.add_circle_outline, Colors.green),
    Items("Log Out", Icons.login_outlined, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory Mobile"),
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Inventory Mobile",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((Items item) {
                  return CardItems(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItems extends StatelessWidget {
  final Items item;

  const CardItems(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("Button ${item.name} clicked")));
        },
        child: Container(
          padding: const EdgeInsets.all(7),
          color: item.color,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.grey,
                  size: 28,
                ),
                const Padding(padding: EdgeInsets.all(2)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
