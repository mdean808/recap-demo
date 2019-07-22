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
import SafariServices

class ProfileImageTableViewController: UITableViewController, CardDelegate{
    
    struct Image {
        let title: String
        let desc: String
        let image: String
        let color: UIColor
    }
    
    var cards = true
    
    var images = [Image]()
    
    let demoCharity = Image(title: "Ocean Conservancy", desc: "Saving the ocean one step at a time", image: "ocean.png", color: .blue)
     let demoCharity2 = Image(title: "Graphic Design", desc: "Nice Design", image: "ocean.png", color: .blue)
     let demoCharity3 = Image(title: "Ocean Conservancy", desc: "Saving the ocean one step at a time", image: "profile_tree.png", color: .red)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        images += [demoCharity]
        images += [demoCharity2]
        images += [demoCharity3]
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "image_cell", for: indexPath)
        let image : Image = images[indexPath.row]
        
        let card = CardHighlight(frame: CGRect(x: 10, y: 30, width: cell.frame.width - 20, height: 250))
        
        card.backgroundColor = image.color
        card.backgroundImage = UIImage(named: image.image)
        card.title = ""
        card.itemTitle = ""
        card.itemSubtitle = ""
        card.textColor = UIColor.white
        card.hasParallax = true
        card.iconRadius = 0
        card.buttonText = ""
        card.delegate = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cardContentVC = storyboard.instantiateViewController(withIdentifier: "image_card_view")
        card.shouldPresent(cardContentVC, from: self, fullscreen: true)
        
        cell.backgroundColor = .white
        UIView.animate(withDuration: 0.1, animations: {cell.alpha = 1.0},
                       completion: {(value: Bool) in
                        cell.addSubview(card)
        })
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300;
        
    }
    
    func cardHighlightDidTapButton(card: CardHighlight, button: UIButton) {
        for image in self.images {
            if image.title == image.title {
                let svc = SFSafariViewController(url: URL(string: image.image)!)
                present(svc, animated: true, completion: nil)
                
            }
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
