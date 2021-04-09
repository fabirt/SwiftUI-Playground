//
//  UpdateDetailView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 9/04/21.
//

import SwiftUI

struct UpdateDetailView: View {
    let item: UpdateItem
    
    var body: some View {
        ScrollView {
            VStack {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(item.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
            }
            .padding(.top)
            .navigationBarTitle(item.title)
        }
    }
}

struct UpdateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetailView(item: updatesData[0])
    }
}
