//
//  VideoViewController.swift
//  Recap
//
//  Created by Morgan Dean on 7/16/19.
//  Copyright © 2019 Morgan Dean. All rights reserved.
//

import UIKit
import SnapKit

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded vidoe view")
        let fullDesc = UITextView();
        fullDesc.text = "This is a full text view with a bunch of infomraiton and a link to the video. We also ahve this stuff and thsi other stuff and this other stuff"
        fullDesc.textColor = .black
        self.view.addSubview(fullDesc)
        
        fullDesc.snp.makeConstraints({(make) -> Void in
            make.top.equalTo(self.view.subviews[0])
        })
        
        let shareButton = UIButton()
        shareButton.setTitle("Share", for: .normal)
        self.view.addSubview(shareButton)
        // Do any additional setup after loading the view.
    }
    

    @objc func share() {
        let textToShare = "Check out this video!"
        
        if let myWebsite = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4") {
            let objectsToShare: [Any] = [textToShare, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
