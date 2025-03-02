class BookDataModel {
  int? id;
  String? stg;
  String? name;
  List<Language>? language;

  BookDataModel({this.id, this.stg, this.name, this.language});

  BookDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stg = json['stg'];
    name = json['name'];
    if (json['language'] != null) {
      language = <Language>[];
      json['language'].forEach((v) {
        language!.add(new Language.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stg'] = this.stg;
    data['name'] = this.name;
    if (this.language != null) {
      data['language'] = this.language!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Language {
  int? id;
  String? name;
  List<Subjects>? subjects;

  Language({this.id, this.name, this.subjects});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subjects {
  int? id;
  String? type;
  String? icon;
  List<Book>? book;

  Subjects({this.id, this.type, this.icon, this.book});

  Subjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    icon = json['icon'];
    if (json['book'] != null) {
      book = <Book>[];
      json['book'].forEach((v) {
        book!.add(new Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['icon'] = this.icon;
    if (this.book != null) {
      data['book'] = this.book!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Book {
  int? id;
  String? name;
  String? fullPdfLink;
  String? image;
  List<PdfLinks>? pdfLinks;

  Book({this.id, this.name, this.fullPdfLink, this.image, this.pdfLinks});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullPdfLink = json['full_pdf_link'];
    image = json['image'];
    if (json['pdf_links'] != null) {
      pdfLinks = <PdfLinks>[];
      json['pdf_links'].forEach((v) {
        pdfLinks!.add(new PdfLinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['full_pdf_link'] = this.fullPdfLink;
    data['image'] = this.image;
    if (this.pdfLinks != null) {
      data['pdf_links'] = this.pdfLinks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PdfLinks {
  int? id;
  String? name;
  String? link;

  PdfLinks({this.id, this.name, this.link});

  PdfLinks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    return data;
  }
}
