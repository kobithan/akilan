import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/modules/dietician.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/dieticians.dart';



class DieticianList extends StatefulWidget {
  const DieticianList({Key? key}) : super(key: key);

  @override
  _DieticianListState createState() => _DieticianListState();
}

class _DieticianListState extends State<DieticianList> {
  List<Dietician> dieticians = allDieticians;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
        itemCount: dieticians.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index)
    {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Material(
          color: Colors.white70,
          elevation: 10,
          borderRadius: BorderRadius.circular(18),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            splashColor: Colors.black26,
            onTap: () async {
              final Uri contactNum = Uri.parse("tel:" + dieticians[index].tel);
              if (!await launchUrl(
                  contactNum)) throw 'Could not launch $contactNum';
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Ink.image(
                    image: NetworkImage(dieticians[index].urlImage),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: dieticians[index].dieticianName + '\n',
                    style: const TextStyle(color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: dieticians[index].dieticianInfo + '\n',
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 10.0)
                      ),
                      TextSpan(
                          text: 'Email : ' + dieticians[index].email + '\n',
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 10.0)
                      ),
                      TextSpan(
                          text: 'Tap to Call : ' + dieticians[index].tel + '\n',
                          style: const TextStyle(color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                )
              ],
            ),


          ),
        ),

      );
    }
    ),
    );
  }
}