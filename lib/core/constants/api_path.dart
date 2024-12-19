
class ApiPath {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static const String postPath = "/posts";
  static const String postByIdPath = "/posts/{id}";
  static const String commentPath = "$postByIdPath/comments";
  static const String albumPath = "/albums";
  static const String photosByAlbumIdPath = "$albumPath/{albumId}/photos";
}