import 'package:flutter/material.dart';
import '../model/models.dart';

class CardDemo extends StatelessWidget {
  const CardDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: postDataArr.map((item) {
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.network(
                        item.imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.imgUrl),
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.subTitle),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "sdfj skjdfskjfe sdkfjsjf sfj sldjflewjfl lfjgdg sldjfsd sfjsdf lsdfjsf sdfjsf dfsfsdf ddgfd fhr sdlf ewrjwkerj sfjsf ewjk fsdfejf jsf dslkfjkejf eigj rte tlkwejr fskf  ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ButtonBar(
                        children: <Widget>[Text("like".toUpperCase())],
                      )
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
