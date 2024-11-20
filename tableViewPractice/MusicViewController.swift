//
//  ContactsViewController.swift
//  tableViewPractice
//
//  Created by Srikanth Kyatham on 11/18/24.
//
import AVFoundation
import UIKit

class MusicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var audioPlayer : AVAudioPlayer?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nowPlayingView: UIView!
    @IBOutlet weak var nowPlayingImageView: UIImageView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nowPlayingArtistLabel: UILabel!
    @IBOutlet weak var nowPlayingTitleLabel: UILabel!
    
    let songs = [
        ("The Kids Aren't Alright", "Fall Out Boy - Single", "song1", "song1"),
        ("Sorry", "Justin Bieber - Single", "song2","song1"),
        ("Turn Your Love", "Half Moon Run - Single", "song3","song3"),
        ("Blinding Lights", "The Weeknd - Single", "song4", "song4"),
        ("Shape of You", "Ed Sheeran - Single", "song5","song5"),
        ("Levitating", "Dua Lipa - Future Nostalgia", "song6","song6"),
        ("Someone Like You", "Adele - 21", "song7","song7"),
        ("Rolling in the Deep", "Adele - 21", "song8","song8"),
        ("Circles", "Post Malone - Hollywood's Bleeding", "song1", "song1"),
        ("Bohemian Rhapsody", "Queen - A Night at the Opera", "song2","song2")
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
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        playSong(named : song.3)
    }
    func playSong(named fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
                print("Error: File \(fileName).mp3 not found")
                return
            }

            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                print("Playing \(fileName)")
            } catch {
                print("Error playing \(fileName): \(error.localizedDescription)")
            }
    }

}
