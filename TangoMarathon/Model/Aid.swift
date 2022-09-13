//
//  Aid.swift
//  TangoMarathon
//
//  Created by 竹田智哉 on 2022/09/13.
//

import Foundation
import CoreLocation

struct Aid: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var isCheckPoint: Bool
    var message: String

    var totalDist: Double
    var nextDist: Double

    var drinks: Drinks
    var foods: Foods

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

struct Drinks: Hashable, Codable {
    var hasSports: Bool
    var hasSp: Bool
    var hasHot: Bool
    var hasCoke: Bool
}

struct Foods: Hashable, Codable {
    var hasPine: Bool
    var bread: [String]
    var snack: [String]
    var jelly: [String]
    var dish: [String]
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
