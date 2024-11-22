//
//  EatWellViewController.swift
//  IFitApp
//
//  Created by Sasha on 22.11.24.
//

import UIKit

class GetBurnViewController: UIViewController {

    var typeTraine: [LoginedApp]!
    var screenIndex = 1

    let imageView = UIImageView()
    let circularProgressView = UIProgressView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    

}
