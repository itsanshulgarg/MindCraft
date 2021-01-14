//
//  LoadingView.swift
//  MindCraft
//
//  Created by Anshul Garg on 13/01/21.
//

import SwiftUI

struct LoadingView: View {
    var loaderTime : String
    var filename : String = "loading"
    var body: some View {
        //Lottie
        VStack {
            LottieView(filename: self.filename, time: self.loaderTime)
                .frame(width: 200, height: 200)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(loaderTime: "infinity")
    }
}
