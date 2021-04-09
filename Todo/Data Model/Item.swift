//
//  Item.swift
//  Todo
//
//  Created by Charlie Botello on 4/8/21.
//

import Foundation

class Item: Encodable, Decodable {
    var title: String = ""
    var done: Bool = false
}
