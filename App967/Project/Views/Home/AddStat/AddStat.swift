//
//  AddStat.swift
//  App967
//
//  Created by IGOR on 22/10/2024.
//

import SwiftUI

struct AddStat: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Create statistics")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                                                
                        Button(action: {
                            
                            viewModel.stSocName = ""
                            viewModel.currentActive = ""
                            viewModel.stSubFW = ""
                            viewModel.stWDisp = ""
                            viewModel.stWDisp = ""
                            viewModel.stLikesFW = ""
                            viewModel.stComFW = ""
                            viewModel.stSubFM = ""
                            viewModel.stMDisp = ""
                            viewModel.stLikesFM = ""
                            viewModel.stComFM = ""
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(Color("sbg"))
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()

                    }
                }
                .padding()
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Facebook")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stSocName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stSocName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Total subscribes")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("10K")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stTotSub.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stTotSub)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Your activity:")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))

                            Menu(content: {
                                
                                ForEach(viewModel.actives, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentActive = index

                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                    
                            }, label: {
                                
                                HStack {
                                    
                                    Text(viewModel.currentActive)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .medium))
                                 
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .medium))
                                }
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Subscriptions for the week")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("234")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stSubFW.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stSubFW)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("The week's dispatches")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("10K")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stWDisp.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stWDisp)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Likes for the week")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("446")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stLikesFW.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stLikesFW)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Comments for the week")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("156")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stComFW.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stComFW)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Subscriptions for the month")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("10K")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stSubFM.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stSubFM)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("The month's dispatches")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("345")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stMDisp.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stMDisp)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Likes for the month")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("10K")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stLikesFM.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stLikesFM)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Comments for the month")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("2454")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.stComFM.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.stComFM)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.stYAct = viewModel.currentActive
                            
                            viewModel.addStat()
                            
                            viewModel.stSocName = ""
                            viewModel.currentActive = ""
                            viewModel.stSubFW = ""
                            viewModel.stWDisp = ""
                            viewModel.stWDisp = ""
                            viewModel.stLikesFW = ""
                            viewModel.stComFW = ""
                            viewModel.stSubFM = ""
                            viewModel.stMDisp = ""
                            viewModel.stLikesFM = ""
                            viewModel.stComFM = ""
                            
                            viewModel.fetchStat()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Create")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("sbg")))
                        })
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    AddStat(viewModel: HomeViewModel())
}
