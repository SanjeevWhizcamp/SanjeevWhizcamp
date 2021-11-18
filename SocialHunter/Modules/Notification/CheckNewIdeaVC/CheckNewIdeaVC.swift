//
//  CheckNewIdeaVC.swift
//  SocialHunter
//
//  Created by Apple on 10/11/21.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer
class CheckNewIdeaVC: UIViewController {
    
    @IBOutlet var imgvw: UIImageView!
    @IBOutlet var playerView: UIView!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var totalDurationLabel: UILabel!
    @IBOutlet var timer_lbl: UILabel!
    
    @IBOutlet var resize_btn: UIButton!
    
    @IBOutlet var record_switch: UISwitch!
    
    @IBOutlet var reach_tblvw: UITableView!
    @IBOutlet var pitch_tblvw: UITableView!
    
    @IBOutlet var reach_view: UIView!
    @IBOutlet var pitch_view: UIView!
    
    @IBOutlet var reachViewHeight: NSLayoutConstraint!
    @IBOutlet var pitchViewHeight: NSLayoutConstraint!
    
    @IBOutlet var recordPitch_btn: UIButton!
    
    var player:AVPlayer!
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        record_switch.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        recordPitch_btn.isHidden = true
        pitch_view.isHidden = true
        pitchViewHeight.constant = 0
        record_switch.addTarget(self, action: #selector(didTapRecord), for:UIControl.Event.valueChanged)
        reach_tblvw.register(UINib(nibName: "PeopleCell", bundle: nil), forCellReuseIdentifier: "ReachCell")
        pitch_tblvw.register(UINib(nibName: "PeopleCell", bundle: nil), forCellReuseIdentifier: "PitchCell")
        let videoURL = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")!
        if let thumbnailImage = getThumbnailImage(forUrl: videoURL) {
            imgvw.image = thumbnailImage
        }
        // Do any additional setup after loading the view.
    }
    @objc func didTapRecord(mySwitch: UISwitch) {
            let value = mySwitch.isOn
            // Do something
        if value == true
        {
            recordPitch_btn.isHidden = false
        }
        else
        {
            recordPitch_btn.isHidden = true
        }
            print("switch value changed \(value)")
        }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func playVideo(_ sender: Any)
    {
        addPlayer()
    }
    func addPlayer()
    {
        let videoURL = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")!
        
        player = AVPlayer(url: videoURL)
        let controller = AVPlayerViewController()
        controller.player=player
        controller.view.frame = playerView.frame
        controller.videoGravity = .resizeAspectFill
        controller.showsPlaybackControls = false

        playerView.addSubview(controller.view)
        self.addChild(controller)
        progressView.isHidden = false
        timer_lbl.isHidden = false
        playerView.bringSubviewToFront(resize_btn)
        playerView.bringSubviewToFront(progressView)
        playerView.bringSubviewToFront(timer_lbl)
        playerView.bringSubviewToFront(totalDurationLabel)
        totalDurationLabel.isHidden = false
        
       
        player.play()
        if let duration = player.currentItem?.asset.duration {
            let seconds = CMTimeGetSeconds(duration)

            let mins = seconds / 60
            let secs = seconds.truncatingRemainder(dividingBy: 60)
            let timeformatter = NumberFormatter()
            timeformatter.minimumIntegerDigits = 2
            timeformatter.minimumFractionDigits = 0
            timeformatter.roundingMode = .down
            guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else {
                return
            }
            totalDurationLabel.text = "\(minsStr).\(secsStr)"
            
        }
    
          
       setupProgressTimer()
      // videoPlayerView.bringSubviewToFront(backView)
       
    }
    
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }

        return nil
    }
    private func setupProgressTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] (completion) in
            guard let self = self else { return }
            self.updateProgress()
        })
    }
    private func updateProgress() {
        
        guard let duration = player?.currentItem?.duration.seconds,
            let currentMoment = player?.currentItem?.currentTime().seconds else { return }

        progressView.progress = Float(currentMoment / duration)
        print(progressView.progress)
        let currentTimeInSeconds = CMTimeGetSeconds(player.currentTime())
           // 2 Alternatively, you could able to get current time from `currentItem` - videoPlayer.currentItem.duration

           let mins = currentTimeInSeconds / 60
           let secs = currentTimeInSeconds.truncatingRemainder(dividingBy: 60)
           let timeformatter = NumberFormatter()
           timeformatter.minimumIntegerDigits = 2
           timeformatter.minimumFractionDigits = 0
           timeformatter.roundingMode = .down
           guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else {
               return
           }
           timer_lbl.text = "\(minsStr).\(secsStr)"
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
extension CheckNewIdeaVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == reach_tblvw
        {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == reach_tblvw
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReachCell", for: indexPath) as! PeopleCell
            cell.name_lbl.text = "Whizcamp"
            cell.role_lbl.text = "Organization"
            return cell
        }
        else if tableView == pitch_tblvw
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PitchCell", for: indexPath) as! PeopleCell
            cell.name_lbl.text = "Ellena"
            cell.role_lbl.text = "Artist"
            return cell
        }
        return UITableViewCell()
    }
    
    
}



extension UIImage
{
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }

        return nil
    }
}
