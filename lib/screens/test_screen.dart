import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; // 화면 높이 가져오기
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.3,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.05,
                          child: Container(
                            width: 900,
                            child: Text(
                              "프로젝트 헤일메리",
                              style: TextStyle(fontSize: screenHeight * 0.03),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("author: 앤디 위어"),
                                Text("Date Boarding: Now"),
                                Text("9788925588735"),
                              ],
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Column(
                              children: [
                                Text(""),
                                Text("pubdate: 날짜"),
                                Text("publisher: Now"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: SizedBox(
                        width: 200,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/9788925588735.jpg',
                              fit: BoxFit.fitHeight,
                              height: screenHeight * 0.3,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: SizedBox(
              width: 400,
              height: 400,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/9788925588735.jpg',
                    fit: BoxFit.fitHeight,
                    height: screenHeight * 0.3,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("프로젝트 헤일메리"),
                      Text("앤디 위어 지음 - 출판사 - 출판일"),
                      Text("ISBN")
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
