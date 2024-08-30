class EventDTO {
 
  
  final String type;
  final String category;
  final String description;
 


  EventDTO({
    
    required this.type,
    required this.category,
    required this.description,
    

  });

  // Convert an Event object into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      
    
      'type': type,
      'category': category,
      'description': description,
     
      
    };
  }


  factory EventDTO.fromJson(Map<String, dynamic> json) {
    return EventDTO(
      
      
      type: json['type'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      
     
    );
  }
}