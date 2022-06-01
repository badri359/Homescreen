// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'card.dart';
import 'sample.dart';
import 'Sample_data.dart';
import 'widget_function.dart';
import 'BorderBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// pagecontroller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidepadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 243, 255),
        body: SafeArea(
          child: Column(children: [
            //app bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Row(
                children: [
                  Text("Webinar This week",
                      style: themeData.textTheme.headline5),
                ],
              ),
            ),
            SizedBox(height: 25),
            //cards
            Container(
              height: 170,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  card(
                    webinar: "How to create Website for business",
                    timewebinar: "Senin, Aug 22, 2022",
                    Color: Colors.lightBlue[400],
                  ),
                  card(
                    webinar: "Learning Python for data analysis",
                    timewebinar: "Rabu, Aug 24, 2022",
                    Color: Colors.lightGreen[400],
                  ),
                  card(
                    webinar: "How to become Digital Marketing",
                    timewebinar: "Jumat, Aug 26, 2022",
                    Color: Colors.purple[400],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800,
              ),
            ),
            addVerticalSpace(padding),
            Row(
              children: [
                Padding(
                  padding: sidepadding,
                  child: Text(
                    "Upcoming Webinar",
                    style: themeData.textTheme.headline5,
                  ),
                ),
                Padding(
                    padding: sidepadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    )),
              ],
            ),
            addVerticalSpace(10),
            Expanded(
              child: Padding(
                padding: sidepadding,
                child: ListView.builder(
                    itemCount: RE_DATA.length,
                    itemBuilder: (context, index) {
                      return RealEstateItem(itemData: RE_DATA[index]);
                    }),
              ),
            )
            // 4 card -> upcoming webinar

            // Design thinking fundamental

            // Figma prototyping

            // User Behavior research

            // How to market products
          ]),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
              backgroundColor: Colors.white,
              color: Colors.lightBlue[400],
              activeColor: Colors.white,
              tabBackgroundColor: Colors.lightBlue,
              padding: EdgeInsets.all(10),
              gap: 8,
              onTabChange: (index) {
                print(index);
              },
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.checklist_rounded,
                  text: "Category",
                ),
                GButton(
                  icon: Icons.notifications_none_rounded,
                  text: "Notification",
                ),
                GButton(
                  icon: Icons.people_alt_outlined,
                  text: "Profile",
                ),
              ],
            ),
          ),
        ));
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key? key, required this.itemData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(itemData["image"]),
              Positioned(
                  child: BorderBox(
                      height: 100,
                      width: 200,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Icon(
                        Icons.favorite_border,
                        color: COLOR_BLACK,
                      )))
            ],
          )
        ],
      ),
    );
  }
}
