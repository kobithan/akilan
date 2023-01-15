import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/screens/Food_Details.dart';
import 'package:shape_shifter_fitness_application/screens/diet_meal_detail_screen.dart';



class FoodSearchPage extends SearchDelegate {

  CollectionReference _firebaseFirestore =
  FirebaseFirestore.instance.collection("diet_data");

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget> [
      IconButton(
          icon: Icon(Icons.close),
        onPressed: () {
            query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
    onPressed: () {
          Navigator.of(context).pop();
    },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.snapshots().asBroadcastStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        else {
          if (
          snapshot.data!.docs.where(
                  (QueryDocumentSnapshot<Object?> element) => element['Food']
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase())).isEmpty) {
            return Center(child: Text("No Search query found"),);
          }

          else {
            return ListView(
              children: [
                ...snapshot.data!.docs.where(
                        (QueryDocumentSnapshot<Object?> element) => element['Food']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase())).map((QueryDocumentSnapshot<Object?> data) {
                  final String food = data.get('Food');
                  final String image = data['PhotoURL'];
                  final String food_Catergory = data.get('FoodCategory');

                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        FoodDetails.routeName,
                        arguments: {
                          'index': 0,
                        },
                      );
                    },
                    title: Text(food),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(image),
                    ),
                    subtitle: Text(food_Catergory),
                  );})
              ],
            );
          }
          //print(snapshot.data);
        }
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Search anything here"),);
  }
}

