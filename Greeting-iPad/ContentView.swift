//
//  ContentView.swift
//  Greeting-iPad
//
//  Created by Kitwana Akil on 5/25/23.
//

import SwiftUI

func getCurrentTime() -> String {
    
    let formatter = DateFormatter()
    
    formatter.timeStyle = .short
    
    let dateString = formatter.string(from: Date())
    
    return dateString
}

func getCurrentHour() -> String {
    
    let formatter = DateFormatter()
    
    formatter.dateFormat = "HH"
    
    let hourString = formatter.string(from: Date())
    
    return hourString
}

func getCurrentMinutes() -> String {
    
    let dateElement = Calendar.current.dateComponents([.minute], from: Date())
    
    let minutesString = dateElement.minute ?? 0
    
    return String(minutesString)
}

func chooseGreeting(for hour: Int) -> String {
    
    let noon = 12
    let startOfEvening = 17
    let startOfNight = 20
    let midnight = 0
    
    
    if (hour > midnight && hour < noon) {
        return "Good Morning!"
    } else if ( hour >= noon && hour < startOfEvening) {
        return "Good Afternoon!"
    } else if ( hour > 17 && hour < 20 ) {
        return "Good Evening!"
    } else {
        return "Good Night!"
    }
    
    //return String("Good Afternoon!")
}

func chooseIcon(for hour: Int) -> String {
    
    let startOfNight = 0
    let startOfSunrise = 5
    let startOfMorning = 8
    let startOfSunset = 18
    
    if (hour >= startOfNight && hour < startOfSunrise) {
        return "moon.fill"
    } else if ( hour >= startOfSunrise && hour < startOfMorning) {
        return "sunrise.fill"
    } else if ( hour >= startOfMorning && hour < startOfSunset) {
        return "sun.fill"
    } else {
        return "sunset.fill"
    }
    
}

struct ContentView: View {
    
    let currentTime = getCurrentTime()
    
    let currentHour = getCurrentHour()
    
    let currentMinute = getCurrentMinutes()
    
    var body: some View {
        
        let greeting = chooseGreeting(for: Int(currentHour)!)
        
        VStack (spacing: 50) {
            Text("Current Time:")
            Text(currentTime)
            Text(greeting)
            Image(systemName: chooseIcon(for: 1))
//            Text("Current Hour:")
//            Text(currentHour)
//            Text("Current Minute:")
//            Text(currentMinute)
        }
        .padding()
        .font(.title)
        .fontWeight(.heavy)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
