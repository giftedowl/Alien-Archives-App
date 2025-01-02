//
//  Aliens_Archive_Tests.swift
//  Aliens Archive Tests
//
//  Created by John Lane on 12/30/24.
//

import Testing
import XCTest
@testable import Aliens_Archive

final class Aliens_Archive_Tests: XCTestCase {

    func testSpeciesRendered() throws {
        let species = Species(title: "The Grays", content: "Little green men.")

        XCTAssertEqual(species.title.rendered, "The Grays")
        XCTAssertEqual(species.content.rendered, "Little green men")
    }
}
