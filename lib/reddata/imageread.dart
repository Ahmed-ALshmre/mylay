import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatefulWidget {
  final List imageList;
  ProductImages({this.imageList});
  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
                tag: "1",
                child: CachedNetworkImage(
                  imageUrl: "${widget.imageList[selectedImage]}",
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Wrap(
          direction: Axis.horizontal,
          children: [
            ...List.generate(widget.imageList.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.only(right: 15),
          padding: EdgeInsets.all(8),
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Color(0xFFFF7643)
                    .withOpacity(selectedImage == index ? 1 : 0)),
          ),
          child: CachedNetworkImage(
            imageUrl: "${widget.imageList[index]}",
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )),
    );
  }
}
