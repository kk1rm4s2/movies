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
        let sut = MoviesListViewModel(router: MoviesListRouterMock(), fetchMoviesUseCase: useCaseMock)

        expect(useCaseMock.executeWasCalled).to(beFalse())

        sut.onAppear()

        await expect(useCaseMock.executeWasCalled).toEventually(beTrue())
    }

    @MainActor func test_MovieTapped_CallsRouter() {
        let routerMock = MoviesListRouterMock()
        let sut = MoviesListViewModel(router: routerMock, fetchMoviesUseCase: FetchMoviesUseCaseMock())

        expect(routerMock.movieTappedArgumentPassed).to(beNil())
        expect(routerMock.movieTappedWasCalled).to(beFalse())

        sut.movieTapped(1)

        expect(routerMock.movieTappedArgumentPassed).toNot(beNil())
        expect(routerMock.movieTappedWasCalled).to(beTrue())
    }

}

fileprivate final class FetchMoviesUseCaseMock: FetchMoviesUseCase {

    private(set) var executeWasCalled = false
    
    func execute() async throws -> [Movie] {
        executeWasCalled = true
        return []
    }

}

fileprivate final class MoviesListRouterMock: MoviesListRouter {

    private(set) var movieTappedWasCalled = false
    private(set) var movieTappedArgumentPassed: Int? = nil

    func movieTapped(_ id: Int) {
        movieTappedWasCalled = true
        movieTappedArgumentPassed = id
    }

}
