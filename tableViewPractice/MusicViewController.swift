//
//  ContactsViewController.swift
//  tableViewPractice
//
//  Created by Srikanth Kyatham on 11/18/24.
//

import UIKit

class MusicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let songs = [
            ("The Kids Aren't Alright", "Fall Out Boy - Single", "song1"),
            ("Sorry", "Justin Bieber - Single", "song2"),
            ("Turn Your Love", "Half Moon Run - Single", "song3"),
            ("Blinding Lights", "The Weeknd - Single", "song4"),
            ("Shape of You", "Ed Sheeran - Single", "song5"),
            ("Levitating", "Dua Lipa - Future Nostalgia", "song6"),
            ("Someone Like You", "Adele - 21", "song7"),
            ("Rolling in the Deep", "Adele - 21", "song8"),
            ("Circles", "Post Malone - Hollywood's Bleeding", "song1"),
            ("Bohemian Rhapsody", "Queen - A Night at the Opera", "song2")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
    
        let song = songs[indexPath.row]
        
        cell.configure(with: song.0, subtitle: song.1, imageName: song.2)
        
        return cell
    }

}
