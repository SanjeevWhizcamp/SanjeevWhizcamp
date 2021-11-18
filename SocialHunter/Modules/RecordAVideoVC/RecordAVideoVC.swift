//
//  RecordAVideoVC.swift
//  SocialHunter
//
//  Created by Apple on 01/11/21.
//

import UIKit
import AVFoundation

class RecordAVideoVC: UIViewController, AVCaptureFileOutputRecordingDelegate {
    
    
    @IBOutlet weak var camPreview: UIView!
    @IBOutlet weak var timer_lbl: UILabel!
    @IBOutlet weak var timerView: UIView!
    
    @IBOutlet weak var play_btn: UIButton!
    @IBOutlet var backBtn: UIButton!
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var videoSize_lbl: UILabel!
    @IBOutlet var videoSizeView: UIView!
    @IBOutlet var delete_btn: UIButton!
    
    @IBOutlet var timeView: UIView!
    @IBOutlet var centerPlayVideo_btn: UIButton!
    
    var recordedVideoTime = String()
    var currentOrientation: AVCaptureVideoOrientation?
        var videoConnection: AVCaptureConnection?
    var descriptionView = UINibCreation.loadRecordedDescriptionView()
    var recordAgainView = UINibCreation.loadRecordAgainPopup()
    var arr = ["UX Designing","UI Designing","Mobile App Designing"]
       // let cameraButton = UIView()
      
        let captureSession = AVCaptureSession()

        let movieOutput = AVCaptureMovieFileOutput()

        var previewLayer: AVCaptureVideoPreviewLayer!

        var activeInput: AVCaptureDeviceInput!

        var outputURL: URL!
    
        var timer: Timer!
    var timer1: Timer!
        var count = 3
    var timeMin = 0
       var timeSec = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        if setupSession() {
//            setupPreview()
//            startSession()
//        }
        timeView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        timeView.layer.cornerRadius = 15
        timeView.layer.masksToBounds = true
        self.tabBarController?.tabBar.isHidden = true
        timeView.isHidden = true
        progressBar.isHidden = true
        videoSizeView.isHidden = true
        delete_btn.isHidden = true
        descriptionView.removeFromSuperview()
        videoSizeView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        descriptionView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        descriptionView.edit_btn.addTarget(self, action: #selector(editAction(_:)), for: .touchUpInside)
        descriptionView.next_btn.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        descriptionView.tagCollection.register(UINib(nibName: "InterestTagCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        descriptionView.tagCollection.delegate = self
        descriptionView.tagCollection.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        descriptionView.tagCollection.collectionViewLayout = layout
        self.view.addSubview(descriptionView)
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func playAction(_ sender: AnyObject)
    {
        startRecording()
        play_btn.setImage(UIImage(named: "PauseVideo"), for: .normal)
        backBtn.isHidden = true
        descriptionView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        descriptionView.next_btn.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        
        self.view.addSubview(descriptionView)
        progressBar.isHidden = true
        videoSizeView.isHidden = true
        delete_btn.isHidden = true
        descriptionView.removeFromSuperview()
    }
    @objc func nextAction(_ sender: UIButton)
    {
        let vc = AddEstimatesVC.instantiate()
        self.presentSheet(present: vc, sizes: [.fixed(600)])
    }
    @objc func editAction(_ sender: UIButton)
    {
        let vc = CreatePitchVC.instantiate()
        vc.type = "Edit"
        vc.taskNameSt = descriptionView.name_lbl.text ?? ""
        vc.descSt = descriptionView.description_lbl.text ?? ""
        self.pushVC(controller: vc)
        
    }
    @IBAction func deleteAction(_ sender: Any)
    {
        recordAgainView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        recordAgainView.yes_btn.addTarget(self, action: #selector(yesAction), for: .touchUpInside)
        recordAgainView.no_btn.addTarget(self, action: #selector(noAction), for: .touchUpInside)
        recordAgainView.backView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.view.addSubview(recordAgainView)
    }
    @objc func yesAction(_ sender: UIButton)
    {
                if setupSession() {
                    setupPreview()
                    startSession()
                }
                timeView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                timeView.layer.cornerRadius = 15
                timeView.layer.masksToBounds = true
               
                timeView.isHidden = true
                progressBar.isHidden = true
                videoSizeView.isHidden = true
                delete_btn.isHidden = true
                descriptionView.removeFromSuperview()
    }
    @objc func noAction(_ sender: UIButton)
    {
        recordAgainView.removeFromSuperview()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = false
        
    }
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        checkCameraUsagePermission()
            
        }
   
    func checkCameraUsagePermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            self.startSession()

        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.startSession()
                }
            }
        case .denied:
            return
        case .restricted:
            return
        default:
            break
        }
    }
    func setupPreview() {
            // Configure previewLayer
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.frame = camPreview.bounds
           previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            camPreview.layer.addSublayer(previewLayer)
            
        }

        //MARK:- Setup Camera

        func setupSession() -> Bool {
            
            captureSession.sessionPreset = AVCaptureSession.Preset.high
            
            // Setup Camera
             let camera = AVCaptureDevice.default(for: .video)
            
            do {
                let input = try AVCaptureDeviceInput(device: camera!)
                if captureSession.canAddInput(input) {
                    captureSession.addInput(input)
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                    previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation(rawValue: UIDevice.current.orientation.rawValue) ?? .portrait
            
                    activeInput = input
                    //videoConnection = activeInput.connection(with: .video)
                }
            } catch {
                print("Error setting device video input: \(error)")
                return false
            }
            
            // Setup Microphone
            let microphone = AVCaptureDevice.default(for: .audio)
            
            do {
                let micInput = try AVCaptureDeviceInput(device: microphone!)
                if captureSession.canAddInput(micInput) {
                    captureSession.addInput(micInput)
                }
            } catch {
                print("Error setting device audio input: \(error)")
                return false
            }
            
            // Movie output
            if captureSession.canAddOutput(movieOutput) {
                captureSession.addOutput(movieOutput)
            }
            return true
        }

        func setupCaptureMode(_ mode: Int) {
                // Video Mode
        }
        //MARK:- Camera Session
        func startSession() {
            
            if !captureSession.isRunning {
                videoQueue().async { [self] in
                    self.captureSession.startRunning()
                // startRecording()
                }
            }
        }
        func stopSession() {
            if captureSession.isRunning {
                videoQueue().async { [self] in
                    self.captureSession.stopRunning()
                }
            }
        }
        func videoQueue() -> DispatchQueue {
            return DispatchQueue.main
        }
        func currentVideoOrientation() -> AVCaptureVideoOrientation {
            var orientation: AVCaptureVideoOrientation
            
            switch UIDevice.current.orientation {
            case .portrait:
                orientation = AVCaptureVideoOrientation.portrait//AVCaptureVideoOrientation.portrait
            print(orientation)
            case .landscapeRight:
                orientation = AVCaptureVideoOrientation.landscapeLeft
            case .portraitUpsideDown:
                orientation = AVCaptureVideoOrientation.portraitUpsideDown
            default:
                orientation = AVCaptureVideoOrientation.portrait
            }
            return orientation
        }
    
    @objc func startCapture() {
           // startTimer()
          //  startRecording()
        //play_btn.setImage(UIImage(named: "PauseVideo"), for: .normal)
        }
        func startTimer(){
            
            let timeNow = String(format: "%02d:%02d", timeMin, timeSec)
            timer_lbl.text = timeNow

            stopTimer() // stop it at it's current time before starting it again
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                        self?.timerTick()
                    }
        }
        func timerTick(){
             timeSec += 1
                
             if timeSec == 60{
                 timeSec = 0
                 timeMin += 1
             }
                
             let timeNow = String(format: "%02d:%02d", timeMin, timeSec)
            timer_lbl.text = timeNow
        }
        @objc fileprivate func resetTimerToZero(){
             timeSec = 0
             timeMin = 0
             stopTimer()
        }
        // if you need to reset the timer to 0 and yourLabel.txt back to 00:00
        @objc func resetTimerAndLabel(){
             resetTimerToZero()
            timer_lbl.text = String(format: "%02d:%02d", timeMin, timeSec)
        }
        // stops the timer at it's current time
        @objc func stopTimer(){
            recordedVideoTime = timer_lbl.text!
             timer?.invalidate()
        }
    func startRecording() {
        
        if movieOutput.isRecording == false {
            timeView.isHidden = false
            timer_lbl.isHidden = false
            
            //recordDot_img.isHidden = false
          //  replay_btn.isHidden = true
           // addVideo_btn.isHidden = true
            startTimer()
            
            let connection = movieOutput.connection(with: AVMediaType.video)
            if (connection?.isVideoOrientationSupported)! {
                connection?.videoOrientation = currentVideoOrientation()
            }
            
            if (connection?.isVideoStabilizationSupported)! {
                connection?.preferredVideoStabilizationMode = AVCaptureVideoStabilizationMode.auto
            }
            
            let device = activeInput.device
            if (device.isSmoothAutoFocusSupported) {
                do {
                    try device.lockForConfiguration()
                    device.isSmoothAutoFocusEnabled = false
                    device.unlockForConfiguration()
                } catch {
                    print("Error setting configuration: \(error)")
                }
                
            }
            let movieFileOutput = AVCaptureMovieFileOutput()
            movieFileOutput.maxRecordedDuration = CMTime(seconds: 120, preferredTimescale: 1)
            //EDIT2: And I forgot this
            outputURL = tempURL()
            movieOutput.startRecording(to: outputURL, recordingDelegate: self)
            
        }
        else {
          //  replay_btn.isHidden = false
           // addVideo_btn.isHidden = false
            timeView.isHidden = true
            backBtn.isHidden = false
            play_btn.setImage(UIImage(named: "PlayVideo"), for: .normal)
            descriptionView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            self.view.addSubview(descriptionView)
            progressBar.isHidden = false
            videoSizeView.isHidden = false
            delete_btn.isHidden = false
            stopRecording()
        }
        
    }
    func tempURL() -> URL? {
        let directoryURL: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
       if directoryURL != nil
        {
            let path: URL = directoryURL.appendingPathComponent(NSUUID().uuidString + ".mp4")
            return path
        }
        
        return nil
    }
    func stopRecording() {
        
        if movieOutput.isRecording == true {
            movieOutput.stopRecording()
        }
    }

    func capture(_ captureOutput: AVCaptureFileOutput!, didStartRecordingToOutputFileAt fileURL: URL!, fromConnections connections: [Any]!) {
    }

    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error,
                    let nserror = error as NSError? {
                    switch nserror.code {
                    case AVError.Code.maximumDurationReached.rawValue:
                        //no error because we want to stop if max duration is reached
                        print(output.maxRecordedDuration.seconds, "<<<<<<<<<<<<" )
                     //   recordingEnded()
                        return

                    default:
                        //handle error
                        print(nserror.userInfo)
                        break
                    }
                } else {
                    
                    timeView.isHidden = true
                    backBtn.isHidden = false
                    resetTimerAndLabel()
                    play_btn.setImage(UIImage(named: "PlayVideo"), for: .normal)
                   // UISaveVideoAtPathToSavedPhotosAlbum(outputFileURL.path, nil, nil, nil)
                    //user manually stopped the video before maxduration was reached
                    // recordingEnded()
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
extension RecordAVideoVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! InterestTagCell
        cell.lbl.text = arr[indexPath.row]
        cell.cross_btn.addTarget(self, action: #selector(crossAction), for: .touchUpInside)
        cell.cross_btn.tag = indexPath.row
        return cell
    }
    @objc func crossAction(_ sender: UIButton)
    {
        arr.remove(at: sender.tag)

            let indexPath = IndexPath(row:  sender.tag, section: 0)
        descriptionView.tagCollection.performBatchUpdates({
                self.descriptionView.tagCollection.deleteItems(at: [indexPath])
            }, completion: {
                (finished: Bool) in
                self.descriptionView.tagCollection.reloadItems(at: self.descriptionView.tagCollection.indexPathsForVisibleItems)
            })
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! InterestTagCell
        cell.lbl.text = arr[indexPath.row]
        cell.lbl.sizeToFit()
        return CGSize(width: cell.lbl.intrinsicContentSize.width + 50, height: 30)
    }
}
