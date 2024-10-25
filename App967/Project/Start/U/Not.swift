//
//  Not.swift
//  App967
//
//  Created by IGOR on 22/10/2024.
//

import SwiftUI

struct Not: View {

    @AppStorage("status") var status: Bool = false
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("sbg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            .ignoresSafeArea()

            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Platform Comparison")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .bold))
                        .padding(.vertical)
                    
                    Text("See which of your platforms brings the best results and optimise your strategy!")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                        .frame(width: 330)
                    
                    Spacer()

                        Button(action: {
                            
                            status = true
                            
                        }, label: {
                            
                            Text("Enable notifications")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .regular))
                        })
                    .padding()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 320)
                .background(Color("bbg"))
            }
            .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.white))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
