//
//  StructGameView.swift
//  GameStream
//
//  Created by Joaquin Segovia on 13/2/22.
//

import Foundation

struct GameViewObject {
    var url: String
    var title: String
    var studio: String
    var calification: String
    var pubYear: String
    var description: String
    var tags: [String]
    var imgUrls: [String]
//    let url: String
//    let title: String
//    let studio: String
//    let calification: String
//    let pubYear: String
//    let description: String
//    let tags: [String]
//    let imgUrls: [String]
    
    init(game: Game) {
        url = game.videosUrls.mobile
        title = game.title
        studio = game.studio
        calification = game.contentRaiting
        pubYear = game.publicationYear
        description = game.description
        tags = game.tags
        imgUrls = game.galleryImages
    }
}
