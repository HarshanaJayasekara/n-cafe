import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> _cartItems = [
    CartItem(
      foodName: 'Pizza',
      foodPrice: 10.99,
      description: 'Delicious pepperoni pizza',
      imageUrl: 'https://example.com/pizza.jpg',
    ),
    CartItem(
      foodName: 'Burger',
      foodPrice: 8.99,
      description: 'Juicy beef burger with cheese',
      imageUrl: 'https://example.com/burger.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          return CartItemWidget(_cartItems[index]);
        },
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

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          cartItem.imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(cartItem.foodName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: \$${cartItem.foodPrice.toStringAsFixed(2)}'),
            Text(cartItem.description),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Add your logic here for selecting the item
          },
          child: Text('Select'),
        ),
      ),
    );
  }
}
