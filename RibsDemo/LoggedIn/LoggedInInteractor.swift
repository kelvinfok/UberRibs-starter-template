//
//  LoggedInInteractor.swift
//  RibsDemo
//
//  Created by Kelvin Fok on 1/9/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import RIBs
import RxSwift

protocol LoggedInRouting: Routing {
    func routeToGame()
    func routeToOffGame()
    func cleanupViews()
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoggedInListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoggedInInteractor: Interactor, LoggedInInteractable, OffGameListener {

    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?
    
    func runGame() {
        router?.routeToGame()
    }

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
}
