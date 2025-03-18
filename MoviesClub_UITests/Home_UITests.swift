//
//  Home_UITests.swift
//  MoviesClub_UITests
//
//  Created by Ahmed Refat on 13/03/2025.
//

import XCTest

final class Home_UITests: XCTestCase {

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

    func tapMovieInSection(section: String, index: Int? = nil) {
        let sectionScrollView = app.scrollViews[section]
        XCTAssertTrue(waitForElement(sectionScrollView), "Failed to find section: \(section)")
        sleep(2)
    
        let movieItems = sectionScrollView.images.allElementsBoundByIndex
        
        var retryCount = 0
        while movieItems.isEmpty && retryCount < 3 {
            sleep(1)
            retryCount += 1
        }
        
        XCTAssertFalse(movieItems.isEmpty, "No movies found in section: \(section) after \(retryCount) retries")
        
        let selectedIndex = index ?? Int.random(in: 0..<movieItems.count)
        let movieToTap = movieItems[selectedIndex]
        
        XCTAssertTrue(waitForElement(movieToTap), "Failed to find movie at index \(selectedIndex) in section: \(section)")
        
        movieToTap.tap()
    }


    private func verifyDetailsScreen() {
        XCTAssertTrue(waitForElement(app.staticTexts["Overview"]), "Overview text not found")
        XCTAssertTrue(waitForElement(app.staticTexts["Similar Movies"]), "Similar Movies text not found")
        XCTAssertTrue(waitForElement(app.staticTexts["Tagline"]), "Tagline text not found")
    }

    // MARK: - Tests
    
    func testHomeScreen_initialLoad_shouldShowAllSections() throws {
        // Verify all sections exist
        XCTAssertTrue(waitForElement(app.staticTexts["Movies Club"]))
        XCTAssertTrue(waitForElement(app.staticTexts["Top Rated Movies"]))
        XCTAssertTrue(waitForElement(app.staticTexts["Now Playing Movies"]))
        XCTAssertTrue(waitForElement(app.staticTexts["Popular Movies"]))
        
        app.swipeUp()
        XCTAssertTrue(waitForElement(app.staticTexts["Upcoming Movies"]))
    }
    
    func testMovieDetail_backNavigation_shouldReturnToHome() throws {
        tapMovieInSection(section: "topRatedSection")
        
        verifyDetailsScreen()
        
        let backButton = app.buttons["backButton"]
        XCTAssertTrue(waitForElement(backButton))
        backButton.tap()
        
        XCTAssertTrue(waitForElement(app.staticTexts["Movies Club"]))
    }

    func testMovieNavigation_fromTopRated_randomMovie_shouldShowDetails() throws {
        tapMovieInSection(section: "topRatedSection")
        verifyDetailsScreen()
    }

    func testMovieNavigation_fromNowPlaying_randomMovie_shouldShowDetails() throws {
        tapMovieInSection(section: "nowPlayingSection")
        verifyDetailsScreen()
    }

    func testMovieNavigation_fromPopular_randomMovie_shouldShowDetails() throws {
        tapMovieInSection(section: "popularSection")
        verifyDetailsScreen()
    }

    func testMovieNavigation_fromUpcoming_randomMovie_shouldShowDetails() throws {
        tapMovieInSection(section: "upcomingSection")
        verifyDetailsScreen()
    }

    func testMovieNavigation_fromTopRated_firstMovie_shouldShowDetails() throws {
        tapMovieInSection(section: "topRatedSection", index: 0)
        verifyDetailsScreen()
    }
}
