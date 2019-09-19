//
//  ContentView.swift
//  VideoPlayer
//
//  Created by Marko Trajcevic on 17/09/2019.
//  Copyright © 2019 trajceTeam. All rights reserved.
//

import SwiftUI
import AVKit


struct PlayerView: UIViewRepresentable {
    
    private let player: AVPlayer
    
    init(player: AVPlayer) {
        self.player = player
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        let playerView = PlayerUIView(frame: .zero)
        playerView.player = player
        return playerView
    }
}


struct ContentView: View {
    
    private let player: AVPlayer
    
    init(player: AVPlayer) {
        self.player = player
    }
    
    
    var body: some View {
        VStack {
            PlayerView(player: player)
            PlayerControls(player: player)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!
        let player = AVPlayer(url: url)
        return ContentView(player: player)
    }
}
