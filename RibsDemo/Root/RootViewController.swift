//
//  RootViewController.swift
//  RibsDemo
//
//  Created by Kelvin Fok on 1/9/19.
//  Copyright © 2019 Kelvin Fok. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {

}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .red
    }
}
