import 'dart:io';
class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;
  ImageUploadModel({
    this.imageFile,
    this.isUploaded,
    this.uploading,
    this.imageUrl,
  });
}