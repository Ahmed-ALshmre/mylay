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
      address,
      dateTime,
      urlWhat;


  ItemModel(
      {this.title,
        this.description,
        this.id,
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
    newProduct = json['newProduct'];
    number = json['phone'];
    address = json['address'];
    dateTime = json['dateTime'];
    cato = json['cato'];
    catoCar = json['categoryCar'];
    urlWhat = json['whatsappurl'];
    catoCarGas = json['categoryCarGas'];
    description = json['dic'];
    id = json['id'];

    price = json['price'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['phone'] = this.number;
    data['newProduct'] = this.newProduct;
    data['address'] = this.address;
    data['dateTime'] = this.dateTime;
    data['cato'] = this.cato;
    data['categoryCar'] = this.catoCar;
    data['whatsappurl'] = this.urlWhat;
    data['dic'] = this.description;
    data['price'] = this.price;

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
