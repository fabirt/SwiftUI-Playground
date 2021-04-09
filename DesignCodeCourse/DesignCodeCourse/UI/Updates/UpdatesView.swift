//
//  UpdatesView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 9/04/21.
//

import SwiftUI

struct UpdatesView: View {
    var body: some View {
        NavigationView {
            List(updatesData) { item in
                NavigationLink(destination: UpdateDetailView(item: item)) {
                    UpdateView(item: item)
                }
            }
            .navigationTitle("Updates")
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
