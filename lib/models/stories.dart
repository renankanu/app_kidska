class Stories {
  Stories({
    required this.id,
    required this.name,
    required this.image,
    required this.urlAudio,
  });

  final String id;
  final String name;
  final String image;
  final String urlAudio;

  @override
  String toString() {
    return 'Stories(id: $id, name: $name, image: $image, urlAudio: $urlAudio)';
  }
}
