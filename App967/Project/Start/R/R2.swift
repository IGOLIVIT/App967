//
//  R2.swift
//  App967
//
//  Created by IGOR on 22/10/2024.
//

import SwiftUI

struct R2: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("sbg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            .ignoresSafeArea()

            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("User-friendly interface")
                        .foregroundColor(.white)
                        .font(.system(size: 34, weight: .bold))
                        .padding(.vertical)
                    
                    Text("Enjoy a clean and clear design that makes analysing data simple and fast. All important metrics at your fingertips!")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                        .frame(width: 330)
                    
                    Spacer()
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                           Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .regular))
                        })
                        
                        Spacer()

                        Circle()
                            .fill(.white.opacity(0.5))
                            .frame(width: 6)
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 6)
                        
                        Circle()
                            .fill(.white.opacity(0.5))
                            .frame(width: 6)
                        
                        Spacer()
                        
                        Button(action: {
                            
                            R3()
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
    R2()
}
