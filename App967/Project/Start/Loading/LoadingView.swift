//
//  LoadingView.swift
//  App967
//
//  Created by IGOR on 22/10/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("lbg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
            }
        }
    }
}

#Preview {
    LoadingView()
}
