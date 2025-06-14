
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/User.dart';
import '../provider/list_provider.dart';
import '../widgets/card_bilder.dart';
import 'form_people.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<UserModel> listOfCard = [];
  int _selectedIndex = 0;


  // void addCardToListMethod(UserModel userCard) {
  //   setState(() {
  //     listOfCard.add(userCard);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final newUserModel = Provider.of<ListProvider>(context);
    String getName = newUserModel.listOfCardsProvider[newUserModel.listOfCardsProvider.length - 2];
    // newUserModel.addCardToList(newUserModel);
    // String getDate = Provider.of<UserModel>(context).dataModel.toString();
    // String getPhotoURL = Provider.of<UserModel>(context).photoURLModel.toString();

    if ( getName == 'init' ) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Календарь дней рождений'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddPeopleBirthday()));
                },
                icon: Icon(Icons.add)),
          ],
          leading: IconButton(
            onPressed: () {
              print(newUserModel.listOfCardsProvider);
              print(newUserModel.listOfCardsProvider[0][0]);
              print(newUserModel.listOfCardsProvider[1][0]);
              print(newUserModel.listOfCardsProvider[2][0]);
            },
            icon: Icon(Icons.search_rounded),
          ),
        ),
        body: Center(
          child: Text(
            'Добавьте новых именинников',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    List<Widget> cards = <Widget>[
      Scaffold(
        body: ListView.builder(
          itemCount: newUserModel.listOfCardsProvider.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Image.file(File(newUserModel.listOfCardsProvider[newUserModel.listOfCardsProvider.length-1])),
                  ),
                  Container(
                    child: Text(newUserModel.listOfCardsProvider[newUserModel.listOfCardsProvider.length-3]),
                  ),
                  Container(
                    child: Text(newUserModel.listOfCardsProvider[newUserModel.listOfCardsProvider.length-2]),
                  )
                ],
              ),
            );
            // Card(
            //   child: Column(
            //     children: [
            //       Container(
            //         height: 200,
            //         child: Image.asset(listOfCard[index].photoURLModel),
            //       ),
            //       Container(
            //         child: Text(listOfCard[index].nameModel),
            //       ),
            //       Container(
            //         child: Text(listOfCard[index].dataModel),
            //       )
            //     ],
            //   ),
            // )
            ;
          },
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь дней рождений'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPeopleBirthday()));
              },
              icon: Icon(Icons.add)),
        ],
        leading: IconButton(
          onPressed: () {
            // print(listOfCard[0].nameModel);
            print(newUserModel.listOfCardsProvider);
            print(newUserModel.listOfCardsProvider[0][0]);
            print(newUserModel.listOfCardsProvider[1][0]);
            print(newUserModel.listOfCardsProvider[2][0]);
          },
          icon: Icon(Icons.search_rounded),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: IndexedStack(
            index: _selectedIndex,
            children: cards,
          ),
          //_cards.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
