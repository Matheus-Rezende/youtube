import 'package:flutter/material.dart';
import 'package:youtube/api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/video.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {

  late String search = "";

  HomePage(this.search, {Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _listarVideos(String search){

    Api api = Api();
    return api.search(search);
  }

  @override
  void initState() {
    super.initState();
    debugPrint("chamada 1 - initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("chamada 2 - didChangeDependencies");

  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("chamada 2 - didUpdateWidget");
  }
  @override
  void dispose() {
    super.dispose();
    debugPrint("chamada 4 - dispose");
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("chamada 3 - build");
    return FutureBuilder<List<Video>?>(
      future: _listarVideos(widget.search),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:

          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(

              ),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index){

                  List<Video>? videos = snapshot.data;
                  Video video = videos![index];

                  YoutubePlayerController _controllerVideo = YoutubePlayerController(
                    initialVideoId: video.id,
                    flags: const YoutubePlayerFlags(
                      controlsVisibleAtStart: true,
                      showLiveFullscreenButton: false,
                      forceHD: true,
                      autoPlay: false,
                    )
                  );

                  return Column(
                    children: <Widget>[
                      YoutubePlayerBuilder(
                        player: YoutubePlayer(
                            controller: _controllerVideo,
                            progressIndicatorColor: Colors.red,
                            showVideoProgressIndicator: true,
                            aspectRatio: 19.5 / 9,
                            actionsPadding: const EdgeInsets.all(20),
                            thumbnail: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    video.image
                                  )
                                )
                              ),
                            ),
                        ),
                        builder: (context, player){
                          return Column(
                              children: [
                                  // some widgets
                                  player,
                                  //some other widgets
                              ],
                          );
                        },
                      ),
                      ListTile(
                        title: Text(video.title),
                        subtitle: Text(video.channel),
                      ),
                    ],
                  );
                }, 
                separatorBuilder: (context, index) => const Divider(
                  height: 3,
                  color: Colors.grey,
                ),
                itemCount: snapshot.data!.length,
              );
            }else{
              return const Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
        }
      },
    );
  }
}