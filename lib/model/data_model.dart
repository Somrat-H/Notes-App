class ModelData{
  late String title;
  late String description;

  ModelData({required this.title, required this.description});

  ModelData.fromMap(Map map) :
    title = map['title'],
    description = map['description'];
   Map toMap(){
    return{
      'title' : title,
      'description' : description,
    };
   }
  

}