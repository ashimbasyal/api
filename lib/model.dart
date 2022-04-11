import 'dart:convert';

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

String imageToJson(Image data) => json.encode(data.toJson());

class Image {
    Image({
        this.picture,
        this.value,
    });

    String picture;
    String value;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        picture: json["@picture.context"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "@odata.context": picture,
        "value": value,
    };
}

