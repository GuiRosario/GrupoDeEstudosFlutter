import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main(){
  runApp(
      const Myapp()
  );
}

class Myapp extends StatefulWidget {
  const Myapp({ Key? key }) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState(); 
}
class _MyappState extends State<Myapp> {
  int _cont = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF4D7B95),
        body:  SafeArea(  
                child: 
                  Center(child: 
                    Column(children: [
                       const CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1450187911576555525/OTP4Hu4G_400x400.jpg'),
                      ),
                       Padding(
                         padding: const EdgeInsets.only(top: 25),
                         child: Text('Guilherme da Silva Rosario',style: TextStyle(fontSize: 25,color: Colors.white,
                         ),
                       ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 25)
                    ),
                    Container(
                      width: 330,
                      child: Text('Lorem ipsum dolor sit amet consectetur adipiscing elit ac, conubia lacus libero enim purus imperdiet lectus justo diam, faucibus blandit ultricies vestibulum quisque parturient natoque',
                        style: TextStyle(fontSize: 18,color: Colors.white,),
                        textAlign: TextAlign.center),),
                    Padding(padding: EdgeInsets.only(top: 25),),
                    Text('numero de clicks:$_cont',style: TextStyle(fontSize: 25,color: Colors.white),),
                    ButtonTheme(

                    height: 80,
                    minWidth: 220.0,
                    child: RaisedButton(
                      
                      color: Colors.purple,
                      onPressed: (){
                        setState(() {
                          _cont++;
                        });
                      },
                      child: const Text('BUTTON',style: 
                      TextStyle(fontSize: 20,color: Colors.white))),)]
                  ),
                ),
              ),
            ),
          );
  }
}