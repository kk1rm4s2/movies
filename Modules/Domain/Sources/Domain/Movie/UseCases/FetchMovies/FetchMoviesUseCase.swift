//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

public protocol FetchMoviesUseCase {

    func execute() async throws -> [Movie]
    
}
