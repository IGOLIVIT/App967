//
//  U1.swift
//  App967
//
//  Created by IGOR on 22/10/2024.
//

import SwiftUI

struct U1: View {

    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("sbg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            .ignoresSafeArea()

            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Start playing and earning")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("A proven way to make easy money.")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                        .frame(width: 330)
                    
                    Spacer()
                    
                    HStack {
                        
                        Button(action: {
                            
                            
                        }, label: {
                            
                           Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .regular))
                        })
                        .opacity(0)
                        
                        Spacer()
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 6)
                        
                        Circle()
                            .fill(.white.opacity(0.5))
                            .frame(width: 6)

                        Spacer()
                        
                        Button(action: {
                            
                            Reviews()
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
    U1()
}
