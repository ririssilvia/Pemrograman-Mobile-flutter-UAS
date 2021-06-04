import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
     height: size.height,
     width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
           Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
               color: Colors.indigo[700]
              ),
            )
          ),

          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                 color:  Colors.indigoAccent[100]
              ),
            )
          ),

           Positioned(
            top: 600,
            left: -60,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.indigo[700]
              ),
            )
          ),
          child,
        ],
      ),
    );
  }
}
          
