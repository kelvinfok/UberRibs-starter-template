//
//  LoggedInRouter.swift
//  RibsDemo
//
//  Created by Kelvin Fok on 1/9/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable, OffGameListener, GameListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    func present(vc: ViewControllable)
    func dismiss(vc: ViewControllable)
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {
    
    private let offGameBuilder: OffGameBuildable
    private var offGame: ViewableRouting?
    
    private let gameBuilder: GameBuildable
    private var game: ViewableRouting?

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable,
         offGameBuilder: OffGameBuildable,
         gameBuilder: GameBuildable) {
        self.viewController = viewController
        self.offGameBuilder = offGameBuilder
        self.gameBuilder = gameBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }

    // MARK: - Private

    private let viewController: LoggedInViewControllable
    private var currentChild: ViewableRouting?
    
    override func didLoad() {
        super.didLoad()
        attachOffGame()
    }
    
    private func attachOffGame() {
        let offGame = offGameBuilder.build(withListener: interactor)
        self.currentChild = offGame
        attachChild(offGame)
        viewController.present(vc: offGame.viewControllable)
    }
    
    func cleanupViews() {
        if let currentChild = currentChild {
            viewController.dismiss(vc: currentChild.viewControllable)
        }
    }
    
    private func detachCurrentChild() {
        if let currentChild = currentChild {
            detachChild(currentChild)
            viewController.dismiss(vc: currentChild.viewControllable)
        }
    }
    
    func routeToGame() {
        detachCurrentChild()
        let game = gameBuilder.build(withListener: interactor)
        self.currentChild = game
        attachChild(game)
        viewController.present(vc: game.viewControllable)
    }
    
    func routeToOffGame() {
        cleanupViews()
        attachOffGame()
    }
    
}
