//
//  SettingsView.swift
//  App967
//
//  Created by IGOR on 22/10/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))

                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/4b93625c-5fdd-4a47-b6f2-ed06643e8ef8") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.text.magnifyingglass")
                                    .foregroundColor(Color("sbg"))
                                    .font(.system(size: 30))
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("Usage Policy")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    HStack {
                                        
                                        Text("Go to")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                        Image(systemName: "arrow.up.right")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .frame(height: 85)
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("sbg")))
                            .padding(1)
                        })
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star")
                                    .foregroundColor(Color("sbg"))
                                    .font(.system(size: 30))
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("Rate our app")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    HStack {
                                        
                                        Text("Go to")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                        Image(systemName: "arrow.up.right")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .frame(height: 85)
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("sbg")))
                            .padding(1)
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
