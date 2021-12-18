//
//  skateboardsApp.swift
//  skateboards
//
//  Created by Nick Deda on 12/16/21.
//

import SwiftUI
import ComposableArchitecture

@main
struct skateboardsApp: App {
  var body: some Scene {
    WindowGroup {
      AppView(store: AppState.defaultStore)
    }
  }
}
