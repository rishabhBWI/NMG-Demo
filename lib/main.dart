import 'package:flutter/material.dart';
import 'package:ngm/constants.dart';
import 'package:ngm/modals/authors.dart';
import 'package:ngm/modals/postDetails.dart';
import 'package:ngm/modals/posts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'NGM Social App'),
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
  MyDio dio = MyDio();
  List<User> value = [];
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    // value = dio.getAuthors();
    fetchData();
    // posts = dio.getPosts();
  }

  Future<void> fetchData() async {
    List<User> users = await dio.getUsers();
    List<Post> myposts = await dio.getPosts();

    setState(() {
      value = users;
      posts = myposts;
    });
  }

  String getAuthorName(int userId) {
    final author = value.firstWhere(
      (author) => author.id == userId,
    );
    return author.name!;
  }

  getAuthorDetails(int userId) {
    final author = value.firstWhere(
      (author) => author.id == userId,
    );
    return author;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return InkWell(onTap: () {}, child: postCard(posts[index]));
                // ListTile(
                //   title: Text(posts[index].title),
                //   subtitle: Text(getAuthorName(posts[index].userId)),
                // );
              })),
    );
  }

  Widget postCard(Post post) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getAuthorName(post.userId),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${post.title}'),
                SizedBox(height: 10),
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostDetails(
                                  post: post,
                                  user: getAuthorDetails(post.userId))));
                    },
                    child: Text(
                      'Read More',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
