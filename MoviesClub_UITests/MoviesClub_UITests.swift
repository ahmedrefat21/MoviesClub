//
//  MoviesClub_UITests.swift
//  MoviesClub_UITests
//
//  Created by Ahmed Refat on 11/03/2025.
//

import XCTest

final class MoviesClub_UITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
    }
    
    // MARK: - Helper Functions
    
    func waitForElement(_ element: XCUIElement, timeout: TimeInterval = 10) -> Bool {
        return element.waitForExistence(timeout: timeout)
    }

    func tapMovieInSection(section: String) {
        let sectionScrollView = app.scrollViews[section]
        XCTAssertTrue(waitForElement(sectionScrollView), "Failed to find section: \(section)")
        
        let firstMovie = sectionScrollView.images.element(boundBy: 0)
        XCTAssertTrue(waitForElement(firstMovie), "Failed to find movie in section: \(section)")
        firstMovie.tap()
    }


    
    // MARK: - Tests
    
    func testHomeScreen_initialLoad_shouldShowAllSections() throws {
        // Verify all sections exist
        XCTAssertTrue(waitForElement(app.staticTexts["Movies Club"]))
        XCTAssertTrue(waitForElement(app.staticTexts["Top Rated Movies"]))
        XCTAssertTrue(waitForElement(app.staticTexts["Now Playing Movies"]))
        XCTAssertTrue(waitForElement(app.staticTexts["Popular Movies"]))
        
        // Scroll to see Upcoming section
        app.swipeUp()
        XCTAssertTrue(waitForElement(app.staticTexts["Upcoming Movies"]))
    }

    func testMovieNavigation_fromTopRated_shouldShowDetails() throws {
        tapMovieInSection(section: "topRatedSection")
        
        XCTAssertTrue(waitForElement(app.staticTexts["Overview"]), "Overview text not found")
        XCTAssertTrue(waitForElement(app.staticTexts["Similar Movies"]), "Similar Movies text not found")
    }
    
    
    
    func testMovieDetail_backNavigation_shouldReturnToHome() throws {
        // Navigate to movie detail
        tapMovieInSection(section: "topRatedSection")
        
        // Verify we're on detail screen
        XCTAssertTrue(waitForElement(app.staticTexts["Overview"]))
        
        // Navigate back
        let backButton = app.buttons["backButton"]
        XCTAssertTrue(waitForElement(backButton))
        backButton.tap()
        
        // Verify we're back on home screen
        XCTAssertTrue(waitForElement(app.staticTexts["Movies Club"]))
    }
    
    func testMovieDetail_similarMovies_shouldNavigateToNewDetail() throws {
        // Navigate to movie detail
        tapMovieInSection(section: "topRatedSection")
        
        // Find and tap first similar movie
        let similarMovies = app.scrollViews["similarMoviesList"]
        XCTAssertTrue(waitForElement(similarMovies))
        
        let firstSimilarMovie = similarMovies.images.firstMatch
        XCTAssertTrue(waitForElement(firstSimilarMovie))
        firstSimilarMovie.tap()
        
        // Verify we're on new detail screen
        XCTAssertTrue(waitForElement(app.staticTexts["Overview"]))
    }
}
