//
//  FirstViewController.swift
//  Recap
//
//  Created by Morgan Dean on 7/13/19.
//  Copyright © 2019 Morgan Dean. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var writingGroup: UIView!
    @IBOutlet weak var videoGroup: UIView!
    @IBOutlet weak var charityGroup: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set up tap recognizers
        let writingTap = UITapGestureRecognizer(target: self, action: #selector(self.writingTapped))
        writingTap.numberOfTapsRequired = 1
        writingTap.numberOfTouchesRequired = 1
        writingGroup.addGestureRecognizer(writingTap);
        
        let videoTap = UITapGestureRecognizer(target: self, action: #selector(self.videoTapped))
        videoTap.numberOfTapsRequired = 1
        videoTap.numberOfTouchesRequired = 1
        videoGroup.addGestureRecognizer(videoTap);

        let charityTap = UITapGestureRecognizer(target: self, action: #selector(self.charityTapped))
        charityTap.numberOfTapsRequired = 1
        charityTap.numberOfTouchesRequired = 1
        charityGroup.addGestureRecognizer(charityTap);
        
        
        // Load leaf data
        for leaf in writingGroup.subviews {
            // round view
            if leaf.tag == 1 {
                leaf.layer.borderColor = UIColor.black.cgColor
                leaf.layer.borderWidth = 1
                
                let thumbnailView = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
                thumbnailView.layer.masksToBounds = true;
                thumbnailView.image = UIImage(named: "profile_thumbnail.png")
                leaf.addSubview(thumbnailView)
            }
        }
        for leaf in videoGroup.subviews {
            // round view
            if leaf.tag == 1 {
                leaf.layer.borderColor = UIColor.black.cgColor
                leaf.layer.borderWidth = 1
                // Load the thumbnail
                let thumbnailView = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
                thumbnailView.layer.masksToBounds = true;
                thumbnailView.image = UIImage(named: "profile_thumbnail.png")
                leaf.addSubview(thumbnailView)
            }
        }
        for leaf in charityGroup.subviews {
            // round view
            if leaf.tag == 1 {
                leaf.layer.borderColor = UIColor.black.cgColor
                leaf.layer.borderWidth = 1
            
                // load the thumbnail
                let thumbnailView = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
                thumbnailView.layer.masksToBounds = true;
                thumbnailView.image = UIImage(named: "profile_thumbnail.png")
                leaf.addSubview(thumbnailView)
            }
        }
    }
    
    
    // Section Tapping Functions
    @objc func writingTapped(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.2, animations: {self.writingGroup.transform = CGAffineTransform(scaleX: 1.075, y: 1.096)},
            completion: {finish in
                UIButton.animate(withDuration: 0.1, animations: {
                    self.writingGroup.transform = CGAffineTransform.identity
                    print("Writing UIView ended, loading list view")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "image_nav")
                   self.present(vc, animated:true, completion: nil)

            })
        })
    }
    @objc func videoTapped(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.2, animations: {self.videoGroup.transform = CGAffineTransform(scaleX: 1.075, y: 1.096)},
            completion: {finish in
                UIButton.animate(withDuration: 0.1, animations: {
                    self.videoGroup.transform = CGAffineTransform.identity
                    print("Video UIView ended, loading list view")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "video_nav")
                    self.present(vc, animated:true, completion: nil)
                })
        })
    }
    @objc func charityTapped(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.2, animations: {self.charityGroup.transform = CGAffineTransform(scaleX: 1.075, y: 1.096)},
            completion: {finish in
                UIButton.animate(withDuration: 0.1, animations: {
                self.charityGroup.transform = CGAffineTransform.identity
                print("Charity UIView ended, loading list view")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "charity_nav")
                    self.present(vc, animated:true, completion: nil)
            })
        })
    }
}

