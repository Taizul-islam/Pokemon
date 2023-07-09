class SinglePokemon {
  String? sTypename;
  String? id;
  String? name;
  String? image;
  String? classification;
  Weight? weight;
  Weight? height;

  SinglePokemon(
      {this.sTypename,
        this.id,
        this.name,
        this.image,
        this.classification,
        this.weight,
        this.height});

  SinglePokemon.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    id = json['id'];
    name = json['name'];
    image = json['image'];
    classification = json['classification'];
    weight =
    json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    height =
    json['height'] != null ? Weight.fromJson(json['height']) : null;
  }

}

class Weight {
  String? sTypename;
  String? minimum;
  String? maximum;

  Weight({this.sTypename, this.minimum, this.maximum});

  Weight.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    minimum = json['minimum'];
    maximum = json['maximum'];
  }

}