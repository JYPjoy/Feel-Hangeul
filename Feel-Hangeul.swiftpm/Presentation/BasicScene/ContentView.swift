import SwiftUI

import SwiftUI

struct ContentView: View {
    
    @StateObject var coordinator = Coordinator()
    var body: some View {
        VStack {
            coordinator.navigationLinkSection()

            Button {
                let utterance = TTSManager.getAVSpeechUtterance(string:
                "Hello, world!")
                TTSManager.shared.speak(utterance)
            } label: {
                Text("TTS체험")
                    .foregroundColor(.green)
                    .padding()
                    .background(.red)
            }

            Button {
                TTSManager.stop()
                coordinator.push(destination: .content2)
            } label: {
                Text("다음으로")
                    .foregroundColor(.red)
                    .padding()
                    .background(.green)
            }
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

