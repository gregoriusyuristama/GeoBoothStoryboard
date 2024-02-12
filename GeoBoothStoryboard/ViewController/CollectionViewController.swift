//
//  ViewController.swift
//  GeoBoothStoryboard
//
//  Created by Gregorius Yuristama Nugraha on 2/12/24.
//

import UIKit

class CollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }


    @IBAction func rightNavButtonTap(_ sender: Any) {
        performSegue(withIdentifier: "showModalSegue", sender: self)
    }
}

