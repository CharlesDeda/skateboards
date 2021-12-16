//
//  appView.swift
//  skateboards
//
//  Created by Nick Deda on 12/16/21.
//

import Foundation
import SwiftUI

struct AppView: View {
  let skateboard = mock
  
  var body: some View {
    SkateboardView(skateboard: skateboard)
  }
}


struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
      .preferredColorScheme(.dark)
  }
}
