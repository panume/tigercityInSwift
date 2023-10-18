//
//  VideoView.swift
//  TigerCityInSwift
//
//  Created by zhou on 2023/9/28.
//

import UIKit
import AVKit
import SnapKit

class VideoView: UIView, AVPlayerViewControllerDelegate {

    var videoUrl: String? {
        didSet {
            setupUI()
        }
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    lazy var playerVC: AVPlayerViewController = {
        let playerVC = AVPlayerViewController()
        playerVC.delegate = self
        playerVC.showsPlaybackControls = false
        playerVC.player?.volume = 0
        NotificationCenter.default.addObserver(self, selector: #selector(playToEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerVC.player?.currentItem)
        return playerVC
    }()
    
    func setupUI() {
        self.addSubview(playerVC.view)
        playerVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        playerVC.player?.currentItem?.addObserver(self, forKeyPath: "loadedTimeRanges", context: nil)
        
    }
    
    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loadedTimeRanges" {
            
        }
    }
    
    @objc func playToEnd(sender: Notification) {
        let item = sender.object as! AVPlayerItem
        item.seek(to: CMTime.zero) { result in
            print(result)
        }
        playerVC.player?.play()
    }

}
