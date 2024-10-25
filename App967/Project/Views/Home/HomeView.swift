//
//  HomeView.swift
//  App967
//
//  Created by IGOR on 22/10/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Statistic")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("sbg"))
                                .font(.system(size: 22, weight: .medium))
                        })
                    }
                }
                .padding(.bottom)
                
                if viewModel.statistics.isEmpty {
                    
                    VStack(spacing: 14) {
                        
                        Text("Empty page")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("You don't have any networks added")
                            .foregroundColor(.black.opacity(0.7))
                            .font(.system(size: 15, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Add card")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .padding(6)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                            }
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                        })
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 5))
                    .padding(5)
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.statistics, id: \.self) { index in
                                
                                VStack(spacing: 6) {
                                    
                                    HStack {
                                        
                                        Text(index.stSocName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 22, weight: .bold))
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedStat = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDelete = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "pencil")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(5)
                                                .background(RoundedRectangle(cornerRadius: 7).fill(.black))
                                        })
                                    }
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Image(systemName: "flame.fill")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.stYAct ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium))
                                            
                                            Text("Your activity")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                                        .padding(1)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Image(systemName: "person.fill")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.stTotSub ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium))
                                            
                                            Text("Total subscribers")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                                        .padding(1)
                                    }
                                    
                                    HStack {
                                        
                                        ForEach(viewModel.periods, id: \.self) { index in
                                            
                                            Button {
                                                
                                                viewModel.currentPeriod = index
                                                
                                            } label: {
                                                
                                                Text(index)
                                                    .foregroundColor(viewModel.currentPeriod == index ? .white : .black)
                                                    .font(.system(size: 14, weight: .medium))
                                                    .frame(maxWidth: .infinity)
                                                    .padding(5)
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("sbg").opacity(viewModel.currentPeriod == index ? 1 : 0)))
                                            }
                                        }
                                    }
                                    .padding(1)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                                    
                                    if viewModel.currentPeriod == "Week" {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Image(systemName: "person.crop.circle.fill.badge.plus")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.stSubFW ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium))
                                            
                                            Text("Subscriptions")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                                        .padding(1)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Image(systemName: "person.crop.circle.fill.badge.minus")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.stWDisp ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium))
                                            
                                            Text("Total subscribers")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                                        .padding(1)
                                    }
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.stLikesFW ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium))
                                            
                                            Text("Likes")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                                        .padding(1)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Image(systemName: "message.fill")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.stComFW ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium))
                                            
                                            Text("Comments")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                                        .padding(1)
                                    }
                                    
                                } else {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Image(systemName: "person.crop.circle.fill.badge.plus")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.stSubFM ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium))
                                            
                                            Text("Subscriptions")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                                        .padding(1)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Image(systemName: "person.crop.circle.fill.badge.minus")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.stMDisp ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium))
                                            
                                            Text("Total subscribers")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                                        .padding(1)
                                    }
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.stLikesFM ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium))
                                            
                                            Text("Likes")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                                        .padding(1)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            Image(systemName: "message.fill")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                            Text(index.stComFM ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 24, weight: .medium))
                                            
                                            Text("Comments")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                                        .padding(1)
                                    }
                                }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white).shadow(radius: 5))
                                .padding(5)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchStat()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddStat(viewModel: viewModel)

        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
               
                        CoreDataStack.shared.deleteStat(withStTotSub: viewModel.selectedStat?.stTotSub ?? "", completion: {
                            
                            viewModel.fetchStat()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bbg")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    HomeView()
}
