class PlanetsModel {
  String? name, image, description, position, velocity, distance;


  PlanetsModel({this.name,
    this.image,
    this.description,
    this.position,
    this.velocity,
    this.distance});

  factory PlanetsModel.mapToModel(Map m1)
  {
    return PlanetsModel(image: m1['image'],
        description: m1['description'],
        name: m1['name'],
        distance: m1["distance"],
        position: m1["position"],
        velocity: m1["velocity"]);
  }
}