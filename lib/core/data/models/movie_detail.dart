import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final List<Genre> genres;
  final int runtime;
  final String status;
  final String originalTitle;
  final String originalLanguage;
  final double popularity;
  final bool adult;
  final String? homepage;
  final String? tagline;
  final ProductionCountry? productionCountries;
  final List<ProductionCompany> productionCompanies;
  final int budget;
  final int revenue;

  const MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.genres,
    required this.runtime,
    required this.status,
    required this.originalTitle,
    required this.originalLanguage,
    required this.popularity,
    required this.adult,
    this.homepage,
    this.tagline,
    this.productionCountries,
    required this.productionCompanies,
    required this.budget,
    required this.revenue,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] ?? 0.0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      releaseDate: json['release_date'] ?? '',
      genres: (json['genres'] as List<dynamic>?)
              ?.map((genre) => Genre.fromJson(genre))
              .toList() ??
          [],
      runtime: json['runtime'] ?? 0,
      status: json['status'] ?? '',
      originalTitle: json['original_title'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      popularity: (json['popularity'] ?? 0.0).toDouble(),
      adult: json['adult'] ?? false,
      homepage: json['homepage'],
      tagline: json['tagline'],
      productionCountries: json['production_countries'] != null &&
              (json['production_countries'] as List).isNotEmpty
          ? ProductionCountry.fromJson(
              (json['production_countries'] as List).first)
          : null,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
              ?.map((company) => ProductionCompany.fromJson(company))
              .toList() ??
          [],
      budget: json['budget'] ?? 0,
      revenue: json['revenue'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        voteAverage,
        voteCount,
        releaseDate,
        genres,
        runtime,
        status,
        originalTitle,
        originalLanguage,
        popularity,
        adult,
        homepage,
        tagline,
        productionCountries,
        productionCompanies,
        budget,
        revenue,
      ];
}

class Genre extends Equatable {
  final int id;
  final String name;

  const Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  @override
  List<Object> get props => [id, name];
}

class ProductionCountry extends Equatable {
  final String iso31661;
  final String name;

  const ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'] ?? '',
      name: json['name'] ?? '',
    );
  }

  @override
  List<Object> get props => [iso31661, name];
}

class ProductionCompany extends Equatable {
  final int id;
  final String name;
  final String? logoPath;
  final String? originCountry;

  const ProductionCompany({
    required this.id,
    required this.name,
    this.logoPath,
    this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logoPath: json['logo_path'],
      originCountry: json['origin_country'],
    );
  }

  @override
  List<Object?> get props => [id, name, logoPath, originCountry];
}

// Cast & Crew Models
class MovieCredits extends Equatable {
  final int id;
  final List<Cast> cast;
  final List<Crew> crew;

  const MovieCredits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieCredits.fromJson(Map<String, dynamic> json) {
    print(
        'Parsing MovieCredits - Raw JSON keys: ${json.keys.toList()}'); // Debug log

    final castData = json['cast'] as List<dynamic>?;
    final crewData = json['crew'] as List<dynamic>?;

    print('Cast array length: ${castData?.length ?? 0}'); // Debug log
    print('Crew array length: ${crewData?.length ?? 0}'); // Debug log

    return MovieCredits(
      id: json['id'] ?? 0,
      cast: castData?.map((castMember) => Cast.fromJson(castMember)).toList() ??
          [],
      crew: crewData?.map((crewMember) => Crew.fromJson(crewMember)).toList() ??
          [],
    );
  }

  @override
  List<Object> get props => [id, cast, crew];
}

class Cast extends Equatable {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  const Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      adult: json['adult'] ?? false,
      gender: json['gender'] ?? 0,
      id: json['id'] ?? 0,
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: (json['popularity'] ?? 0.0).toDouble(),
      profilePath: json['profile_path'],
      castId: json['cast_id'] ?? 0,
      character: json['character'] ?? '',
      creditId: json['credit_id'] ?? '',
      order: json['order'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        order,
      ];
}

class Crew extends Equatable {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;

  const Crew({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      adult: json['adult'] ?? false,
      gender: json['gender'] ?? 0,
      id: json['id'] ?? 0,
      knownForDepartment: json['known_for_department'] ?? '',
      name: json['name'] ?? '',
      originalName: json['original_name'] ?? '',
      popularity: (json['popularity'] ?? 0.0).toDouble(),
      profilePath: json['profile_path'],
      creditId: json['credit_id'] ?? '',
      department: json['department'] ?? '',
      job: json['job'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        creditId,
        department,
        job,
      ];
}

// Video/Trailer Models
class MovieVideos extends Equatable {
  final int id;
  final List<Video> results;

  const MovieVideos({
    required this.id,
    required this.results,
  });

  factory MovieVideos.fromJson(Map<String, dynamic> json) {
    print(
        'Parsing MovieVideos - Raw JSON keys: ${json.keys.toList()}'); // Debug log

    final resultsData = json['results'] as List<dynamic>?;
    print('Videos array length: ${resultsData?.length ?? 0}'); // Debug log

    if (resultsData != null && resultsData.isNotEmpty) {
      for (int i = 0; i < resultsData.length && i < 3; i++) {
        final video = resultsData[i];
        print(
            'Video $i: type=${video['type']}, site=${video['site']}, name=${video['name']}'); // Debug log
      }
    }

    return MovieVideos(
      id: json['id'] ?? 0,
      results:
          resultsData?.map((video) => Video.fromJson(video)).toList() ?? [],
    );
  }

  @override
  List<Object> get props => [id, results];
}

class Video extends Equatable {
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  const Video({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      iso6391: json['iso_639_1'] ?? '',
      iso31661: json['iso_3166_1'] ?? '',
      name: json['name'] ?? '',
      key: json['key'] ?? '',
      site: json['site'] ?? '',
      size: json['size'] ?? 0,
      type: json['type'] ?? '',
      official: json['official'] ?? false,
      publishedAt: json['published_at'] ?? '',
      id: json['id'] ?? '',
    );
  }

  @override
  List<Object> get props => [
        iso6391,
        iso31661,
        name,
        key,
        site,
        size,
        type,
        official,
        publishedAt,
        id,
      ];
}
