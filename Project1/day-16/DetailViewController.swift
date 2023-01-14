//
//  DetailViewController.swift
//  day-16
//
//  Created by Oyatullo Koraboev on 15/01/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    var selectedImage:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.image = UIImage(named: selectedImage)
    
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
}
