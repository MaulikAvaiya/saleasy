import 'package:flutter/material.dart';
import 'package:saleasy/constant/color_config.dart';
import '../addscreens/add_product_screen.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = '/Product-screen';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConfig.primaryColor,
        title: const Text(
          'Product List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Dismissible(
        background: Container(
          color: Theme.of(context).errorColor,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text(
                'Do you want to remove the item from the cart?',
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                ),
              ],
            ),
          );
        },
        key: ValueKey(null),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: 450,
          child: Card(
            elevation: 5,
            child: ListTile(
              title: Text('product name'),
              subtitle: Text('product price'),
              trailing: InkWell(
                child: const Icon(
                  Icons.edit,
                  color: Colors.red,
                  size: 30,
                ),
                onTap: () {

                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddProductScreen.routeName);
        },
        backgroundColor: ColorConfig.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
