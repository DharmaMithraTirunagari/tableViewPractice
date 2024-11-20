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
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
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
        
        
        nowPlayingView.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        setupSegmentControl()
        setupNavigationBar()
        //tableView.backgroundColor = UIColor.black
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
        nowPlayingView.isHidden = false
        if let selectedSong = songs.first(where: { $0.3 == fileName }) {
                nowPlayingTitleLabel.text = selectedSong.0 // Song title
                nowPlayingArtistLabel.text = selectedSong.1 // Artist and album
            playPauseButton.tintColor = .black
                playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                nowPlayingImageView.image = UIImage(named: selectedSong.2) ?? UIImage(systemName: "music.note") // Album art
            }
            
            // Play the song
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                //playPauseButton.setTitle("Pause", for: .normal) // Update play/pause button
            } catch {
                print("Error playing \(fileName): \(error.localizedDescription)")
            }
    }

    @IBAction func playPauseTapped(_ sender: UIButton) {
        if let audioPlayer = audioPlayer {
                if audioPlayer.isPlaying {
                    audioPlayer.pause()
                    playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal) // Update button title
                } else {
                    audioPlayer.play()
                    playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                }
            }
    }
    func setupSegmentControl(){
        segmentControl.setTitleTextAttributes([.foregroundColor: UIColor.lightGray], for: .normal)
        segmentControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentControl.backgroundColor = UIColor.black
        segmentControl.selectedSegmentTintColor = UIColor.darkGray
    }
    func setupNavigationBar(){
        self.title = "Your Library"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let profileImage = UIImage(systemName: "person.circle.fill") // Use a system image or a custom one
        let profileButton = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(profileTapped))
        profileButton.tintColor = .white
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        searchButton.tintColor = .white
        addButton.tintColor = .white
        navigationItem.leftBarButtonItem = profileButton
        navigationItem.rightBarButtonItems = [addButton, searchButton]

            // Set the background color of the navigation bar
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    @objc func profileTapped() {
        print("Profile button tapped")
    }

    @objc func searchTapped() {
        print("Search button tapped")
    }

    @objc func addTapped() {
        print("Add button tapped")
    }
}
