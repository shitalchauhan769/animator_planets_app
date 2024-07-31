class PlanetsModel
{
  String? name,image,description;

  PlanetsModel({this.name, this.image, this.description});
  factory PlanetsModel.mapToModel(Map m1)
  {
    return PlanetsModel(image: m1['image'],description: m1['description'],name: m1['name']);
  }
}