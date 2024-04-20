import 'package:flutter/material.dart';
import 'package:my_aboutme/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home Page'),
        automaticallyImplyLeading: false,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: Icon(Icons.logout),
                        onPressed: () => {
                          logOut(),
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()))
                        },
                      ),
                    ],
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
                        onPressed: () {
                          Navigator.pushNamed(context, 'my_map');
                        },
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
                        onPressed: () {
                          Navigator.pushNamed(context, 'my_age');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/schedule.png'),
                                height: 80,
                                width: 80),
                            Center(
                              child: Text(
                                'My Age',
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
                          Navigator.pushNamed(context, 'blog');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image:
                                    AssetImage('assets/images/portfolio.png'),
                                height: 80,
                                width: 80),
                            Center(
                              child: Text(
                                'Blog',
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
                          Navigator.pushNamed(context, 'product');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage('assets/images/products.png'),
                                height: 80,
                                width: 80),
                            Center(
                              child: Text(
                                'Product',
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
