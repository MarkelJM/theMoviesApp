//
//  TheMovieAppTests.swift
//  TheMovieAppTests
//
//  Created by Markel Juaristi on 8/6/23.
//

import XCTest
@testable import TheMovieApp

final class TheMovieAppTests: XCTestCase {
    
    var movieService: MovieService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        movieService = MovieService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movieService = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    
    func testMovieModel() throws {
        let movie = Movie(id: 1, title: "Test Movie", overview: "This is a test movie.", posterPath: "/test.jpg", voteAverage: 7.5)
        
        XCTAssertEqual(movie.id, 1)
        XCTAssertEqual(movie.title, "Test Movie")
        XCTAssertEqual(movie.overview, "This is a test movie.")
        XCTAssertEqual(movie.posterPath, "/test.jpg")
        XCTAssertEqual(movie.voteAverage, 7.5)
    }
    func testMovieListResponseModel() throws {
        let movie = Movie(id: 1, title: "Test Movie", overview: "This is a test movie.", posterPath: "/test.jpg", voteAverage: 7.5)
        let movieListResponse = MovieListResponse(page: 1, results: [movie])
        
        XCTAssertEqual(movieListResponse.page, 1)
        XCTAssertEqual(movieListResponse.results.first?.id, 1)
    }
    
    func testGetMovieListURL() throws {
        let url = movieService.getMovieListURLtest()
        XCTAssertNotNil(url)
    }

}
