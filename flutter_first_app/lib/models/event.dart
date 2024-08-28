class EventDTO {
  final DateTime date;
  final String userId;
  final String placeId;
  final String imageURL;
  final String type;
  final String category;
  final String description;
  final String eventCreatorId;


  EventDTO({
    required this.date,
    required this.userId,
    required this.placeId,
    required this.imageURL,
    required this.type,
    required this.category,
    required this.description,
    required this.eventCreatorId,

  });

  // Convert an Event object into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'userId': userId,
      'placeId': placeId,
      'imageURL': imageURL,
      'type': type,
      'category': category,
      'description': description,
      'eventCreatorId': eventCreatorId,
      
    };
  }


  factory EventDTO.fromJson(Map<String, dynamic> json) {
    return EventDTO(
      date: DateTime.parse(json['date'] as String),
      userId: json['userId'] as String,
      placeId: json['placeId'] as String,
      imageURL: json['imageURL'] as String,
      type: json['type'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      eventCreatorId: json['eventCreatorId'] as String,
     
    );
  }
}