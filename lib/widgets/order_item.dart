import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/providers/orders.dart';

class OrderItemWidget extends StatefulWidget {
  final Order order;
  OrderItemWidget(this.order);

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final itemsHeight = (widget.order.products.length * 25.0) + 10;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _expanded ? itemsHeight + 92 : 92,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
              subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date),
              ),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _expanded ? itemsHeight : 0,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              child: ListView(
                children: widget.order.products.map((product) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${product.quantity} x R\$ ${product.price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
