//
//  MessageStore.swift
//  SocialHunter
//
//  Created by Apple on 10/11/21.
//

import Foundation
import UIKit
struct MessageStore {
    static func getAll() -> [Message] {
        return [
            Message(text: "Lorem ipsum dolor sit amet", image: UIImage(), side: .left),
            Message(text: "Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", image: UIImage(), side: .left),
            Message(text: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae", image: UIImage(), side: .right),
            Message(text: "Excepteur sint occaecat cupidatat non proident", image: UIImage(), side: .left),
            Message(text: "Sed ut perspiciatis", image: UIImage(), side: .right),
            Message(text: "qui dolorem ipsum quia dolor sit amet, consectetur", image: UIImage(), side: .left),
        ]
    }
}
