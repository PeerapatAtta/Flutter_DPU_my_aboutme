import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Welcome to my about me'),
                    subtitle: Text('WE679'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(0),
                    color: Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'profile');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/user.png'),
                                height: 80,
                                width: 80),
                            Center(
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    color: Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'video_presentation');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image:
                                    AssetImage('assets/images/multimedia.png'),
                                height: 80,
                                width: 80),
                            Center(
                              child: Text(
                                'Video Presentation',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    color: Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/map.png'),
                                height: 80,
                                width: 80),
                            Center(
                              child: Text(
                                'Map',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    color: Color.fromRGBO(114, 165, 246, 1),
                    child: TextButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/schedule.png'),
                                height: 80,
                                width: 80),
                            Center(
                              child: Text(
                                'Age Calculation',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
