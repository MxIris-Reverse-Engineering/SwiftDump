//
//  SwiftDumpTests.swift
//  SwiftDumpTests
//
//  Created by JH on 2024/7/7.
//  Copyright © 2024 nw. All rights reserved.
//

import XCTest
@testable import SwiftDump

final class SwiftDumpTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let file = "/Volumes/Repositories/Private/Fork/Library/resymbol/Tests/resymbolTests/IDESourceEditor_x86_64"
        let loader = SDFileLoader(file: file);
        let isSuccess: Bool = loader.load(cpu: .x86_64);
        if (!isSuccess) {
            LogError("fail to load file")
            return;
        }
        let parser = SDParser(with: loader);
        parser.parseSwiftProtos(); // find all Protocol
        parser.parseSwiftType(); // find all Type
        parser.parseSwiftProto(); // parse after Protocol & Type
        parser.parseSwiftOCClass();
        
        parser.dumpAll();
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
