import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditScreen extends StatefulWidget {
  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เครดิตผู้ทำ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                  "https://scontent.fbkk5-3.fna.fbcdn.net/v/t39.30808-6/283917183_1915172192012669_129191124400808929_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEDu5p1JEsvhSnUCVyhL49U-8APmxhPsGL7wA-bGE-wYlvRZ485t9djRIEfAwHAl-1qrzUJbSyMWuLuaZvBbqgC&_nc_ohc=S8LFyVljdV8AX99LFge&_nc_ht=scontent.fbkk5-3.fna&oh=00_AfDfrZUx2AwtPJKM2wGNoLHVieCbcf1_Izg-dNDtFyPLjw&oe=642E7E04"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Nattawat Wilai",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Large Language Model\nTrained by OpenAI",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            const Text(
              "ติดตาม ChatGPT ได้ที่",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.hub),
                  tooltip: "Github",
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.facebook),
                  tooltip: "Facebook",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
