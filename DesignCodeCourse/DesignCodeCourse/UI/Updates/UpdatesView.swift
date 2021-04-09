//
//  UpdatesView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 9/04/21.
//

import SwiftUI

struct UpdatesView: View {
    @ObservedObject private var viewModel = UpdatesViewModel()
    @State private var allowAnimations : Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.updates) { item in
                    NavigationLink(destination: UpdateDetailView(item: item)) {
                        UpdateView(item: item)
                    }
                }
                .onDelete { indexSet in
                    viewModel.removeUpdate(at: indexSet.first!)
                }
                .onMove { indices, newOffset in
                    viewModel.moveUpdate(from: indices, to: newOffset)
                }
            }
            .animation(allowAnimations ? .default : nil)
            .navigationTitle("Updates")
            .navigationBarItems(
                leading: Button(action: viewModel.addUpdate) {
                    Text("Add update")
                },
                trailing: EditButton()
            )
            .onAppear {
                DispatchQueue.main.async {
                    self.allowAnimations = true
                }
            }
        }
    }
}

fileprivate struct UpdateView: View {
    let item: UpdateItem
    
    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color.black)
                .cornerRadius(20)
                .padding(.trailing, 4)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .font(.system(size: 20, weight: .bold))
                Text(item.body)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text(item.displayDate)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct UpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesView()
    }
}
