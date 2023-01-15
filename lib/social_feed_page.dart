import 'package:flutter/material.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({Key? key}) : super(key: key);

  static const routeName = "/SocialPage";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Social Interface",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Stories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black87,
                )),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 12),
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo="),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 10,
                          child: Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  storyAvatar(
                      "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8d29tYW4lMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                  storyAvatar(
                      "http://demos.thementic.com/wordpress/WC01/WC010007/wp-content/uploads/2019/02/t3.jpg"),
                  storyAvatar(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqZ3XiqjCKuYWdxisXTSj84wG5Ebn8rxUqhUkl5etzFE73KfVsZPZwqD_rgIxHcneHT1Q&usqp=CAU"),
                  storyAvatar(
                      "http://lavinephotography.com.au/wp-content/uploads/2017/01/PROFILE-Photography-101-e1485815933252.jpg"),
                  storyAvatar(
                      "https://i.pinimg.com/originals/74/f7/63/74f763a030b155620943651312b44c0b.jpg"),
                  storyAvatar(
                      "https://i.dailymail.co.uk/i/pix/2017/04/20/13/3F6B966D00000578-4428630-image-m-80_1492690622006.jpg"),
                  storyAvatar(
                      "https://image.shutterstock.com/mosaic_250/2780032/2021632466/stock-photo-headshot-portrait-of-confident-young-indian-woman-renter-or-tenant-pose-in-modern-own-new-apartment-2021632466.jpg"),
                  storyAvatar(
                      "https://emergeamericas.com/wp-content/uploads/2019/12/Felice-Gorordo-Headshot.png"),
                ],
              ),
            ),
            Container(
              height: 2,
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(horizontal: 30),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 8),
                children: [
                  postField(
                      "https://content.active.com/Assets/Active.com+Content+Site+Digital+Assets/Fitness/Articles/APark+Workout+Routine/park+workout-carousel.jpg"),
                  postField(
                      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ideas-for-exercising-outdoors-outdoor-workout-tips-from-the-pros-1610986140.jpg?crop=0.668xw:1.00xh;0.311xw,0&resize=640:*"),
                  postField(
                      "https://images.news18.com/ibnlive/uploads/2021/11/workout.jpg"),
                  postField(
                      "https://media1.popsugar-assets.com/files/thumbor/mFJzLLkjb-g48E0RvUZSKDuyaz8/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2020/09/08/162/n/1922729/0cd3e17b5f5843e763f588.83656260_/i/best-youtube-workouts-as-picked-by-fitness-editor.jpg"),
                  postField(
                      "https://www.thesun.co.uk/wp-content/uploads/2018/07/NINTCHDBPICT000421846133.jpg?strip=all&quality=100&w=1200&h=800&crop=1"),
                ],
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black54.withOpacity(0.1),
      //         spreadRadius: 1,
      //       )
      //     ],
      //     color: Colors.grey[500]?.withOpacity(0.1),
      //     borderRadius: BorderRadius.circular(13),
      //   ),
      //   child: Row(
      //     children: [
      //       navigationBarItems(Icons.home, 0),
      //       navigationBarItems(Icons.search, 1),
      //       navigationBarItems(Icons.add_circle, -1),
      //       navigationBarItems(Icons.notifications, 2),
      //       navigationBarItems(Icons.person, 3),
      //     ],
      //   ),
      // ),
    );
  }

  Widget navigationBarItems(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItemIndex = index;
        });
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        height: 50,
        child: Icon(
          icon,
          size: 30,
          color: index == selectedItemIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  Container postField(String linkPost) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [postFirstRow(), const Icon(Icons.more_vert)],
          ),
          const SizedBox(
            height: 10,
          ),
          postPicture(linkPost),
          const SizedBox(
            height: 5,
          ),
          Text(
            "265 Likes",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Row postFirstRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo="),
          radius: 13,
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Roy Morgan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "England",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.grey[500]),
            ),
          ],
        )
      ],
    );
  }

  Stack postPicture(String linkPost) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width - 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.28),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(linkPost))),
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: Icon(Icons.favorite,
                size: 38, color: Colors.white.withOpacity(0.7))),
      ],
    );
  }

  Container storyAvatar(String link) {
    return Container(
      margin: const EdgeInsets.only(left: 18),
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.green),
      child: CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(link),
      ),
    );
  }
}
