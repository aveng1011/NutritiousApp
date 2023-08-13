
import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    FinderView()
                        .frame(height:900)
                    RestView()
                        .padding(.top, -56)
                    QuestionView()
                        .padding(.top, -200)
                        
                }
            } //scroll view
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        } //navigation view
            .navigationBarBackButtonHidden(true)
    } //some view
} // content view

    
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}




