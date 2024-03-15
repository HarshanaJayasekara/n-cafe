import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_text_fields/material_text_fields.dart';

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
          backgroundColor: Color.fromARGB(255, 123, 202, 164),
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 100),
              child: Text(
                'Cafe',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: IconButton(
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
                icon: Icon(
                  Icons.add_box_outlined,
                  size: 30,
                ),
                tooltip: 'Add Item',
              ),
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
        body: Container(
          color: Colors.green[100],
          child: ListView.builder(
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
      ),
    );
  }
}

//! ------------------  insert data  /    add item screen-----------------------
class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  late File _imageFile; // Variable to store the selected image file

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  final TextEditingController _foodNameController = TextEditingController();
  final TextEditingController _foodPriceController = TextEditingController();
  final TextEditingController _descountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imageFile = File(""); // Initialize with an empty image file
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 123, 202, 164),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 40),
            child: Text(
              'Admin',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.green[100],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Add items",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),

              //! image insert **********

              Row(
                children: [
                  ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 4,
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: Text(
                        _imageFile != null ? 'Change Image' : 'Pick Image',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  /*  Image.file(
                    _imageFile,
                    width: 100,
                    height: 100,
                  ),*/
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 4,
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: Text(
                        _imageFile != null ? 'Change Image' : 'Pick Image',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  /* _imageFile != null
                      ? Image.file(
                          _imageFile,
                          width: 100,
                          height: 100,
                        )
                      : SizedBox(),*/
                ],
              ),
              SizedBox(height: 20),

              //! input text feild container  *******************

              Container(
                child: Column(
                  children: [
                    MaterialTextField(
                      controller: _foodNameController,
                      hint: "Food Name",
                      labelText: "Food Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                    SizedBox(height: 16.0),
                    MaterialTextField(
                      controller: _foodPriceController,
                      hint: "Food Price",
                      labelText: "Food Price",
                      prefixIcon: Icon(Icons.price_change),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                    SizedBox(height: 16.0),
                    MaterialTextField(
                      controller: _descountController,
                      hint: "Descount",
                      labelText: "Descount",
                      prefixIcon: Icon(Icons.discount_rounded),
                    ),
                    SizedBox(height: 16.0),
                    MaterialTextField(
                      controller: _descriptionController,
                      hint: "Description",
                      labelText: "Description",
                      prefixIcon: Icon(Icons.description),
                    ),
                    SizedBox(height: 16.0),
                    MaterialTextField(
                      controller: _imageUrlController,
                      hint: "Upload Images",
                      labelText: "Upload Images",
                      prefixIcon: Icon(Icons.image),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              //! add item Button -------
              Container(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      //! Add item button
                      ElevatedButton(
                        onPressed: () {
                          CartItem newItem = CartItem(
                            foodName: _foodNameController.text,
                            foodPrice: double.parse(_foodPriceController.text),
                            descount: _descountController.text,
                            description: _descriptionController.text,
                            imageUrl: _imageUrlController.text,
                          );

                          AwesomeDialog(
                            context: context,
                            animType: AnimType.bottomSlide,
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
                          backgroundColor: Colors.greenAccent[700],
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 110,
                            right: 110,
                          ),
                        ),
                        child: const Text(
                          'Add Item',
                          style: TextStyle(
                            color: Color.fromARGB(255, 51, 51, 51),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String foodName;
  final double foodPrice;
  final String descount;
  final String description;
  final String imageUrl;

  CartItem({
    required this.foodName,
    required this.foodPrice,
    required this.descount,
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
  late TextEditingController _descountController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;
  bool status = false;

  @override
  void initState() {
    super.initState();
    _foodNameController = TextEditingController(text: widget.cartItem.foodName);
    _foodPriceController =
        TextEditingController(text: widget.cartItem.foodPrice.toString());
    _descountController = TextEditingController(text: widget.cartItem.descount);
    _descriptionController =
        TextEditingController(text: widget.cartItem.description);
    _imageUrlController = TextEditingController(text: widget.cartItem.imageUrl);
  }

  @override
  void dispose() {
    _foodNameController.dispose();
    _foodPriceController.dispose();
    _descountController.dispose();
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
                                widget.cartItem,
                                widget.onUpdate,
                                widget.onDelete,
                              ),
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

//! +++++++++++++++++++++++++  Item Update Screen.dart  ++++++++++++++++++++++++++++++++++++++++++++++++

class ItemUpdateScreen extends StatefulWidget {
  final CartItem cartItem;
  final Function(CartItem)? onUpdate; // Make onUpdate function nullable
  final VoidCallback onDelete; // Add onDelete callback

  ItemUpdateScreen(this.cartItem, this.onUpdate, this.onDelete);

  @override
  _ItemUpdateScreenState createState() => _ItemUpdateScreenState();
}

class _ItemUpdateScreenState extends State<ItemUpdateScreen> {
  late TextEditingController _foodNameController;
  late TextEditingController _foodPriceController;
  late TextEditingController _descountController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _foodNameController = TextEditingController(text: widget.cartItem.foodName);
    _foodPriceController =
        TextEditingController(text: widget.cartItem.foodPrice.toString());
    _descountController = TextEditingController(text: widget.cartItem.descount);
    _descriptionController =
        TextEditingController(text: widget.cartItem.description);
    _imageUrlController = TextEditingController(text: widget.cartItem.imageUrl);
  }

  @override
  void dispose() {
    _foodNameController.dispose();
    _foodPriceController.dispose();
    _descriptionController.dispose();
    _descountController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 123, 202, 164),
        title: const Center(
          child: Text(
            'Update Item',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.green[100],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! update Image ***********
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(164, 114, 192, 154),
                    ),

                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.add_a_photo,
                        size: 100,
                      ),
                    ),
                    // child: Image.network(
                    //   widget.cartItem.imageUrl,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(164, 114, 192, 154),
                    ),

                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.add_a_photo,
                        size: 100,
                      ),
                    ),
                    // child: Image.network(
                    //   widget.cartItem.imageUrl,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ],
              ),
              SizedBox(height: 25),

              //! update text feild  container ************
              Container(
                child: Column(
                  children: [
                    MaterialTextField(
                      controller: _foodNameController,
                      hint: "Food Name",
                      labelText: "Food Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                    SizedBox(height: 16.0),
                    MaterialTextField(
                      controller: _foodPriceController,
                      hint: "Food Price",
                      labelText: "Food Price",
                      prefixIcon: Icon(Icons.price_change),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                    SizedBox(height: 16.0),
                    MaterialTextField(
                      controller: _descountController,
                      hint: "Descount",
                      labelText: "Descount",
                      prefixIcon: Icon(Icons.discount_rounded),
                    ),
                    SizedBox(height: 16.0),
                    MaterialTextField(
                      controller: _descriptionController,
                      hint: "Description",
                      labelText: "Description",
                      prefixIcon: Icon(Icons.description),
                    ),
                    SizedBox(height: 16.0),
                    MaterialTextField(
                      controller: _imageUrlController,
                      hint: "Upload Images",
                      labelText: "Upload Images",
                      prefixIcon: Icon(Icons.image),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      //! Update Button ***************

                      ElevatedButton(
                        onPressed: () {
                          CartItem updatedItem = CartItem(
                            foodName: _foodNameController.text,
                            foodPrice: double.parse(_foodPriceController.text),
                            descount: _descountController.text,
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
                            animType: AnimType.bottomSlide,
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent[700],
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 110,
                            right: 110,
                          ),
                        ),
                        child: const Text(
                          'Update Item',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: 25),
                      //! delete Button **************

                      ElevatedButton(
                        onPressed: () {
                          CartItem newItem = CartItem(
                            foodName: _foodNameController.text,
                            foodPrice: double.parse(_foodPriceController.text),
                            descount: _descountController.text,
                            description: _descriptionController.text,
                            imageUrl: _imageUrlController.text,
                          );
                          widget.onDelete();

                          AwesomeDialog(
                            context: context,
                            animType: AnimType.bottomSlide,
                            headerAnimationLoop: false,
                            dialogType: DialogType.question,
                            btnCancelColor: Colors.red,
                            showCloseIcon: true,
                            title: 'DELETED',
                            desc: 'Are You Sure',
                            btnOkOnPress: () {
                              Navigator.pop(context, newItem);
                              debugPrint('Card is Deleted');
                            },
                            btnOkIcon: Icons.delete_rounded,
                            onDismissCallback: (type) {
                              debugPrint('Dialog Dismiss from callback $type');
                            },
                          ).show();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent[700],
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 110,
                            right: 110,
                          ),
                        ),
                        child: const Text(
                          'Delete Item',
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
      ),
    );
  }
}

//! bottom Navigation Bar
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    // CartScreen(),
    // SearchScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
