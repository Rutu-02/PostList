import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/model/response_model.dart';

class ListViewItem extends StatefulWidget {
 final PostModel post;
  const ListViewItem({Key key, this.post}) : super(key: key);

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: height*0.01,bottom:height*0.01,left: width*0.02,right: width*0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.post.title.trim(),style: const TextStyle(fontWeight: FontWeight.bold),),
              Text(widget.post.body.trim(),
                 textAlign: TextAlign.start,
                 style: const TextStyle(fontWeight: FontWeight.normal),),
            ],
          ),
        ),
        const Divider(height: 2,color: Colors.black,)

      ],
    );
  }
}
