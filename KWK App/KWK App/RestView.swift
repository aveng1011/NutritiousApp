import SwiftUI

struct RestView: View {
    @State private var isOverlay1Visible = false
    @State private var isOverlay3Visible = false
    @State private var isOverlay4Visible = false
    @State private var isOverlay2Visible = false
    @State private var fadeInText = false
    @State private var newimage = 0
    
        
    var body: some View {
        ScrollView {
            VStack() {
                ZStack {
                    //Ingredients view
                    Image("all_fulli")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 500)
                        .padding(.top, 30)
                    Rectangle()
                        .fill(.black)
                        .opacity(fadeInText ? 0.3:0)
                        .mask(RoundedRectangle(cornerRadius: 0, style: .continuous))
                        .frame(width: 400, height: 560)
                        .padding(.top, 28)
                        .onAppear {
                            withAnimation(Animation.default.delay(3)) {
                                fadeInText = true
                            }
                        }
                    VStack {
                        Text("Made with \nresponsibly \nsourced \nskin-essential \nnutrients...")
                            .opacity(fadeInText ? 1:0)
                                .font(.custom("Optima-Bold", size: 45))
                            .foregroundColor(.white)
                            .padding(.top, 40)
                            .onAppear {
                                withAnimation(Animation.default.delay(3)) {
                                    fadeInText = true
                                }
                            }
                                     
                        Image("ingredients")
                            .resizable()
                            .opacity(fadeInText ? 1:0)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400)
                            .padding(.top, -20)
                            .onAppear {
                                withAnimation(Animation.default.delay(3)) {
                                    fadeInText = true
                                }
                            }
                    }
                }
                .padding(.top, -60)
                
                //Skin benefits view
                VStack {
                    Text("...And designed to strengthen the skin barrier after just one use.")
                        .font(.custom("Optima-Regular", size: 40))
                        .foregroundColor(CustomColor.light_pink)
                        .padding(.horizontal, 100)
                        .padding(.vertical, 50)
                    
                    
                    //4 Images
                    HStack {
                        Image("model2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                Group {
                                    if isOverlay2Visible {
                                        Rectangle()
                                            .fill(.black)
                                            .mask(RoundedRectangle(cornerRadius: 0, style: .continuous))
                                            .frame(width: 148, height: 148)
                                            .padding(.top,-2)
                                            .opacity(0.3)
                                        
                                        Text("Increases barrier recovery")
                                            .font(.custom("Optima-Bold", size: 15))
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                }
                            )
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    isOverlay2Visible.toggle()                       }
                            }
                        
                        Image("model4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                Group {
                                    if isOverlay4Visible {
                                        Rectangle()
                                            .fill(.black)
                                            .mask(RoundedRectangle(cornerRadius: 0, style: .continuous))
                                            .frame(width: 148, height: 148)
                                            .padding(.top,-2)
                                            .opacity(0.3)
                                        
                                        Text("Removes excess oil")
                                            .font(.custom("Optima-Bold", size: 15))
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                }
                            )
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    isOverlay4Visible.toggle()                       }
                            }
                    }
                    .frame(width: 300)
                    HStack {
                        Image("model1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                Group {
                                    if isOverlay1Visible {
                                        Rectangle()
                                            .fill(.black)
                                            .mask(RoundedRectangle(cornerRadius: 0, style: .continuous))
                                            .frame(width: 148, height: 148)
                                            .padding(.top,-2)
                                            .opacity(0.3)
                                        
                                        Text("Moisturizes skin")
                                            .font(.custom("Optima-Bold", size: 15))
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                }
                            )
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    isOverlay1Visible.toggle()
                                }
                            }
                        Image("model3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                Group {
                                    if isOverlay3Visible {
                                        Rectangle()
                                            .fill(.black)
                                            .mask(RoundedRectangle(cornerRadius: 0, style: .continuous))
                                            .frame(width: 148, height: 148)
                                            .padding(.top,-2)
                                            .opacity(0.3)
                                        
                                        Text("Minimizes pores")
                                            .font(.custom("Optima-Bold", size: 15))
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                }
                            )
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    isOverlay3Visible.toggle()
                                }
                            }
                    }
                    .padding(.bottom, 90)
                    .frame(width: 300)
                }
                ZStack {
                    VStack {
                        TabView(selection: $newimage) {
                            ForEach(0..<4, id: \.self) { index in
                                Image("image\(index + 1)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            }
                        }
                    }
                    .frame(width: 400, height: 800)
                    .padding(.top, -110)
                        
                    Button(action: {
                        withAnimation {
                            newimage = (newimage + 1) % 4
                        }
                       }) {
                        Image(systemName: "chevron.right.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.top, 100)
                            .padding(.leading, 330)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}
    


struct RestView_Previews: PreviewProvider {
    static var previews: some View {
       RestView()
    }
}
