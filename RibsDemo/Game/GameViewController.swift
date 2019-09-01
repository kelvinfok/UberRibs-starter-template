//
//  GameViewController.swift
//  RibsDemo
//
//  Created by Kelvin Fok on 1/9/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol GamePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class GameViewController: UIViewController, GamePresentable, GameViewControllable {

    weak var listener: GamePresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .orange
    }
}
