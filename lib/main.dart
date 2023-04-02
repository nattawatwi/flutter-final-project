import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/edit_item_screen.dart';
import 'package:flutter_project/screens/login_screen.dart';
import 'package:flutter_project/screens/new_item_screen.dart';
import 'package:flutter_project/screens/setting_screen.dart';
import 'package:flutter_project/services/auth_service.dart';

import 'package:flutter_project/screens/credit_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); //เริ่มการทำงานของแอปพลิเคชัน
}

class MyApp extends StatelessWidget {
  //เป็น class ที่ extends จาก StatelessWidget
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //เป็นการสร้างหน้า home page ของแอปพลิเคชัน โดยใช้ MaterialApp เป็นส่วนหลักของการสร้างหน้าจอและตั้งค่าสีหลัก
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white70,
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthService _service = AuthService();

  @override
  Widget build(BuildContext context) {
    User? currentUser = _service.user;
    String displayEmail = "";
    if (currentUser != null && currentUser.email != null) {
      displayEmail = currentUser.email!;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.brown),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Icon(
                    Icons.account_circle,
                    size: 50.0,
                  ),
                  SizedBox(height: 8.0),
                  Text("ยินดีต้อนรับ $displayEmail")
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: const Text("เกี่ยวกับ"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreditScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: const Text("ตั่งค่า"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black),
              title: const Text("ลงชื่อออก"),
              onTap: () {
                _service.logout(currentUser);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              },
            )
          ],
        ),
      ),
      //สร้าง ListView จากข้อมูลที่ได้จาก collection "items" ใน Firestore ด้วย StreamBuilder
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("items").snapshots(),
        builder: ((context, snapshot) {
          final dataDocuments = snapshot.data?.docs;
          if (dataDocuments == null) return const Text("No data");
          return ListView.builder(
            itemCount: dataDocuments.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text("${index + 1}."),
                title: Text(dataDocuments[index]["name"].toString()),
                subtitle: Text(dataDocuments[index]["desc"].toString()),
                trailing: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _editItemScreen(
                        dataDocuments[index].id,
                        dataDocuments[index]["name"],
                        dataDocuments[index]["desc"]);
                  },
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewItem,
        tooltip: 'เพิ่มโน๊ตของคุณ',
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //การสร้าง method _createNewItem() สำหรับการเพิ่มข้อมูลใหม่ในหน้า MyHomePage
  void _createNewItem() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewItemScreen()));
  }

  //สร้าง method _editItemScreen() สำหรับการแก้ไขข้อมูลที่เลือกแสดงในหน้าแอปพลิเคชัน
  _editItemScreen(String documentid, String itemName, String itemDesc) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EditItemScreen(documentid, itemName, itemDesc)));
  }
}
