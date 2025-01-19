//
//  SpeciesViewModelTests.swift
//  Aliens Archive Tests
//
//  Created by John Lane on 1/19/25.
//

import XCTest
@testable import Aliens_Archive

final class SpeciesViewModelTests: XCTestCase {

    var speciesViewModel: SpeciesViewModel!

    override func setUpWithError() throws {
        speciesViewModel = SpeciesViewModel(service: MockService())
    }

    override func tearDownWithError() throws {
        speciesViewModel = nil
    }

    func testFetchAllSpecies() throws {
        let expectation = XCTestExpectation(description: "Fetch data completes")

        Task {
            await speciesViewModel.fetchAllSpecies()
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(speciesViewModel.species.count, 1)

        let predator = speciesViewModel.species.first!
        XCTAssertEqual(predator.name, "The Predator")
        XCTAssertEqual(predator.excerpt, "A species of alien hunters from the Predator movie franchise.")
        XCTAssertEqual(predator.featuredMedia, 81)

        XCTAssertEqual(predator.abilities.technological, "advanced hunting technology")
        XCTAssertEqual(predator.culture.planet, "Yautja Prime")
        XCTAssertEqual(predator.personality.intelligence, "intelligent, strategic, and methodical")
        XCTAssertEqual(predator.physical.mouth, "features four external mandibles")
    }
}
