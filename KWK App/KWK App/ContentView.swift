import SwiftUI
import AVKit

struct ContentView: View {
    
    @State private var isTextVisible = 0.0
    @State private var fadeIn = false
    @State private var fadeInNutritious = false
    @State private var fadeInButton = false
    @State private var player: AVPlayer?
    
    var videoDisplay: some View {
        VStack {
            
            //setting up video player
            GeometryReader { proxy in
                if let player = player {
                    AVPlayerController(player: player)
                        .frame(width: proxy.size.height * 16 / 8, height: proxy.size.height)
                        .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
                }
            }
            .onAppear {
                let avPlayer = AVPlayer(url: videosURL)
                avPlayer.isMuted = true
                avPlayer.play()
                self.player = avPlayer
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                //video player in background
                videoDisplay
                
                //text appearing on screen
                VStack {
                    Text("INTRODUCING")
                        .padding(.top, 40.0)
                        .font(.custom("Optima-Regular", size: 40))
                        .opacity(fadeIn ? 1:0)
                        .onAppear {
                            withAnimation(Animation.default.delay(3)) {
                                fadeIn = true
                            }
                        }
                    
                        Text("NUTRITIOUS")
                            .font(.custom("Optima-Bold", size: 55))
                            .opacity(fadeInNutritious ? 1:0)
                            .onAppear {
                                withAnimation(Animation.default.delay(5)) {
                                    fadeInNutritious = true
                                }
                            }
                    
                    Spacer()
                    
                    //"explore" button appears
                    NavigationLink(destination: MainView()) {
                        Text("Explore")
                            .font(.custom("Optima-Bold", size: 17))
                    }
                    .padding(.bottom, 25.0)
                    .buttonStyle(CustomButtonsStyle())
                    .opacity(fadeInButton ? 1:0)
                    .onAppear {
                        withAnimation(Animation.default.delay(6)) {
                            fadeInButton = true
                        }
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
    
    //preview
    struct ContentViewPreview: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

//setting up custom button style
struct CustomButtonsStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        return configuration.label
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 40).fill(CustomColor.bright_pink))
            .foregroundColor(.white)
            .padding(.horizontal, 120)
    }
}

//setting up video player
struct AVPlayerController: UIViewControllerRepresentable {
    typealias UIViewControllerType = AVPlayerViewController
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player
    }
}

//video URL
var videosURL: URL {
    guard let path = Bundle.main.path(forResource: "entryvideo", ofType: "mov") else {
            fatalError("Video file not found.")
        }
    return URL(fileURLWithPath: path)
}

