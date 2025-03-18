//
//  Search_UITests.swift
//  MoviesClub_UITests
//
//  Created by Ahmed Refat on 12/03/2025.
//

import XCTest

final class Search_UITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    // MARK: - Helper Functions
    
    func navigateToSearch() {
        let searchButton = app.buttons["magnifyingglass"]
        XCTAssertTrue(searchButton.waitForExistence(timeout: 5), "Search button not found")
        searchButton.tap()
    }
    
    func enterSearchText(_ text: String) {
        let searchField = app.textFields["searchTextField"]
        XCTAssertTrue(searchField.waitForExistence(timeout: 5), "Search field not found")
        searchField.tap()
        searchField.typeText(text)
    }
    

    func waitForSearchResults() -> Bool {
        let movieImage = app.images["searchMovieImage"].firstMatch
        return movieImage.waitForExistence(timeout: 10)
    }
    
    // MARK: - Tests

    func testSearch_initialState() throws {
        // When
        navigateToSearch()
        
        // Then
        XCTAssertTrue(app.staticTexts["Search"].exists, "Search title not found")
        XCTAssertTrue(app.textFields["searchTextField"].exists, "Search field not found")
        XCTAssertTrue(app.staticTexts["Please enter your movie you want to search for"].exists, "Initial message not found")
    }
    
    func testSearch_emptyQuery_shouldShowInitialState() throws {
        // Given
        navigateToSearch()
        
        // When
        enterSearchText("")
        
        // Then
        XCTAssertTrue(app.staticTexts["Please enter your movie you want to search for"].exists)
    }
        
    func testSearch_invalidQuery_shouldShowEmptyState() throws {
        // Given
        navigateToSearch()
        
        // When
        enterSearchText("xyzabc123nonexistentmovie")
        
        // Then
        let emptyMessage = app.staticTexts["We are sorry, we cannot find the movie"]
        XCTAssertTrue(emptyMessage.waitForExistence(timeout: 5), "Empty state message not found")
    }
    
    func testSearch_backNavigation_shouldReturnToHome() throws {
        // Given
        navigateToSearch()
        
        // When
        let backButton = app.buttons["backButton"]
        XCTAssertTrue(backButton.waitForExistence(timeout: 5), "Back button not found")
        backButton.tap()
        
        // Then
        XCTAssertTrue(app.staticTexts["Movies Club"].waitForExistence(timeout: 5), "Did not return to home screen")
    }
}
