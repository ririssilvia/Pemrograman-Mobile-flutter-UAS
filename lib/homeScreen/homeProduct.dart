import 'package:flutter/material.dart';
import 'package:crud/mainNavDrawer.dart';


class ListViewProduct extends StatefulWidget {
  @override
  _ListViewProductState createState() => _ListViewProductState();
}


class _ListViewProductState extends State<ListViewProduct> {


 

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        appBar: AppBar(
          title: Text('Products List'),
          //centerTitle: true,
          backgroundColor: Colors.indigo[900], 
              leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
                   
        
        body: Center(
          child: ListView.builder(
             // itemCount: items.length,
              padding: EdgeInsets.only(top: 3.0),
              itemBuilder: (context, position) {
                // var iconButton = IconButton(
                //                 icon: Icon(
                //                   Icons.remove_red_eye,
                //                   color: Colors.blueAccent,
                //                 ),
                //                 onPressed: () =>
                //                     _navigateToProduct(context, items[position]),
                //                     );
                return Column(
                  children: <Widget>[
                    Divider(
                      height: 1.0,
                    ),                    
                    Container(
                      padding: new EdgeInsets.all(3.0),
                      child: Card(                      
                        child: Row(
                          children: <Widget>[
                            //nuevo imagen
                            //  new Container( 
                            //   padding: new EdgeInsets.all(5.0),                          
                            //   child: '${items[position].productImage}' == ''
                            //       ? Text('No image')
                            //       : Image.network(
                            //           '${items[position].productImage}' +
                            //               '?alt=media',
                            //               fit: BoxFit.fill,
                            //           height: 57.0,
                            //           width: 57.0,
                            //         ),
                            // ),
                            Expanded(
                              child: ListTile(
                                  // title: Text(
                                  //   '${items[position].name}',
                                  //   style: TextStyle(
                                  //     color: Colors.blueAccent,
                                  //     fontSize: 21.0,
                                  //   ),
                                  // ),
                                  // subtitle: Text(
                                  //   '${items[position].description}',
                                  //   style: TextStyle(
                                  //     color: Colors.blueGrey,
                                  //     fontSize: 21.0,
                                  //   ),
                                  // ),
                                  // onTap: () => _navigateToProductInformation(
                                  //     context, items[position]),
                                      ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () => _showDialog(context, position),
                                ),
                                
                            //onPressed: () => _deleteProduct(context, items[position],position)),
                            //iconButton,
                          ],
                        ),
                        color: Colors.white,
                      ),
                      
                    ),
                    
                  ],
                  
                );
                
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.indigo[700],
           onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                           // builder: (context) => FormProductScreen(),
                          ));
                    },
        ),
        //drawer: MainNavDrawer(),
      );
    
  }

  //nuevo para que pregunte antes de eliminar un registro
  void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            // IconButton(
            //     icon: Icon(
            //       Icons.delete,
            //       color: Colors.purple,
            //     ),
            //     onPressed: () =>
            //       _deleteProduct(context, items[position], position,),                                        
            //         ),                   
            new FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // void _onProductAdded(Event event) {
  //   setState(() {
  //     items.add(new Product.fromSnapShot(event.snapshot));
  //   });
  // }

  // void _onProductUpdate(Event event) {
  //   var oldProductValue =
  //       items.singleWhere((product) => product.id == event.snapshot.key);
  //   setState(() {
  //     items[items.indexOf(oldProductValue)] =
  //         new Product.fromSnapShot(event.snapshot);
  //   });
  // }

  // void _deleteProduct(
  //     BuildContext context, Product product, int position) async {
  //   await productReference.child(product.id).remove().then((_) {
  //     setState(() {
  //       items.removeAt(position);
  //       Navigator.of(context).pop();
  //     });
  //   });
  // }

  // void _navigateToProductInformation(
  //     BuildContext context, Product product) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => ProductScreen(product)),
  //   );
  // }

  // void _navigateToProduct(BuildContext context, Product product) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => ProductInformation(product)),
  //   );
  // }

  // void _createNewProduct(BuildContext context) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) =>
  //             ProductScreen(Product(null, '', '', '', '', '', ''))),
  //   );
  // }

  
}