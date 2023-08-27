//
//  OnboardingView.swift
//  threadsApp
//
//  Created by Sarah on 20/08/2023.
//

import SwiftUI

struct OnboardingView: View {
//    enum presented {
//          case authentication
//          case mainView
//      }
    enum CurrentPresentedView {
          case authenticationView
          case mainView
      }
//      @State var p : presented = .authentication
//      @ObservedObject var auth = AuthViewModel()
    @EnvironmentObject  var userDate : UserDataViewModel
    @EnvironmentObject var auth: AuthViewModel
    @State var presentedView: CurrentPresentedView = .authenticationView
    var body: some View {
        switch presentedView{
        case.authenticationView:
            VStack{
                Image("dd")
                    .resizable ()
                    .scaledToFit ()
                Spacer()
                Button(
                    action: {
                        if auth.signIn(userDate.users.randomElement()!.id){
                            presentedView = .mainView
                        }else{
                            presentedView = .authenticationView
                        }
                    },
                    label: {
                        Text("Sign in")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.gray)
                            .cornerRadius(12)
                            .padding()
                            .foregroundColor(.white)
                           
                    
                }
                )
            }
            
        case.mainView:
            MianView()
        }
//        switch p {
//           case .mainView:
//               MianView()
//           case .authentication:
//               VStack{
//                   Image("dd")
//                    .resizable()
//                    .scaledToFill()
//                   Button {
//                    let x = auth.signIn()
//                    p = x ? .mainView : .authentication
//                   }
//               label: {
//                   Text("Log in ")
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(.gray)
//                .cornerRadius(12)
//                .padding()
//                .foregroundColor(.white)
//                .bold()
//                   }
//
//               }
//           }

    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
