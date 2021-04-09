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
        Text(item.title)
    }
}

struct UpdateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetailView(item: updatesData[0])
    }
}
