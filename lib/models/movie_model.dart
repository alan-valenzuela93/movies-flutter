
class Movie {
  Movie(
      {required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
      required this.adult,
      required this.backdropPath,
      this.belongsToCollection,
      required this.budget,
     // required this.genres,
      required this.homepage,
      required this.id,
      required this.imdbId,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath});

  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  bool adult;
  String backdropPath;
  dynamic belongsToCollection;
  int budget;
  //List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        status: json["status"] ?? '',
        tagline: json["tagline"] ?? '',
        title: json["title"] ?? '',
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? '',
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"] ?? 0,
        //genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"] ?? '',
        id: json["id"] ?? '',
        imdbId: json["imdb_id"] ?? '',
        originalLanguage: json["original_language"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        //"genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}
