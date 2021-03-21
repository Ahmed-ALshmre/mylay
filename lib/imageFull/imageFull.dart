import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
class ImageFull extends StatefulWidget {
  final List<String> imageFull;
  const ImageFull({Key key, this.imageFull}) : super(key: key);
  @override
  _ImageFullState createState() => _ImageFullState();
}
class _ImageFullState extends State<ImageFull> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // add this body tag with container and photoview widget
        body: PhotoViewGallery.builder(
          itemCount: widget.imageFull.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(widget.imageFull[index]),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(
            color: Colors.black54
          ),
          loadFailedChild: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
