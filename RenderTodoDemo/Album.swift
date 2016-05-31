//
//  Album.swift
//  RenderTodoDemo
//

import Foundation

private let covers = [UIImage(named: "cover")!]

private let titles = ["Aa"]

private let artits = ["Brian Eno"]

func ==(lhs: Album, rhs: Album) -> Bool {
    return lhs.id == rhs.id
}

class Album: Equatable {
    
    let id = NSUUID().UUIDString
    let title: String
    let artist: String
    let cover: UIImage
    var featured: Bool
    
    init(featured: Bool = false) {
        let idx = randomInt(0, max: covers.count-1)
        self.title = titles[idx]
        self.artist = artits[idx]
        self.cover = covers[idx]
        self.featured = featured
    }    
}
