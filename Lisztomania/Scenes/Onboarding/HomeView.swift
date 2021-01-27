//
//  HomeView.swift
//  Lisztomania
//
//  Created by Jaime Jazareno III on 1/21/21.
//

import SwiftUI
import Combine
import Kingfisher

struct HomeView: View {
    @EnvironmentObject var store: AppStore
    var body: some View {
        ScrollView {
            VStack {
                ForEach(store.state.playlist.playlists, id: \.self) { playlist in
                    HStack {
                        KFImage(URL(string: playlist.images.first?.url ?? ""))
                            .frame(width: CGFloat(playlist.images.count) * 50,
                                   height: CGFloat(playlist.images.count) * 50)
                            .clipped()
                        Text(playlist.name)
                            .font(.caption2)
                            .foregroundColor(.white)
                    }

                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
