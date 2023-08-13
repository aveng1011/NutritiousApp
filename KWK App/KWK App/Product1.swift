//
//  Product 2.swift
//  KWK App
//
//  Created by jaden chen on 7/31/23.
//

import SwiftUI

struct Product1: View {
    @Binding var showm: Bool
    
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
                Image("m_full")
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 310, height: 300)
                    .padding(.top,-90)
                ZStack {
//                    Rectangle()
//                        .fill(.ultraThinMaterial)
//                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                        .frame(width: 330, height: 300)
                    VStack {
                        Text("Soft creme/Mask")
                            .font(.custom("Optima-Regular", size: 25))
                            .padding(.vertical, 20)
                        Text("Soothe dry skin with pillowy-soft New Nutritious Melting Soft Creme/Mask. Quenches with relaxing hydration. Calms. Renews. Stengthens.")
                            .font(.custom("Optima-Regular", size: 15))
                            .padding(.bottom, 150)
                            .padding(.top, -20)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 60)
                        
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


struct Product1_Previews: PreviewProvider {
    static var previews: some View {
        Product1(showm: .constant(true))
    }
}
