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
            backgroundColor: Colors.green[900],
            elevation: 0,
            centerTitle: true,
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
                color: Colors.green[900],
                height: 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'x ${con.itemCount}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      'Total : ${con.getTotalPrice()} ฿',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[200],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        con.itemClear();
                      },
                      child: Text(
                        'Pay',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900]),
                      ),
                    ),
                    SizedBox(
                      width: 20,
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
