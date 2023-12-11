import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TikTok'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Soo Muuji Comments...'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return Container(
                  height: 4000,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    children: [
                      Text(
                        '4 Comments',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                          children: [
                            CommentTile(
                              name: 'Mohamed',
                              image: 'images/s.jpeg',
                              time: '6h    Reply',
                              message: 'Asc walaikum slam',
                            ),
                            CommentTile(
                              name: 'Abdirahman',
                              image: 'images/s.jpeg',
                              time: '6h    Reply',
                              message: 'Asc walaikum slam',
                            ),
                            CommentTile(
                              name: 'Ali Omar',
                              image: 'images/s.jpeg',
                              time: '6h    Reply',
                              message: 'Asc walaikum slam',
                            ),
                            CommentTile(
                              image: 'images/s.jpeg',
                              name: 'John Smith',
                              message: 'funy waaye !',
                              time: '4h    Reply',
                            ),
                            // Add more CommentTile widgets here for additional comments
                          ],
                        ),
                      ),
                      SizedBox(height: 36),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Add comment....',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  final String name;
  final String image;
  final String time;
  final String message;

  CommentTile({
    required this.name,
    required this.image,
    required this.time,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          SizedBox(height: 2),
          Text(time),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              // Handle love icon press
            },
            child: Icon(
              Icons.favorite_outline,
              // color: Color.fromARGB(255, 245, 110, 101),
            ),
          ),
          SizedBox(width: 19),
          GestureDetector(
            onTap: () {
              // Handle like icon press
            },
            child: Icon(
              Icons.thumb_down_outlined,
              // color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
