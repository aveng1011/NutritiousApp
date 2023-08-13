
import SwiftUI

struct FinderView: View {
    @State var showm = true
    @State var showl = true
    @State var showf = true
    
    var body: some View {
        NavigationView {
            ScrollView { 
                VStack {
                    ZStack {
                        
                        //background image
                        Image("all_full")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 455)
                        Image("m_main")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90)
                            .padding(.top, 351)
                            .padding(.trailing,298)
                            .onTapGesture {
                                withAnimation (.spring(response: 1, dampingFraction: 0.8)) {
                                    showm.toggle()
                                }
                            }
                        Image("l_main")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 91)
                            .padding(.top, 379)
                            .padding(.leading, 271)
                            .onTapGesture {
                                withAnimation (.spring(response: 1, dampingFraction: 0.8)) {
                                    showl.toggle()
                                }
                            }
                        Image("fc_main")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 63.5)
                            .padding(.top, 252)
                            .padding(.leading, 150)
                            .onTapGesture {
                                withAnimation (.spring(response: 1, dampingFraction: 0.8)) {
                                    showf.toggle()
                                }
                            }
                        
                        //text overlay
                        VStack {
                            Text("ESTEE LAUDER")
                                .font(.custom("Optima-Regular", size: 50))
                                .padding(.top, 85)
                                .padding(.bottom, 20)
                            Text("Discover the ")
                                .font(.custom("Optima-Regular", size: 28))
                                .padding(.horizontal, 58)
                            Text("Nutritious collection")
                                .font(.custom("Optima-Regular", size: 28))
                                .padding(.horizontal, 66)
                                .padding(.bottom, 5)
                            Text("Harnessing the power of Nutrigenomics and featuring a Nutri-9 complex. This collection is made with carefully calibrated essential nutrient rich ingredients.")
                                .font(.custom("Optima-Regular", size: 14))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 60)
                            Spacer()
                            Text("Tap on the products above")
                                .font(.custom("Optima-Regular", size: 15))
                                .padding(.horizontal, 66)
                                .foregroundColor(.pink)
                                .padding(.top, 340)
                            Spacer()
                        }
                        .foregroundColor(.white)
                        
                        //pop-ups on click
                        if !showl {
                            Product2(showl: $showl)
                                .onTapGesture { withAnimation (.spring(response: 1, dampingFraction: 0.8)) {
                                    showl.toggle()
                                }
                                }
                        }
                        
                        if !showm {
                            Product1(showm: $showm)
                                .onTapGesture {
                                    withAnimation (.spring(response: 1, dampingFraction: 0.8)) {
                                        showm.toggle()
                                    }
                                }
                        }
                        
                        if !showf {
                            Product3(showf: $showf)
                                .onTapGesture {
                                    withAnimation (.spring(response: 1, dampingFraction: 0.8)) {
                                        showf.toggle()
                                    }
                                }
                        }
                        
                    } //ZStack
                    
                }
            } //scroll view
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        } //navigation view
        
    } //some view
} // content view
    
struct FinderView_Previews: PreviewProvider {
    static var previews: some View {
        FinderView()
    }
}

struct CustomColor {
    static let leaf_color = Color("leaf_color")
    static let light_pink = Color("light_pink")
    static let bright_pink = Color("bright_pink")
}
