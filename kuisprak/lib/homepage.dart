import 'package:flutter/material.dart';
import 'package:kuisprak/detailpage.dart';
import 'disease_data.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Plant Disease')),
        backgroundColor: Colors.green, // set the app bar color to green
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount : listDisease.length,
        itemBuilder : (context, index){
          final Diseases place = listDisease[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(place: place,),),
              );
            },
            child : Card(
              child: Column(
                children : [
                  Expanded(
                    child: Image.network(place.imgUrls),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(place.name),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
