import 'package:ecommerce/components/cart_item.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, con, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Checkout'),
          ),
          body: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: con.itemCount,
                  itemBuilder: (context, index) {
                    return CartItem(
                      product: con.carts[index],
                      ondelete: () => con.removeItem(con.carts[index]),
                    );
                  },
                ),
              ),
              Container(
                color: Colors.blue[200],
                height: 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text('x ${con.itemCount}'),
                    Spacer(),
                    Text('Total : ${con.getTotalPrice()}'),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        con.itemClear();
                      },
                      child: Text('Pay'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
