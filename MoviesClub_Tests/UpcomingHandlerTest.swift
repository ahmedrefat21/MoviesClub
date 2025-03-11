//
//  UpcomingHandlerTest.swift
//  MoviesClub_Tests
//
//  Created by Ahmed Refat on 06/03/2025.
//

import XCTest
@testable import MoviesClub

final class UpcomingHandlerTest: XCTestCase {

    var mockUseCase: MockHomeUseCase!
    var sut: UpcomingWidget.UpcomingHandler! // system under test
    
    @MainActor override func setUpWithError() throws {
        mockUseCase = MockHomeUseCase()
        sut = UpcomingWidget.UpcomingHandler(useCase: mockUseCase)
    }

    override func tearDownWithError() throws {
        mockUseCase = nil
        sut = nil
    }

    @MainActor func testUpcomingHandler_WhenFetchingSucceeds_ShouldUpdateMovies() async throws {
        // Given
        let expectedMovies = mockUseCase.mockUpcomingMovies.results
        
        // When
        await sut.getUpcomingMovies()
        
        // Then
        XCTAssertEqual(sut.upcomingMovies.count, expectedMovies.count)
        XCTAssertEqual(sut.upcomingMovies[0].id, expectedMovies[0].id)
        XCTAssertEqual(sut.upcomingMovies[0].title, expectedMovies[0].title)
        XCTAssertEqual(sut.upcomingMovies[1].id, expectedMovies[1].id)
        XCTAssertEqual(sut.upcomingMovies[1].title, expectedMovies[1].title)
        XCTAssertNil(sut.errorMessage)
    }
    
    @MainActor func testUpcomingHandler_WhenFetchingFails_ShouldSetErrorMessage() async throws {
        // Given
        mockUseCase.shouldThrowError = true
        
        // When
        await sut.getUpcomingMovies()
        
        // Then
        XCTAssertNotNil(sut.errorMessage)
        XCTAssertEqual(sut.upcomingMovies.count, 0)
    }

}
