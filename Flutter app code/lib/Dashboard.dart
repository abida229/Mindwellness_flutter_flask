import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:fyp_code/activity.dart';
import 'package:fyp_code/screens/assessment.dart';
import 'package:fyp_code/ChatScreen.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double width = 0;
  double height = 0;

  List imgSrc = [
    "assets/images/health-screening.jpg",
    "assets/images/activities.png",
    "assets/images/chatbot.png",
  ];

  List titles = ["Health Assessment", "Activities ", "Chatbot"];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlue,
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                height: height * 0.23,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 35,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.sort,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dashboard",
                            style: GoogleFonts.abel(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  width: width,
                  padding: EdgeInsets.only(bottom: 20),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: imgSrc.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          navigateToScreen(index);
                        },
                        child: Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                imgSrc[index],
                                width: 100,
                              ),
                              Text(
                                titles[index],
                                style: GoogleFonts.acme(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        Get.to(HealthAssessmentScreen(), transition: Transition.leftToRightWithFade);
        break;
      case 1:
       Get.to(ActivityPage(), transition: Transition.leftToRightWithFade);
        break;
      case 2:
        Get.to(ChatPage(), transition: Transition.leftToRightWithFade);
        break;
      default:
        break;
    }
  }
}
