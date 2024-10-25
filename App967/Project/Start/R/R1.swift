//
//  R1.swift
//  App967
//
//  Created by IGOR on 22/10/2024.
//

import SwiftUI

struct R1: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("sbg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            .ignoresSafeArea()

            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("In-depth analysis")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .bold))
                        .padding(.vertical)
                    
                    Text("Study your audience's behaviour and identify successful strategies. Find out what content works best and why!")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                        .frame(width: 330)
                    
                    Spacer()
                    
                    HStack {
                        
                        Button(action: {
                            
                            status = true
                            
                        }, label: {
                            
                            Text("Skip")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .regular))
                        })
                        
                        Spacer()
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 6)
                        
                        Circle()
                            .fill(.white.opacity(0.5))
                            .frame(width: 6)
                        
                        Circle()
                            .fill(.white.opacity(0.5))
                            .frame(width: 6)
                        
                        Spacer()
                        
                        Button(action: {
                            
                            R2()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .regular))
                        })
                    }
                    .padding()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 320)
                .background(Color("bbg"))
            }
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    R1()
}
