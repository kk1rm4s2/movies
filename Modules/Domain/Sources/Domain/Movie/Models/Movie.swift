//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Foundation

public struct Movie: Hashable {
    public let id: Int
    public let title: String
    public let description: String
    public let date: String
    public let posterURL: URL

    public init(id: Int, title: String, description: String, date: String, posterURL: URL) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.posterURL = posterURL
    }
}
