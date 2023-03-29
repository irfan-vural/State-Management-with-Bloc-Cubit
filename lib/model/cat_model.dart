class Cat {
  String? id;
  int? width;
  int? height;
  String? url;
  List<Breeds>? breeds;

  Cat({this.id, this.width, this.height, this.url, this.breeds});

  Cat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    if (json['breeds'] != null) {
      breeds = <Breeds>[];
      json['breeds'].forEach((v) {
        breeds!.add(Breeds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    if (breeds != null) {
      data['breeds'] = breeds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Breeds {
  Weight? weight;
  String? id;
  String? name;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? lifeSpan;
  String? wikipediaUrl;

  Breeds(
      {this.weight,
      this.id,
      this.name,
      this.temperament,
      this.origin,
      this.countryCodes,
      this.countryCode,
      this.lifeSpan,
      this.wikipediaUrl});

  Breeds.fromJson(Map<String, dynamic> json) {
    weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    id = json['id'];
    name = json['name'];
    temperament = json['temperament'];
    origin = json['origin'];
    countryCodes = json['country_codes'];
    countryCode = json['country_code'];
    lifeSpan = json['life_span'];
    wikipediaUrl = json['wikipedia_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weight != null) {
      data['weight'] = this.weight!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['temperament'] = this.temperament;
    data['origin'] = this.origin;
    data['country_codes'] = this.countryCodes;
    data['country_code'] = this.countryCode;
    data['life_span'] = this.lifeSpan;
    data['wikipedia_url'] = this.wikipediaUrl;
    return data;
  }
}

class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});

  Weight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imperial'] = this.imperial;
    data['metric'] = this.metric;
    return data;
  }
}
