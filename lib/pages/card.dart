import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isFavorite = false;
  List<CartItem> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cafe',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddItemScreen()),
                ).then((newItem) {
                  if (newItem != null) {
                    setState(() {
                      _cartItems.add(newItem);
                    });
                  }
                });
              },
              icon: Icon(Icons.add),
              tooltip: 'Add Item',
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Row(
                          children: [
                            CircleAvatar(
                                radius: 18,
                                backgroundImage: AssetImage("assets/1.jpg")),
                            SizedBox(width: 10),
                            Text(
                              "n-Cafe ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.pinkAccent : Colors.grey,
                        ),
                        tooltip: 'Favorite',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: _cartItems.length,
          itemBuilder: (context, index) {
            return CartItemWidget(
              _cartItems[index],
              () {
                setState(() {
                  _cartItems.removeAt(index);
                });
              },
              (updatedItem) {
                setState(() {
                  _cartItems[index] = updatedItem;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

//! ------------------  insert data  -----------------------
class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController _foodNameController = TextEditingController();
  final TextEditingController _foodPriceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _foodNameController,
              decoration: InputDecoration(labelText: 'Food Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _foodPriceController,
              decoration: InputDecoration(labelText: 'Food Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Upload Images'),
            ),
            SizedBox(height: 16.0),
            //! add item Button -------
            Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        CartItem newItem = CartItem(
                          foodName: _foodNameController.text,
                          foodPrice: double.parse(_foodPriceController.text),
                          description: _descriptionController.text,
                          imageUrl: _imageUrlController.text,
                        );

                        AwesomeDialog(
                          context: context,
                          animType: AnimType.leftSlide,
                          headerAnimationLoop: false,
                          dialogType: DialogType.success,
                          showCloseIcon: true,
                          title: 'Successfully',
                          desc: 'Add to Cart',
                          btnOkOnPress: () {
                            Navigator.pop(context, newItem);
                            debugPrint('Add to Cart');
                          },
                          btnOkIcon: Icons.check_circle,
                          onDismissCallback: (type) {
                            debugPrint('Dialog Dismiss from callback $type');
                          },
                        ).show();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        padding: EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 100,
                          right: 100,
                        ),
                      ),
                      child: Text(
                        'Add Item',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String foodName;
  final double foodPrice;
  final String description;
  final String imageUrl;

  CartItem({
    required this.foodName,
    required this.foodPrice,
    required this.description,
    required this.imageUrl,
  });
}

//! --------------  Display Card   -------------------------

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;
  final VoidCallback onDelete;
  final Function(CartItem) onUpdate;

  const CartItemWidget(this.cartItem, this.onDelete, this.onUpdate);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late TextEditingController _foodNameController;
  late TextEditingController _foodPriceController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;
  bool status = false;

  @override
  void initState() {
    super.initState();
    _foodNameController = TextEditingController(text: widget.cartItem.foodName);
    _foodPriceController =
        TextEditingController(text: widget.cartItem.foodPrice.toString());
    _descriptionController =
        TextEditingController(text: widget.cartItem.description);
    _imageUrlController = TextEditingController(text: widget.cartItem.imageUrl);
  }

  @override
  void dispose() {
    _foodNameController.dispose();
    _foodPriceController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              width: 100,
              child: Image.network(
                widget.cartItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(widget.cartItem.foodName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rs.${widget.cartItem.foodPrice.toStringAsFixed(2)}',
                ),
                Text(widget.cartItem.description),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemUpdateScreen(
                                  widget.cartItem, widget.onUpdate),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    FlutterSwitch(
                      width: 62,
                      height: 25.0,
                      valueFontSize: 0,
                      toggleSize: 30.0,
                      value: status,
                      borderRadius: 45.0,
                      padding: 2.0,
                      showOnOff: true,
                      activeColor: Colors.green.shade800,
                      inactiveColor: Colors.red.shade900,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//! +++++++++++++++++++++++++  ItemUpdateScreen.dart  ++++++++++++++++++++++++++++++++++++++++++++++++

class ItemUpdateScreen extends StatefulWidget {
  final CartItem cartItem;
  final Function(CartItem)? onUpdate; // Make onUpdate function nullable

  ItemUpdateScreen(this.cartItem, this.onUpdate);

  @override
  _ItemUpdateScreenState createState() => _ItemUpdateScreenState();
}

class _ItemUpdateScreenState extends State<ItemUpdateScreen> {
  late TextEditingController _foodNameController;
  late TextEditingController _foodPriceController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _foodNameController = TextEditingController(text: widget.cartItem.foodName);
    _foodPriceController =
        TextEditingController(text: widget.cartItem.foodPrice.toString());
    _descriptionController =
        TextEditingController(text: widget.cartItem.description);
    _imageUrlController = TextEditingController(text: widget.cartItem.imageUrl);
  }

  @override
  void dispose() {
    _foodNameController.dispose();
    _foodPriceController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Item'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Handle delete action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _foodNameController,
              decoration: const InputDecoration(labelText: 'Food Name'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _foodPriceController,
              decoration: InputDecoration(labelText: 'Food Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        CartItem updatedItem = CartItem(
                          foodName: _foodNameController.text,
                          foodPrice: double.parse(_foodPriceController.text),
                          description: _descriptionController.text,
                          imageUrl: _imageUrlController.text,
                        );
                        if (widget.onUpdate != null) {
                          widget.onUpdate!(
                              updatedItem); // Invoke onUpdate if not null
                        }

                        // You can add your logic here to handle the updated item
                        AwesomeDialog(
                          context: context,
                          animType: AnimType.leftSlide,
                          headerAnimationLoop: false,
                          dialogType: DialogType.success,
                          showCloseIcon: true,
                          title: 'Success',
                          desc: 'Successfully Your Update',
                          btnOkOnPress: () {
                            Navigator.pop(context);
                            debugPrint('OnClick');
                          },
                          btnOkIcon: Icons.check_circle,
                          onDismissCallback: (type) {
                            debugPrint('Dialog Dismiss from callback $type');
                          },
                        ).show();
                      },
                      child: Text('Success Dialog'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//! ---------  Animation Button Popup Msg -----------

