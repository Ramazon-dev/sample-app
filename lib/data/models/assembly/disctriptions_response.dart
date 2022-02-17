class AssemblyDisctriptionResponse {
  String? description;
  String? characteristics;
  String? previewText;

  AssemblyDisctriptionResponse(
      {this.description, this.characteristics, this.previewText});

  AssemblyDisctriptionResponse.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    characteristics = json['characteristics'];
    previewText = json['preview_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['characteristics'] = this.characteristics;
    data['preview_text'] = this.previewText;
    return data;
  }
}
