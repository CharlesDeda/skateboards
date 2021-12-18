//
//  Skateboard State.swift
//  skateboards
//
//  Created by Nick Deda on 12/16/21.
//

import SwiftUI
import ComposableArchitecture

struct SkateboardState: Identifiable, Equatable {
  let id = UUID()
  var name: String
  var backgroundColor: Color
  var wheelColor: Color
  var trucksColor: Color
  var description: String
}

enum SkateboardAction: Equatable {
  case updateBase(Color)
  case updateTrucks(Color)
  case updateWheels(Color)
  case updateName(String)
  case updateDescription(String)
}

struct SkateboardEnvironment {
}

let skateboardReducer = Reducer<SkateboardState, SkateboardAction, SkateboardEnvironment> { state, action, environment in
  switch action {
    
  case let .updateBase(color):
    state.backgroundColor = color
    return .none
    
  case let .updateTrucks(color):
    state.trucksColor = color
    return .none
    
  case let .updateWheels(color):
    state.wheelColor = color
    return .none
    
  case let .updateName(string):
    state.name = string
    return .none

  case let .updateDescription(string):
    state.description = string
    return .none
  }
}

extension SkateboardState {
  static let mockStore = Store(
    initialState: SkateboardState(
      name: "Plan B",
      backgroundColor: .red,
      wheelColor: .gray,
      trucksColor: .blue,
      description: "The original Plan B Skateboarding team was founded in 1991 by Mike Ternasky who had departed from the H-Street company that he had formerly managed with Tony Magnusson. Ternasky, to the dismay of Magnusson, also managed to convince numerous team riders to assist with the development of the new brand."
    ),
    reducer: skateboardReducer,
    environment: SkateboardEnvironment()
  )
}
