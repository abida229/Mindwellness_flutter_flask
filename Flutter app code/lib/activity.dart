import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fyp_code/Dashboard.dart';
import 'package:lottie/lottie.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set a light background
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0, // Remove shadow for a cleaner look
        title: Text(
          'Activity Page',
          style: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.to(Dashboard());
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          // Use containers for consistent spacing and borders
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlueAccent, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Lottie.asset(
                'assets/animations/walk.json',
                height: 500,

              ),
              title: Text(
                'Morning Walk',
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightGreenAccent, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Lottie.asset(
                'assets/animations/breathinbreathout.json',
                height: 500,

              ),
              title: Text(
                'Breathing In, Breathing Out',
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlueAccent, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Lottie.asset(
                'assets/animations/yogabreath.json',

                height: 500,
              ),
              title: Text(
                'Relax and Breath',
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
