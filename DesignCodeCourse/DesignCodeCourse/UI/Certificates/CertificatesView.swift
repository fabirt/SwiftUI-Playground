//
//  CertificatesView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 7/04/21.
//

import SwiftUI

struct CertificatesView: View {
    @State var isDragging = false
    @State var certificateCardTranslation = CGSize.zero
    @State var showCardDetail = false
    @State var bottomCardTranslation = CGSize.zero
    
    var body: some View {
        ZStack {
            TitleView(blurred: $isDragging, opaque: $showCardDetail)
            
            CertificateCardView(
                translation: $certificateCardTranslation,
                showDetail: $showCardDetail,
                isDragging: $isDragging)
            
            BottomCardView(
                show: $showCardDetail,
                translation: $bottomCardTranslation)
            
            
        }
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
