class PromoModel {
  int? id;
  String? title;
  String? publishedAt;
  String? created_at;
  String? updatedAt;
  String? namePromo;
  String? descPromo;
  String? nama;
  String? desc;
  String? latitude;
  String? longitude;
  String? alt;
  String? createdAt;
  String? lokasi;
  int? count;
  Img? img;

  PromoModel(
      {this.id,
      this.title,
      this.publishedAt,
      this.created_at,
      this.updatedAt,
      this.namePromo,
      this.descPromo,
      this.nama,
      this.desc,
      this.latitude,
      this.longitude,
      this.alt,
      this.createdAt,
      this.lokasi,
      this.count,
      this.img});

  PromoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'] ?? "";
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    namePromo = json['name_promo'];
    descPromo = json['desc_promo'];
    nama = json['nama'] ?? "";
    desc = json['desc'] ?? "";
    latitude = json['latitude'];
    longitude = json['longitude'];
    alt = json['alt'];
    createdAt = json['createdAt'];
    lokasi = json['lokasi'];
    count = json['count'];
    img = json['img'] != null ? new Img.fromJson(json['img']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name_promo'] = this.namePromo;
    data['desc_promo'] = this.descPromo;
    data['nama'] = this.nama;
    data['desc'] = this.desc;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['alt'] = this.alt;
    data['createdAt'] = this.createdAt;
    data['lokasi'] = this.lokasi;
    data['count'] = this.count;
    if (this.img != null) {
      data['img'] = this.img!.toJson();
    }
    return data;
  }
}

class Img {
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  String? previewUrl;
  String? provider;
  String? providerMetadata;
  String? createdAt;
  String? updatedAt;

  Img(
      {this.id,
      this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.formats,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.previewUrl,
      this.provider,
      this.providerMetadata,
      this.createdAt,
      this.updatedAt});

  Img.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? new Formats.fromJson(json['formats']) : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'] ?? "";
    provider = json['provider'];
    providerMetadata = json['provider_metadata'] ?? "";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alternativeText'] = this.alternativeText;
    data['caption'] = this.caption;
    data['width'] = this.width;
    data['height'] = this.height;
    if (this.formats != null) {
      data['formats'] = this.formats!.toJson();
    }
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['size'] = this.size;
    data['url'] = this.url;
    data['previewUrl'] = this.previewUrl;
    data['provider'] = this.provider;
    data['provider_metadata'] = this.providerMetadata;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Formats {
  Small? small;
  Small? medium;
  Small? thumbnail;

  Formats({this.small, this.medium, this.thumbnail});

  Formats.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? new Small.fromJson(json['small']) : null;
    medium = json['medium'] != null ? new Small.fromJson(json['medium']) : null;
    thumbnail = json['thumbnail'] != null
        ? new Small.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.small != null) {
      data['small'] = this.small!.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium!.toJson();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    return data;
  }
}

class Small {
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  String? path;
  double? size;
  int? width;
  int? height;

  Small(
      {this.ext,
      this.url,
      this.hash,
      this.mime,
      this.name,
      this.path,
      this.size,
      this.width,
      this.height});

  Small.fromJson(Map<String, dynamic> json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'] ?? "";
    size = json['size'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ext'] = this.ext;
    data['url'] = this.url;
    data['hash'] = this.hash;
    data['mime'] = this.mime;
    data['name'] = this.name;
    data['path'] = this.path;
    data['size'] = this.size;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}
