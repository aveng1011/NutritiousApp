//
//  Product 2.swift
//  KWK App
//
//  Created by jaden chen on 7/31/23.
//

import SwiftUI

struct Product3: View {
    @Binding var showf: Bool
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.3)
            Rectangle()
                .fill(.black)
                .opacity(0.1)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .blur(radius: 30)
                .frame(width: 350, height: 450)
                .padding(.bottom, 150)
            VStack {
                Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .opacity(0.6)
                            .padding(.leading, 290)
                            .padding(.top, -99)
                Image("fc_full")
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 310, height: 300)
                    .padding(.top,-90)
                ZStack {
                    VStack {
                        Text("2-in-1 Foam Cleanser")
                            .font(.custom("Optima-Regular", size: 25))
                            .padding(.vertical, 20)
                        Text("Say goodbye to excess shine with dual-action New Nutritious 2-in1 Foam Cleanser. Gently cleanses and deeply purifies.")
                            .font(.custom("Optima-Regular", size: 15))
                            .padding(.bottom, 150)
                            .padding(.top, -20)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 50)
                        
                    }
                    Spacer()
                }
                .padding(.top, -40)
            }
        }
        .foregroundStyle(.white)
        .ignoresSafeArea()
    }
}

struct Product3_Previews: PreviewProvider {
    static var previews: some View {
        Product3(showf: .constant(true))
    }
}
