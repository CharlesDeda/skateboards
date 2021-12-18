//
//  appView.swift
//  skateboards
//
//  Created by Nick Deda on 12/16/21.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct AppView: View {
  let store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        List {
          ForEachStore(store.scope(
            state: \.skateboards,
            action: AppAction.skateboards
          )) { childStore in
            WithViewStore(childStore) { childViewStore in
              NavigationLink(childViewStore.name) {
                SkateboardView(store: childStore)
              }
            }
          }
        }
        .navigationTitle("Skateboards")
        .toolbar {
          Button("Add") {
            // add new skateboard
          }
        }
      }
    }
  }
}


struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(store: AppState.defaultStore)
      .preferredColorScheme(.dark)
  }
}
