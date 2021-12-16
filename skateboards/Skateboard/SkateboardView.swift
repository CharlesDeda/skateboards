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

struct MainSkateboardView: View {
  let skateboard: Skateboard

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


