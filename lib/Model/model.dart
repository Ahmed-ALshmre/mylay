class ItemModel {
  String id;
  String title,
      description,
      price,
      newProduct,
      cato,
      catoCar,
      catoCarGas,
      number,
  ctay,
      address,
      dateTime,
      isHomeCatogrie,
      urlWhat,
      documnetID;
  List<String> images;

  ItemModel(
      {this.title,
      this.documnetID,
      this.isHomeCatogrie,
      this.description,
      this.id,
      this.ctay,
        this.images,
      this.price,
      this.number,
      this.cato,
      this.catoCar,
      this.urlWhat,
      this.catoCarGas,
      this.newProduct,
      this.address,
      this.dateTime});
  ItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    documnetID = json['documnetID'];
    isHomeCatogrie = json['isHomeCatogrie'];
    newProduct = json['newProduct'];
    number = json['phone'];
    address = json['cont'];
    ctay = json['address'];
    dateTime = json['dateTime'];
    cato = json['cato'];
    catoCar = json['categoryCar'];
    urlWhat = json['whatsappurl'];
    catoCarGas = json['categoryCarGas'];
    description = json['dic'];
    id = json['id'];
    images = json != null ? List.from(json['urls']) : null;
    price = json['price'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['documnetID'] = this.documnetID;
    data['isHomeCatogrie'] = this.title;
    data['phone'] = this.number;
    data['newProduct'] = this.newProduct;
    data['cont'] = this.address;
    data['address'] = this.ctay;
    data['dateTime'] = this.dateTime;
    data['cato'] = this.cato;
    data['categoryCar'] = this.catoCar;
    data['whatsappurl'] = this.urlWhat;
    data['dic'] = this.description;
    data['price'] = this.price;
    data['urls'] = this.images;
    data['id'] = this.id;
    return data;
  }
}

class PublishedDate {
  String date;
  PublishedDate({this.date});
  PublishedDate.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}
