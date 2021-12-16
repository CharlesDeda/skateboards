//
//  appView.swift
//  skateboards
//
//  Created by Nick Deda on 12/16/21.
//

import Foundation
import SwiftUI

struct AppView: View {
  
  var body: some View {
    SkateboardView(store: SkateboardState.mockStore)
  }
}


struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
      .preferredColorScheme(.dark)
  }
}
