class Post {
  final int id;
  final String title;
  final String body;

  // the constructor will take the parameters as objects.
  // This is important for the factory method
  Post({
    this.id,
    this.title,
    this.body
  });
  
  factory Post.getfromJson(Map<String,dynamic> json) {
    return new Post(
        id: json['id'],
        title: json['title'],
        body: json['body']
    );
  }
}