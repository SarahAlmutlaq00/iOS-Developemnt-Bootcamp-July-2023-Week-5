//
//  RootView.swift
//  threadsApp
//
//  Created by Sarah on 20/08/2023.
//

import SwiftUI


struct RootView: View {
    let timer = Timer
      .TimerPublisher(
        interval: 2,
        runLoop: .main,
        mode: .default
      )
      .autoconnect()

    @State var finishedLoadingSplashScreen: Bool = false

//    @EnvironmentObject var userPreferences: UserPreferencesViewModels
    var body: some View {
        
//        OnboardingView()
        

        if finishedLoadingSplashScreen {
            OnboardingView()
           } else {
             ZStack {
               Image("threadIicon")
                     .resizable()
                     .scaledToFit()
               VStack {
                 Spacer()
                   Image("bb")
                       .padding(.bottom, 10)
               }
             }
             .onReceive(timer) { _ in
               timer.upstream.connect().cancel()
               finishedLoadingSplashScreen = true
             }
           }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()

    }
}
