import 'package:boat_add/webview.dart';
import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> hover;
  Color black = const Color(0xff000000);
  Color cream = const Color(0xfffcecd0);
  Color blue = const Color(0xffb6d7e4);

  List<Product> products = [
    Product(color: const Color(0xff000000) , path: 'assets/black.png'),
    Product(color: const Color(0xfffcecd0) , path: 'assets/cream.png'),
    Product(color: const Color(0xffb6d7e4) , path: 'assets/blue.png'),
  ];
  int currentIndex = 0;
  @override
  void initState() {
   animationController = AnimationController(vsync: this,
   duration: const Duration(milliseconds: 700),
   )..repeat(
     reverse: true,
     period: Duration(milliseconds: 700),
   );
   hover = Tween(begin:Offset(0,0), end: Offset(0, 0.02)).animate(animationController);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff292929),
        // appBar:AppBar(title: Center(child: Text('Boat Add')),) ,
        body: Column(
          children: [
            SlideTransition(
              position: hover,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 700),
                  child: Image.asset(products[currentIndex].path,
                  key: ValueKey<int>(currentIndex),
                  ),
                ),),
            SizedBox(
              height: 30,
            ),
            Text('BOAT ROCKERZ 450R',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Bluetooth Headphones',
              style: TextStyle(
                fontSize: 28,
                color: Colors.grey  ,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(products.length, (index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: products[index].color,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Rs. 1,599',
              style: TextStyle(
                fontSize: 28,
                color: Colors.red  ,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Webview()));
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('BYE NOW',style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
 
  }
}

class Product{
  final Color color;
  final String path;

  Product({required this.color, required this.path});

}
