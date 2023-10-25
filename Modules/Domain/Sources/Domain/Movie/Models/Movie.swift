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
}
