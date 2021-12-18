//
//  AppState.swift
//  skateboards
//
//  Created by Nick Deda on 12/18/21.
//

import ComposableArchitecture

struct AppState: Equatable {
  var skateboards: IdentifiedArrayOf<SkateboardState> = []
}

enum AppAction: Equatable {
  case skateboards(id: SkateboardState.ID, action: SkateboardAction)
}

struct AppEnvironment {}

let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
  skateboardReducer.forEach(
    state: \.skateboards,
    action: /AppAction.skateboards(id:action:),
    environment: { _ in .init() }
  ),
  Reducer { state, action, environment in
    switch action {
      
    case .skateboards:
      return .none
    }
  }
)

extension AppState {
  static let defaultStore = Store(
    initialState: AppState(skateboards: [
      SkateboardState(
        name: "Girl",
        backgroundColor: .red,
        wheelColor: .black,
        trucksColor: .blue,
        description: "Guh"
      ),
      SkateboardState(
        name: "Plan B",
        backgroundColor: .red,
        wheelColor: .gray,
        trucksColor: .blue,
        description: "The original Plan B Skateboarding team was founded in 1991 by Mike Ternasky who had departed from the H-Street company that he had formerly managed with Tony Magnusson. Ternasky, to the dismay of Magnusson, also managed to convince numerous team riders to assist with the development of the new brand."
      ),
      SkateboardState(
        name: "Lakaii",
        backgroundColor: .pink,
        wheelColor: .black,
        trucksColor: .purple,
        description: "Kody"
      ),
    ]),
    reducer: appReducer,
    environment: AppEnvironment()
  )
}


