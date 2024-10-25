//
//  AddTask.swift
//  App967
//
//  Created by IGOR on 23/10/2024.
//

import SwiftUI

struct AddTask: View {

    @StateObject var viewModel: ObjectivesViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Create objective")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                                                
                        Button(action: {
                            
                            viewModel.taName = ""
                            viewModel.taNet = ""
                            viewModel.taDescr = ""
                                                        
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
                                
                                Text("Make a post")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.taName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.taName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.taDate, displayedComponents: .date)
                                .labelsHidden()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Time")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))

                            Spacer()
                            
                            DatePicker("", selection: $viewModel.taTime, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        
                        HStack {
                            
                            Text("Social network")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Facebook")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.taNet.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.taNet)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        .padding(.bottom)
                        
                        VStack {
                            
                            Text("Description")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.taDescr.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.taDescr)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                        }
                        .padding(.bottom)

                        Button(action: {
                            
                            viewModel.addTask()
                            
                            viewModel.taName = ""
                            viewModel.taNet = ""
                            viewModel.taDescr = ""
                            
                            viewModel.fetchTasks()
                            
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
    AddTask(viewModel: ObjectivesViewModel())
}
