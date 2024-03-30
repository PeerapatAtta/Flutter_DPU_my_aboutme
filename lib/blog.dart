import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final dio = Dio();
  final baseApi = "https://six6130151-lab-nodejs.onrender.com/blog";
  late List blogList = [];

  @override
  void initState() {
    super.initState();
    getBlogs();
  }

  Future<void> getBlogs() async {
    try {
      await dio
          .get(baseApi,
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ))
          .then((response) => {
                if (response.statusCode == 200)
                  {
                    setState(() {
                      blogList = response.data!;
                    })
                  }
              });
    } catch (e) {
      if (!context.mounted) return;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(blogList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Blog'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: blogList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            child: Column(
              children: [
                Image.network(blogList[index]["cover"]),
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: Text(blogList[index]["title"]),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(25, 177, 252, 1),
                      ),
                      child: Text(
                        'More Detail',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BlogDetail extends StatefulWidget {
  const BlogDetail({
    super.key,
    required this.title,
    required this.description,
    required this.cover,
  });
  final String title;
  final String description;
  final String cover;

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.network(widget.cover),
                  ListTile(
                    title: Text(widget.title),
                    subtitle: Text(widget.description),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
