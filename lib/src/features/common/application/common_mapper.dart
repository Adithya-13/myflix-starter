import 'dart:math';

import 'package:myflix/src/features/data.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/services/remote/result.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class CommonMapper {
  static Result<Home> mapToHome(
    Result<MovieListResponse> result,
    Result<TopRatedListResponse> resultTopRated,
  ) {
    return result.when(
      success: (data) {
        final headerMovie = data.results?.first;
        return resultTopRated.when(
          success: (topRatedData) {
            return Result.success(
              Home(
                headerMovie: Movie(
                  id: headerMovie?.id ?? -1,
                  filmRate: (headerMovie?.voteAverage ?? 0.0).toString(),
                  categories: [],
                  imageUrl: headerMovie?.posterPath?.tmdbImage ?? '-',
                  match: generateMatchRandom(),
                  title: headerMovie?.title ?? '',
                  minutes: generateMatchRandom(),
                  releaseDate: headerMovie?.releaseDate?.toYyyyMMDd ?? '',
                  overview: headerMovie?.overview ?? '',
                  trailerUrl: dummyVideoUrl,
                  videoUrl: dummyVideoUrl,
                ),
                movieListItems: [
                  MovieListItem(
                    title: 'Movies',
                    movieItems: data.results
                            ?.map((item) => Movie(
                                  id: item.id ?? -1,
                                  filmRate:
                                      (item.voteAverage ?? 0.0).toString(),
                                  categories: [],
                                  imageUrl: item.posterPath?.tmdbImage ?? '-',
                                  match: generateMatchRandom(),
                                  title: item.title ?? '',
                                  minutes: generateMatchRandom(),
                                  releaseDate:
                                      item.releaseDate?.toYyyyMMDd ?? '',
                                  overview: item.overview ?? '',
                                  trailerUrl: dummyVideoUrl,
                                  videoUrl: dummyVideoUrl,
                                ))
                            .toList() ??
                        [],
                  ),
                  MovieListItem(
                    title: 'Top Rated',
                    movieItems: topRatedData.results
                            ?.map((item) => Movie(
                                  id: item.id ?? -1,
                                  filmRate:
                                      (item.voteAverage ?? 0.0).toString(),
                                  categories: [],
                                  imageUrl: item.posterPath?.tmdbImage ?? '-',
                                  match: generateMatchRandom(),
                                  title: item.title ?? '',
                                  minutes: generateMatchRandom(),
                                  releaseDate:
                                      item.releaseDate?.toYyyyMMDd ?? '',
                                  overview: item.overview ?? '',
                                  trailerUrl: dummyVideoUrl,
                                  videoUrl: dummyVideoUrl,
                                ))
                            .toList() ??
                        [],
                  ),
                ],
              ),
            );
          },
          failure: (error, stackTrace) {
            return Result.failure(error, stackTrace);
          },
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  static double generateMatchRandom() {
    Random random = Random();

    // Generate a random number between 70 and 100
    return random.nextInt(31) + 70;
  }

  static Result<Movie> mapToMovieDetail(Result<MovieDetailResponse> result) {
    return result.when(
      success: (item) {
        return Result.success(
          Movie(
            id: item.id ?? -1,
            filmRate: (item.voteAverage ?? 0.0).toString(),
            categories: [],
            imageUrl: item.posterPath?.tmdbImage ?? '-',
            match: generateMatchRandom(),
            title: item.title ?? '',
            minutes: generateMatchRandom(),
            releaseDate: item.releaseDate?.toYyyyMMDd ?? '',
            overview: item.overview ?? '',
            trailerUrl: dummyVideoUrl,
            videoUrl: dummyVideoUrl,
          ),
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  static Result<List<Movie>> mapToMovieList(Result<MovieListResponse> result) {
    return result.when(
      success: (data) {
        return Result.success(
          data.results
                  ?.map((item) => Movie(
                        id: item.id ?? -1,
                        filmRate: (item.voteAverage ?? 0.0).toString(),
                        categories: [],
                        imageUrl: item.posterPath?.tmdbImage ?? '-',
                        match: generateMatchRandom(),
                        title: item.title ?? '',
                        minutes: generateMatchRandom(),
                        releaseDate: item.releaseDate?.toYyyyMMDd ?? '',
                        overview: item.overview ?? '',
                        trailerUrl: dummyVideoUrl,
                        videoUrl: dummyVideoUrl,
                      ))
                  .toList() ??
              [],
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  static Result<Popular> mapToPopular(Result<PopularListResponse> result) {
    return result.when(
      success: (data) {
        return Result.success(
          Popular(
            data.totalPages ?? 1,
            data.results
                    ?.map((item) => Movie(
                          id: item.id ?? -1,
                          filmRate: (item.voteAverage ?? 0.0).toString(),
                          categories: [],
                          imageUrl: item.posterPath?.tmdbImage ?? '-',
                          match: generateMatchRandom(),
                          title: item.title ?? '',
                          minutes: generateMatchRandom(),
                          releaseDate: item.releaseDate?.toYyyyMMDd ?? '',
                          overview: item.overview ?? '',
                          trailerUrl: dummyVideoUrl,
                          videoUrl: dummyVideoUrl,
                        ))
                    .toList() ??
                [],
          ),
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}
