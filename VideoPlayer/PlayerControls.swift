//
//  PlayerControls.swift
//  VideoPlayer
//
//  Created by Marko Trajcevic on 18/09/2019.
//  Copyright © 2019 trajceTeam. All rights reserved.
//

import SwiftUI
import AVFoundation

struct PlayerControls: View {
    
  @State private var playerPaused = true
  @State private var seekPos = 0.0
         private  let player: AVPlayer
    
    init(player: AVPlayer) {
        self.player = player
    }
    
     var body: some View {
       VStack {
         Button(action: {
           self.playerPaused.toggle()
           if self.playerPaused {
             self.player.pause()
           }
           else {
             self.player.play()
           }
         }) {
           Image(systemName: playerPaused ? "play" : "pause")
             .padding(.leading, 20)
             .padding(.trailing, 20)
         }
        Slider(value: $seekPos,in: 0...1, onEditingChanged: { _ in
           guard let item = self.player.currentItem else {
             return
           }
               let targetTime = self.seekPos * item.duration.seconds
           self.player.seek(to: CMTime(seconds: targetTime, preferredTimescale: 600))
         })
           .padding(.trailing, 20)
        }.padding()
     }
}


struct PlayerControls_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!
        let player = AVPlayer(url: url)

        return PlayerControls(player: player)
    }
}
