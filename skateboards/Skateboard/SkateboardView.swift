//
//  ContentView.swift
//  skateboards
//
//  Created by Nick Deda on 12/16/21.
//

import SwiftUI
import ComposableArchitecture

struct SkateboardState: Equatable {
  let name: String
  var backgroundColor: Color
  var wheelColor: Color
  var trucksColor: Color
  let description: String
}

enum SkateboardAction: Equatable {
  case updateBase(Color)
  case updateTrucks(Color)
  case updateWheels(Color)
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
    
  }
}

extension SkateboardState {
  static let mockStore = Store(
    initialState: SkateboardState(
      name: "Plan B",
      backgroundColor: .red,
      wheelColor: .gray,
      trucksColor: .blue,
      description: .lorumIpsum
    ),
    reducer: skateboardReducer,
    environment: SkateboardEnvironment()
  )
}

struct SkateboardView: View {
  let store: Store<SkateboardState, SkateboardAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        TitleView(store: store)
        ShapeView(store: store)
        DetailView(store: store)
        Spacer()
      }
      .padding()
    }
  }
}



// MARK: - Helper Views

private struct DetailView: View {
  let store: Store<SkateboardState, SkateboardAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      ColorPicker.init("Base", selection: viewStore.binding(get: \.backgroundColor, send: SkateboardAction.updateBase))
      ColorPicker.init("Trucks", selection: viewStore.binding(get: \.trucksColor, send: SkateboardAction.updateTrucks))
      ColorPicker.init("Wheels", selection: viewStore.binding(get: \.wheelColor, send: SkateboardAction.updateWheels))
    }
  }
}

private struct TitleView: View {
  let store: Store<SkateboardState, SkateboardAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack(alignment: .leading) {
        Text(viewStore.name)
          .font(.title)
          .bold()
        Text(viewStore.description)
          .font(.subheadline)
          .lineLimit(4)
      }
      .padding(.bottom)
    }
  }
}

private struct ShapeView: View {
  let store: Store<SkateboardState, SkateboardAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      GroupBox {
        VStack {
          ZStack {
            BaseView(store: store)
            VStack {
              WheelsView(store: store)
              Spacer()
              WheelsView(store: store)
            }
            .padding(.vertical, 100)
          }
          .frame(width: 140, height: 450)
        }
        .frame(maxWidth: .infinity)
      }
    }
  }
}

private struct BaseView: View {
  let store: Store<SkateboardState, SkateboardAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      RoundedRectangle(cornerRadius: 130, style: .continuous)
        .foregroundColor(viewStore.backgroundColor)
        .padding()
    }
  }
}

private struct WheelsView: View {
  let store: Store<SkateboardState, SkateboardAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      HStack {
        RoundedRectangle(cornerRadius: 10)
          .foregroundColor(viewStore.wheelColor)
          .frame(width: 30, height: 50)
        RoundedRectangle(cornerRadius: 10)
          .foregroundColor(viewStore.trucksColor)
          .frame(height: 25)
        RoundedRectangle(cornerRadius: 10)
          .foregroundColor(viewStore.wheelColor)
          .frame(width: 30, height: 50)
      }
    }
  }
}

struct SkateboardView_Previews: PreviewProvider {
  static var previews: some View {
    SkateboardView(store: SkateboardState.mockStore)
      .preferredColorScheme(.dark)
  }
}
