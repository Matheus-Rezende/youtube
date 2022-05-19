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
  @override
  Widget build(BuildContext context) {

    _listarVideos(String search){

      Api api = Api();
      debugPrint("Result: ${api.search(search)}");
      return api.search(search);
    }
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
                      autoPlay: false,
                    )
                  );

                  return Column(
                    children: <Widget>[
                      // Container(
                      //   height: 200,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       fit: BoxFit.cover,
                      //       image: NetworkImage(
                      //         video.image
                      //       )
                      //     )
                      //   ),
                      // ),
                      YoutubePlayerBuilder(
                        player: YoutubePlayer(
                            controller: _controllerVideo,
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
                      )
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