//
//  ContentView.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 6/04/21.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var dragTranslation = CGSize.zero
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 10.0 : 0)
                .animation(.default)
            
            ZStack {
                BackCardView(backgroundColor: Color("card4"))
                    .offset(x: 0, y: show ? -400 : -40.0)
                    .offset(dragTranslation)
                    .scaleEffect(0.9)
                    .rotationEffect(.degrees(show ? 0 : 10))
                    .rotation3DEffect(
                        .degrees(10),
                        axis: (x: 10.0, y: 0.0, z: 0.0)
                    )
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.5))
                
                BackCardView(backgroundColor: Color("card3"))
                    .offset(x: 0, y: show ? -200 : -20.0)
                    .offset(dragTranslation)
                    .scaleEffect(0.95)
                    .rotationEffect(.degrees(show ? 0 : 5))
                    .rotation3DEffect(
                        .degrees(5),
                        axis: (x: 10.0, y: 0.0, z: 0.0)
                    )
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.3))
                
                CardView()
                    .offset(dragTranslation)
                    .blendMode(.hardLight)
                    .onTapGesture {
                        self.show.toggle()
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.show = true
                                self.dragTranslation = value.translation
                            }
                            .onEnded { value in
                                let animation = Animation.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0)
                                withAnimation(animation) {
                                    self.show = false
                                    self.dragTranslation = .zero
                                }
                            }
                    )
            }
            .zIndex(show ? 4 : 2)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity)
            
            BottomCardView()
                .zIndex(3)
                .blur(radius: show ? 10.0 : 0)
                .animation(.default)
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
        .frame(width: 340, height: 220)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var backgroundColor: Color = Color.blue
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340, height: 220)
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
        .offset(y: 520)
    }
}
