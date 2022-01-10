import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        //...
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'SalEasy!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            'Product',
            Icons.production_quantity_limits,
          ),
          buildListTile(
            'Employee',
            Icons.emoji_people_outlined,
          ),
          buildListTile(
            'Self Lead ',
            Icons.self_improvement
          ),
          buildListTile(
            'Self Task',
            Icons.task_outlined,
          ),
          buildListTile(
            'Company Task',
            Icons.task_rounded,
          ),
          buildListTile(
            'Target',
            Icons.text_rotation_angleup_outlined
          ),
          buildListTile(
            'profile',
            Icons.info
          ),
          buildListTile(
            'Setting',
            Icons.settings
          ),
          buildListTile(
            'LogOut',
            Icons.logout
          ),
        ],
      ),
    );
  }
}
