//
//  ContentView.swift
//  skateboards
//
//  Created by Nick Deda on 12/16/21.
//

import SwiftUI

struct Skateboard {
  let name: String
  var backgroundColor: Color
  var wheelColor: Color
  var trucksColor: Color
  let description: String
}
let mock = Skateboard(
  name: "Plan B",
  backgroundColor: .red,
  wheelColor: .gray,
  trucksColor: .blue,
  description: .lorumIpsum
)

struct AppView: View {
  let skateboard = mock
  
  var body: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading) {
        Text(skateboard.name)
          .font(.title)
          .bold()
        Text(skateboard.description)
          .font(.subheadline)
          .lineLimit(4)
      }
      .padding(.bottom)
      GroupBox {
        VStack {
          SkateboardView(skateboard: skateboard)
        }
        .frame(maxWidth: .infinity)
      }
      Spacer()
    }
    .padding()
  }
}

struct SkateboardView: View {
  let skateboard: Skateboard
  
  var body: some View {
    ZStack {
      BaseView(skateboard: skateboard)
      VStack {
        WheelsView(skateboard: skateboard)
        Spacer()
        WheelsView(skateboard: skateboard)
      }
      .padding(.vertical, 100)
    }
    .frame(width: 140, height: 450)
  }
}

struct BaseView: View {
  let skateboard: Skateboard
  
  var body: some View {
    RoundedRectangle(cornerRadius: 130, style: .continuous)
      .foregroundColor(skateboard.backgroundColor)
      .padding()
  }
}

struct WheelsView: View {
  let skateboard: Skateboard
  
  var body: some View {
    HStack {
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(skateboard.wheelColor)
        .frame(width: 30, height: 50)
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(skateboard.trucksColor)
        .frame(height: 25)
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(skateboard.wheelColor)
        .frame(width: 30, height: 50)
    }
  }
}
extension String {
  static let lorumIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
      .preferredColorScheme(.dark)
  }
}
