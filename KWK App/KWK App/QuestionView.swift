//
//  QuestionView.swift
//  KWK App
//
//  Created by jaden chen on 8/12/23.
//

import SwiftUI

struct QuestionView: View {
    @State private var newimage = 0
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $newimage) {
                    ForEach(0..<4, id: \.self) { index in
                        Image("image\(index + 1)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:700)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
            }
                
            Button(action: {
                withAnimation {
                    newimage = (newimage + 1) % 4
                }
               }) {
                Image(systemName: "chevron.right.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 300)
                    .padding(.leading, 330)
            }
        }
    }
}

        struct CarouselView_Previews: PreviewProvider {
            static var previews: some View {
                QuestionView()
            }
        }


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
