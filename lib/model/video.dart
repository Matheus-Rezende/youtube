class Video {
  late String id;
  late String title;
  late String description;
  late String image;
  late String channel;

  Video({required this.id, required this.title, required this.description, required this.image, required this.channel});

  /*
  static converterJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelId"], 
      description: '',   
    );
  }

  */
  
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelTitle"], 
      description: json["snippet"]["description"],   
    );
  }
 
 String get getId => this.id;

 set setId(String id) => this.id = id;

  get getTitle => this.title;

 set setTitle( title) => this.title = title;

  get getDescription => this.description;

 set setDescription( description) => this.description = description;

  get getImage => this.image;

 set setImage( image) => this.image = image;

  get getChannel => this.channel;

 set setChannel( channel) => this.channel = channel;



}