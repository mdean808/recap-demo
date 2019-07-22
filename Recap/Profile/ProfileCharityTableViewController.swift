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

class ProfileCharityTableViewController: UITableViewController, CardDelegate{
    
    struct Charity {
        let title: String
        let desc: String
        let link: String
        let thumbnail: String
        let donation: Float
        let color: UIColor
    }
    
    var cards = true
    
    var charities = [Charity]()
    
    let demoCharity = Charity(title: "Ocean Conservancy", desc: "Saving the ocean one step at a time", link: "https://oceanconservancy.org/", thumbnail: "ocean.png", donation: 10.43, color: .blue)
    let demoCharity2 = Charity(title: "Hospice", desc: "Hospice Foundation of America", link: "https://hospicefoundation.org/Donate", thumbnail: "hospice.png", donation: 5.42, color: .red)
    let demoCharity3 = Charity(title: "Environmental Working Group", desc: "Know your environement. Protect your health.", link: "https://www.ewg.org/", thumbnail: "ewg.png", donation: 51.43, color: UIColor(red:0.09, green:0.68, blue:0.07, alpha:1.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        charities += [demoCharity]
        charities += [demoCharity2]
        charities += [demoCharity3]

    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return charities.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charity_cell", for: indexPath)
        let charity : Charity = charities[indexPath.row]
        
        let card = CardHighlight(frame: CGRect(x: 10, y: 30, width: cell.frame.width - 20, height: 250))
        
        card.backgroundColor = charity.color
        card.icon = UIImage(named: charity.thumbnail)
        card.title = charity.title
        card.itemTitle = charity.desc
        card.itemSubtitle = "$\(charity.donation) donated."
        card.textColor = UIColor.white
        card.hasParallax = true
        card.iconRadius = 0
        card.buttonText = "Visit"
        card.delegate = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cardContentVC = storyboard.instantiateViewController(withIdentifier: "charity_card_view")
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
        for charity in self.charities {
            if charity.title == card.title {
                let svc = SFSafariViewController(url: URL(string: charity.link)!)
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
