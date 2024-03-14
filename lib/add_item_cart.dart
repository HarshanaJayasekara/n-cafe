import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ItemDetailsPage extends StatefulWidget {
  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  String _itemName = '';
  double _itemPrice = 0.0;
  double _itemRate = 0.0;
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _image == null
                ? Placeholder(
                    fallbackWidth: 200,
                    fallbackHeight: 200,
                  )
                : Image.file(
                    _image!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: getImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Item Name'),
              onChanged: (value) {
                setState(() {
                  _itemName = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _itemPrice = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Rate'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _itemRate = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailsPage(
                        /*  itemName: _itemName,
                       _itemName= itemName,
                      itemPrice: _itemPrice,
                      itemRate: _itemRate,
                      image: _image,*/
                        ),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Your cart page body content goes here'),
      ),
    );
  }
}
