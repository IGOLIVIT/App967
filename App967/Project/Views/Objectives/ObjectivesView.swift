//
//  ObjectivesView.swift
//  App967
//
//  Created by IGOR on 22/10/2024.
//

import SwiftUI

struct ObjectivesView: View {

    @StateObject var viewModel = ObjectivesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Objectives")
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
                
                if viewModel.tasks.isEmpty {
                    
                    VStack(spacing: 14) {
                        
                        Text("Empty page")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text("You don't have any tasks created")
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
                            
                            ForEach(viewModel.tasks, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    HStack {
                                        
                                        HStack {
                                            
                                            Image(systemName: "calendar")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Text("\((index.taDate ?? Date()).convertDate(format: "dd.MM.yyyy"))")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding(6)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                                        
                                        HStack {
                                            
                                            Image(systemName: "clock")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Text("\((index.taDate ?? Date()).convertDate(format: "HH:mm"))")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding(6)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                                        
                                        HStack {
                                            
                                            Image(systemName: "globe")
                                                .foregroundColor(Color("sbg"))
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Text(index.taNet ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding(6)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
                                    }

                                    Text(index.taName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 22, weight: .semibold))
                                    
                                    Text(index.taDescr ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .multilineTextAlignment(.leading)
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedTask = index
                                        
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
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 20).stroke(Color("sbg")))
                                .padding(1)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchTasks()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTask(viewModel: viewModel)

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
               
                        CoreDataStack.shared.deleteTask(withTaName: viewModel.selectedTask?.taName ?? "", completion: {
                            
                            viewModel.fetchTasks()
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
    ObjectivesView()
}
