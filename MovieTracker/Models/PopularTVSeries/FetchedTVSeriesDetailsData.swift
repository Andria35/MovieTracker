//
//  FetchedTVSeriesDetailsData.swift
//  MovieTracker
//
//  Created by Luka Gazdeliani on 07.01.24.
//

import Foundation

struct FetchedTVSeriesDetailsData {
    var tvSeriesName: String = ""
    var tvSeriesReleaseDate: String = ""
    var tvSeriesOverview: String = ""
    var tvSeriesGenre: [Genre] = []
    var tvSeriesNumberOfSeasons: Int = 1
    var tvSeriesVoteAverage: Double = 1.0
    var formatedGenreString: String = ""
    var tvSeriesImageBackdropPath: String = ""
}
