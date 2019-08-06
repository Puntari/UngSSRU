import 'package:flutter/material.dart';
import 'package:ung_ssru/models/product_model.dart';

class ShowDetail extends StatefulWidget {
  final ProductModel productModel;
  ShowDetail({Key key, this.productModel}) : super(key: key); //รับค่าของmodel

  @override
  _ShowDetailState createState() => _ShowDetailState();
}

///รับdata

class _ShowDetailState extends State<ShowDetail> {
  // Explicit
  ProductModel productModel;
  String name = '', detail = '', url = '';

  // Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      productModel = widget.productModel;
      name = productModel.name;
      detail = productModel.detail;
      url = productModel.url;
      print('name = $name');
    });
  }

  Widget showName() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        productModel.name,
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.purple,
        ),
      ),
    );
  }

  Widget showImage() {
    return Container(
      height: 200.0,
      child: Image.network(
        productModel.url,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget showDetail() {
    return Text(productModel.detail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แสดงรายละเอียด'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          showName(),
          showImage(),
          showDetail(),
        ],
      ),
    );
  }
}
