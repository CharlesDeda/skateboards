//
//  ContentView.swift
//  skateboards
//
//  Created by Nick Deda on 12/16/21.
//

import SwiftUI

struct SkateboardView: View {
  let skateboard: Skateboard
  
  var body: some View {
    VStack(alignment: .leading) {
      SkateboardTitleView(skateboard: skateboard)
      SkateboardShapeView(skateboard: skateboard)
      Spacer()
    }
    .padding()
  }
}

struct SkateboardTitleView: View {
  let skateboard: Skateboard
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(skateboard.name)
        .font(.title)
        .bold()
      Text(skateboard.description)
        .font(.subheadline)
        .lineLimit(4)
    }
    .padding(.bottom)
  }
}

struct SkateboardShapeView: View {
  let skateboard: Skateboard
  
  var body: some View {
    GroupBox {
      VStack {
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
      .frame(maxWidth: .infinity)
    }
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

struct SkateboardView_Previews: PreviewProvider {
  static var previews: some View {
    SkateboardView(skateboard: mock)
      .preferredColorScheme(.dark)
  }
}
