//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

@testable import Movie

import Domain
import Nimble
import XCTest

final class MoviesListViewModelTests: XCTestCase {

    @MainActor func test_OnAppear_CallsUseCase() async {
        let useCaseMock = FetchMoviesUseCaseMock()
        let sut = MoviesListViewModel(router: MoviesListRouterDummy(), fetchMoviesUseCase: useCaseMock)

        expect(useCaseMock.executeWasCalled).to(beFalse())

        sut.onAppear()

        await expect(useCaseMock.executeWasCalled).toEventually(beTrue())
    }

}

fileprivate final class FetchMoviesUseCaseMock: FetchMoviesUseCase {

    private(set) var executeWasCalled = false
    
    func execute() async throws -> [Movie] {
        executeWasCalled = true
        return []
    }

}

fileprivate final class MoviesListRouterDummy: MoviesListRouter {

    func movieTapped(_ movie: Domain.Movie) {}

}
