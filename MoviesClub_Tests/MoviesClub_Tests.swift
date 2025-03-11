//
//  MoviesClub_Tests.swift
//  MoviesClub_Tests
//
//  Created by Ahmed Refat on 06/03/2025.
//

import XCTest
@testable import MoviesClub

final class MoviesClub_Tests: XCTestCase {
    var mockUseCase: MockHomeUseCase!
    
    // Handlers
    var upcomingSUT: UpcomingWidget.UpcomingHandler!
    var popularSUT: PopularWidget.PopularHandler!
    var topRatedSUT: TopRatedWidget.TopRatedHandler!
    var nowPlayingSUT: NowPlayingWidget.NowPlayingHandler!
    
    @MainActor override func setUpWithError() throws {
        mockUseCase = MockHomeUseCase()
        upcomingSUT = UpcomingWidget.UpcomingHandler(useCase: mockUseCase)
        popularSUT = PopularWidget.PopularHandler(useCase: mockUseCase)
        topRatedSUT = TopRatedWidget.TopRatedHandler(useCase: mockUseCase)
        nowPlayingSUT = NowPlayingWidget.NowPlayingHandler(useCase: mockUseCase)
    }

    override func tearDown() {
        mockUseCase = nil
        upcomingSUT = nil
        popularSUT = nil
        topRatedSUT = nil
        nowPlayingSUT = nil
        super.tearDown()
    }
    
    // MARK: - Upcoming Movies Tests
    
    @MainActor func testUpcomingHandler_WhenFetchingSucceeds_ShouldUpdateMovies() async throws {
        // Given
        let expectedMovies = mockUseCase.mockUpcomingMovies.results
        
        // When
        await upcomingSUT.getUpcomingMovies()
        
        // Then
        XCTAssertEqual(upcomingSUT.upcomingMovies.count, expectedMovies.count)
        XCTAssertEqual(upcomingSUT.upcomingMovies[0].id, expectedMovies[0].id)
        XCTAssertEqual(upcomingSUT.upcomingMovies[0].title, expectedMovies[0].title)
        XCTAssertNil(upcomingSUT.errorMessage)
    }
    
    @MainActor func testUpcomingHandler_WhenFetchingFails_ShouldSetErrorMessage() async throws {
        // Given
        mockUseCase.shouldThrowError = true
        
        // When
        await upcomingSUT.getUpcomingMovies()
        
        // Then
        XCTAssertNotNil(upcomingSUT.errorMessage)
        XCTAssertEqual(upcomingSUT.upcomingMovies.count, 0)
    }
    
    // MARK: - Popular Movies Tests
    
    @MainActor func testPopularHandler_WhenFetchingSucceeds_ShouldUpdateMovies() async throws {
        // Given
        let expectedMovies = mockUseCase.mockPopularMovies.results
        
        // When
        await popularSUT.getPopularMovies()
        
        // Then
        XCTAssertEqual(popularSUT.popularMovies.count, expectedMovies.count)
        XCTAssertEqual(popularSUT.popularMovies[0].id, expectedMovies[0].id)
        XCTAssertEqual(popularSUT.popularMovies[0].title, expectedMovies[0].title)
        XCTAssertNil(popularSUT.errorMessage)
    }
    
    @MainActor func testPopularHandler_WhenFetchingFails_ShouldSetErrorMessage() async throws {
        // Given
        mockUseCase.shouldThrowError = true
        
        // When
        await popularSUT.getPopularMovies()
        
        // Then
        XCTAssertNotNil(popularSUT.errorMessage)
        XCTAssertEqual(popularSUT.popularMovies.count, 0)
    }
    
    // MARK: - Top Rated Movies Tests
    
    @MainActor func testTopRatedHandler_WhenFetchingSucceeds_ShouldUpdateMovies() async throws {
        // Given
        let expectedMovies = mockUseCase.mockTopRatedMovies.results
        
        // When
        await topRatedSUT.getTopRatedMovies()
        
        // Then
        XCTAssertEqual(topRatedSUT.topRatedMovies.count, expectedMovies.count)
        XCTAssertEqual(topRatedSUT.topRatedMovies[0].id, expectedMovies[0].id)
        XCTAssertEqual(topRatedSUT.topRatedMovies[0].title, expectedMovies[0].title)
        XCTAssertNil(topRatedSUT.errorMessage)
    }
    
    @MainActor func testTopRatedHandler_WhenFetchingFails_ShouldSetErrorMessage() async throws {
        // Given
        mockUseCase.shouldThrowError = true
        
        // When
        await topRatedSUT.getTopRatedMovies()
        
        // Then
        XCTAssertNotNil(topRatedSUT.errorMessage)
        XCTAssertEqual(topRatedSUT.topRatedMovies.count, 0)
    }
    
    // MARK: - Now Playing Movies Tests
    
    @MainActor func testNowPlayingHandler_WhenFetchingSucceeds_ShouldUpdateMovies() async throws {
        // Given
        let expectedMovies = mockUseCase.mockNowPlayingMovies.results
        
        // When
        await nowPlayingSUT.getNowPlayingMovies()
        
        // Then
        XCTAssertEqual(nowPlayingSUT.nowPlayingMovies.count, expectedMovies.count)
        XCTAssertEqual(nowPlayingSUT.nowPlayingMovies[0].id, expectedMovies[0].id)
        XCTAssertEqual(nowPlayingSUT.nowPlayingMovies[0].title, expectedMovies[0].title)
        XCTAssertNil(nowPlayingSUT.errorMessage)
    }
    
    @MainActor func testNowPlayingHandler_WhenFetchingFails_ShouldSetErrorMessage() async throws {
        // Given
        mockUseCase.shouldThrowError = true
        
        // When
        await nowPlayingSUT.getNowPlayingMovies()
        
        // Then
        XCTAssertNotNil(nowPlayingSUT.errorMessage)
        XCTAssertEqual(nowPlayingSUT.nowPlayingMovies.count, 0)
    }
}
