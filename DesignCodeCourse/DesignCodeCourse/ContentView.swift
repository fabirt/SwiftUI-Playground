//
//  ContentView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 6/04/21.
//

import SwiftUI

struct ContentView: View {
    @State var isDragging = false
    @State var dragTranslation = CGSize.zero
    @State var showCardDetail = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                guard !self.showCardDetail else {
                    return
                }
                
                self.isDragging = true
                self.dragTranslation = value.translation
            }
            .onEnded { value in
                self.isDragging = false
                self.dragTranslation = .zero
            }
        
        let longPressGesture = LongPressGesture()
            .onEnded { value in
                self.isDragging = true
            }
        
        _ = longPressGesture.sequenced(before: dragGesture)
        
        return ZStack {
            TitleView()
                .blur(radius: isDragging ? 10.0 : 0)
                .opacity(showCardDetail ? 0.4 : 1)
                .offset(y: showCardDetail ? -100 : 0)
                .animation(
                    Animation.default
                        .delay(0.1)
                    //.speed(2)
                    //.repeatForever()
                )
            
            ZStack {
                BackCardView(
                    width: showCardDetail ? 300 : 340,
                    backgroundColor: Color("card4"))
                    .offset(x: 0, y: isDragging ? -400 : -40.0)
                    .offset(dragTranslation)
                    .offset(y: showCardDetail ? -160 : 0)
                    .scaleEffect(showCardDetail ? 1 : 0.9)
                    .rotationEffect(.degrees(isDragging ? 0 : 10))
                    .rotationEffect(.degrees(showCardDetail ? -10 : 0))
                    .rotation3DEffect(
                        .degrees(showCardDetail ? 0 : 10),
                        axis: (x: 10.0, y: 0.0, z: 0.0)
                    )
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.5))
                
                BackCardView(
                    width: 340,
                    backgroundColor: Color("card3"))
                    .offset(x: 0, y: isDragging ? -200 : -20.0)
                    .offset(dragTranslation)
                    .offset(y: showCardDetail ? -130 : 0)
                    .scaleEffect(showCardDetail ? 1 : 0.95)
                    .rotationEffect(.degrees(isDragging ? 0 : 5))
                    .rotationEffect(.degrees(showCardDetail ? -5 : 0))
                    .rotation3DEffect(
                        .degrees(showCardDetail ? 0 : 5),
                        axis: (x: 10.0, y: 0.0, z: 0.0)
                    )
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.3))
                
                CardView()
                    .frame(width: showCardDetail ? .infinity : 340, height: 220)
                    .background(Color.black)
                    .clipShape(
                        RoundedRectangle(cornerRadius: showCardDetail ? 30 : 20, style: .continuous
                        )
                    )
                    .shadow(radius: 20)
                    .offset(dragTranslation)
                    .offset(y: showCardDetail ? -100 : 0)
                    .blendMode(.hardLight)
                    .animation(Animation.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                    .onTapGesture {
                        self.showCardDetail.toggle()
                    }
                    .gesture(dragGesture)
            }
            .zIndex(isDragging ? 4 : 2)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity)
            
            BottomCardView()
                .offset(y: showCardDetail ? 360 : 1000)
                .blur(radius: isDragging ? 10.0 : 0)
                .zIndex(3)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor(.accentColor)
                }
                Spacer()
                Image("Logo1")
            }.padding(.horizontal)
            .padding(.top)
            
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var width: CGFloat
    var backgroundColor: Color = Color.blue
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: width, height: 220)
        .background(backgroundColor)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }.padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .opacity(0.1)
            Text("This certificate is proof that Fabián Diartt has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 8)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}
