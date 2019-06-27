//
//  ContentView.swift
//  SwiftDIDemo
//
//  Created by v.a.prusakov on 27/06/2019.
//  Copyright © 2019 Vladislav Prusakov. All rights reserved.
//

import SwiftUI
import SwiftDI

struct ContentView : View {
    
    @BindObjectInjectable var networkService: NetworkServiceInput
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                Text(self.networkService.hasData ? "Has data" : "No data")
                Button(action: self.getData, label: { Text("Refresh") })
                Button(action: self.clearData, label: { Text("ClearData") })
                Spacer()
            }.navigationBarTitle(Text("SwiftDI Test"))
        }.onAppear { self.getData() }
    }
    
    func getData() {
        self.networkService.getData()
    }
    
    func clearData() {
        self.networkService.clearData()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
