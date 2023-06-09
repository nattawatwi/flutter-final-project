import 'dart:io';

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
        title: const Text("เกี่ยวกับ"),
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
              "บอม",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "นายณัฐวัตร วิลัย",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "633410013-6",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "วิทยาการคอมพิวเตอร์และสารสนเทศ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            const Text(
              "ติดตามผลงานได้ที่",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Link("https://github.com/nattawatwi");
                  },
                  icon: Icon(Icons.hub),
                  tooltip: "Github",
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    Link("https://www.facebook.com/Nattawat.CJ/");
                  },
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
