 class Book{
String id;
String name;
String imagePath;
String filePath;
String writerName;
String shortDescription;
String price;

Book({this.id,this.name,this.imagePath,this.filePath,this.shortDescription,this.price,this.writerName});
Book.fromjson(Map<String,dynamic> json)
{

  id=json["Id"];
  name=json['Name']??' ';
shortDescription=json['ShortDescription'];

 
}
}