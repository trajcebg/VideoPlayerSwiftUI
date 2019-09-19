//
//  PlayerUIView.swift
//  VideoPlayer
//
//  Created by Marko Trajcevic on 18/09/2019.
//  Copyright © 2019 trajceTeam. All rights reserved.
//

import AVKit

class PlayerUIView: UIView {
     
  override class var layerClass: AnyClass {
    return AVPlayerLayer.self
  }
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    var player: AVPlayer? {
      get {
        return playerLayer.player
      }
      set {
        playerLayer.player = newValue
      }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        playerLayer.player = player
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
      super.layoutSubviews()
        playerLayer.frame = bounds
        playerLayer.player = player
    }
}

