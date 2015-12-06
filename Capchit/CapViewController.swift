//
//  CapViewController.swift
//  Capchit
//
//  Created by AJ Ibraheem on 06/12/2015.
//  Copyright © 2015 The Leaf. All rights reserved.
//

import UIKit

class CapViewController: UIViewController {
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var playButton:UIButton!
    
    var cap:Cap!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = cap.title
        descriptionLabel.text = cap.description
        imageView.image = cap.image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
