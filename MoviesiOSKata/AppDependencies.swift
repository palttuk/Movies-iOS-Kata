//
//  PoorsManCompositionRoot.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 5/11/16.
//  Copyright © 2016 xurxodev. All rights reserved.
//

import UIKit


class AppDependencies{
    
    var movieRepository:MovieRepository!
    var moviesPresenter: MoviesPresenter!
    var getMoviesUseCase: GetMoviesUseCase!
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {

        let viewController = moviesTableViewController(window)
        
        viewController.setMoviesPresenter(moviesPresenter)
    }
    
    func configureDependencies() {
        movieRepository = DiskMovieRepository()
        getMoviesUseCase = GetMoviesUseCase(movieRepository: movieRepository)
        moviesPresenter = MoviesPresenter(getMoviesUseCase: getMoviesUseCase)
    }
    
    func moviesTableViewController(_ window: UIWindow) -> MoviesViewController {
        let navigationController = navigationControllerFromWindow(window)
        
        let moviesTableViewController = navigationController.visibleViewController as! MoviesViewController
        
        return moviesTableViewController
    }
    
    func navigationControllerFromWindow(_ window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }
}
