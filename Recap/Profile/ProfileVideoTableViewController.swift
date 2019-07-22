//
//  ProfileVideoTableViewController.swift
//  Recap
//
//  Created by Morgan Dean on 7/14/19.
//  Copyright © 2019 Morgan Dean. All rights reserved.
//

import UIKit
import Cards
import SnapKit

class ProfileVideoTableViewController: UITableViewController {

    struct Video {
        let title: String
        let authors: String
        let desc: String
        let link: String
        let thumbnail: String
    }
    
    var cards = true
    
    var videos = [Video]()
    
    let demoVideo = Video(title: "My First Video", authors: "Morgan Dean", desc: "this is my first video!!", link: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4", thumbnail: "profile_tree.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        videos += [demoVideo]

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "video_cell", for: indexPath)
        let video : Video = videos[indexPath.row]
    
            let card = CardPlayer(frame: CGRect(x: 10, y: 25, width: cell.frame.width - 20, height: 280))
            card.backgroundColor = UIColor(red:0.46, green:0.77, blue:0.20, alpha:1.0)
            card.videoSource = URL(string: video.link)
            card.shouldDisplayPlayer(from: self)
        
            card.playerCover = UIImage(named: video.thumbnail)!
            card.playImage = UIImage(named: "play.png")!
            card.isAutoplayEnabled = false
            card.shouldRestartVideoWhenPlaybackEnds = true
            
            card.title = video.title
            card.subtitle = video.desc
            card.category = "By \(video.authors)"
            card.textColor = .white
            card.hasParallax = true
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let cardContentVC = storyboard.instantiateViewController(withIdentifier: "video_card_view")
            card.shouldPresent(cardContentVC, from: self, fullscreen: true)
            
            cell.backgroundColor = .white
            UIView.animate(withDuration: 0.1, animations: {cell.alpha = 1.0},
                           completion: {(value: Bool) in
                            cell.addSubview(card)
            })
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cards {
            return 330;
        } else {
            return 150;
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)

    }
}
