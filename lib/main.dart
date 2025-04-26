import 'package:flutter/material.dart';
import 'pages/map_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sosyal Hizmetler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sosyal Hizmetler'),
      ),
      body: Column( 
        children: <Widget>[
          // En yakınlar kısmı
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapPage()),
              );
            },
            child: _buildLocationCard(Icons.star, 'Yakınımdaki Merkezler'),
          ),
          
          // Diğer sosyal hizmet merkezleri
          _buildLocationCard(Icons.family_restroom, 'Aile Dayanışma Merkezi'),
          _buildLocationCard(Icons.child_friendly, 'Çocuk Yuvası'),
          _buildLocationCard(Icons.elderly, 'Huzurevi'),
          _buildLocationCard(Icons.people, 'Toplum Merkezi'),
          _buildLocationCard(Icons.child_care, 'Yetiştirme Yurdu'),
        ],
      ),
    );
  }

  // Her bir sosyal hizmet merkezi için dikdörtgen kutular oluşturacak fonksiyon
  Widget _buildLocationCard(IconData icon, String name, {IconData? customIcon}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // İkon kısmı, customIcon parametresi ekledik
          Icon(
            customIcon ?? icon,
            color: Colors.white,
            size: 40,
          ),
          // Ad kısmı
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
