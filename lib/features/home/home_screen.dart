import 'package:flutter/material.dart';
import 'package:news_app/core/theme/light_color.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeController(),
      child: Consumer<HomeController>(
        builder: (BuildContext context, HomeController value, Widget? child) {
          return Scaffold(
            body: value.errorMessage?.isNotEmpty ?? false
                ? Center(child: Text(value.errorMessage!))
                : value.topHeadLinesLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                  children: [
                    SizedBox(
                      height: 330,
                      child: Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 240,
                              child: Image.asset(
                                'assets/images/home_background.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned.fill(
                              top: 40,
                              child: Column(
                                children: [
                                  Text(
                                    "NEWST",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                      color: LightColor.primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Trending News",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "View all",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.underline,
                                            decorationColor: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  SizedBox(
                                    height: 140,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                        itemCount: 10 ,itemBuilder: (context, index){
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 140, width: 240,
                                            color: Colors.red,
                                          ),
                                        );
                                    }),
                                  )


                                ],
                              ),
                            ),

                          ],
                        ),
                    ),
                  ],
                ),
          );
        },
      ),
    );
  }
}
