import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> hoverAnimation;
  
  //List of products
  List<Product> products = [
    Product(color: const Color(0xff000000), path: 'assets/images/black.png'),
    Product(color: const Color(0xffb6d7e4), path: 'assets/images/blue.png'),  // Corrected order
    Product(color: const Color(0xfffcecd0), path: 'assets/images/cream.png'), // Corrected order
  ];


  int currentIndex=0;
  
  

  Color black = const Color(0xff000000);
  Color cream = const Color(0xfffcecd0);
  Color blue = const Color(0xffb6d7e4);


  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(
      reverse: true
    );
    hoverAnimation = Tween(begin: const Offset(0,0),end: const Offset(0,0.02)).animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292929),
      body: SafeArea(
        child: Column(
          children: [
            SlideTransition(
                position: hoverAnimation,
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 700),
                    child: Image.asset(products[currentIndex].path,key: ValueKey<int>(currentIndex),)

                )
            ),
            const SizedBox(height: 30,),
            const Text('BOAT ROCKERZ 450R',style: TextStyle(
                color:Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold ),
            ),
            const Text('Bluetooth Headphones',
              style: TextStyle(
                color:Colors.grey,
                fontSize: 28,
                fontWeight: FontWeight.w500 ),
            ),
            const SizedBox(height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(products.length,(index){
                 return Container(
                     margin: const EdgeInsets.symmetric(horizontal: 10),
                     child: GestureDetector(
                       onTap: () {
                         setState(() {
                           currentIndex = index;
                         });
                       },
                       child: CircleAvatar(
                         backgroundColor: products[index].color,
                       ),
                     ));
               }) ,

            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Rs. 1,599',
              style: TextStyle(
                  color: Colors.red, fontSize: 28, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              height: 40,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'NOTIFY ME',
                  style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
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



