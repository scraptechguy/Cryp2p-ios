//
//  QREntryView.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 3/9/22.
//

import SwiftUI

struct QRWidgetEntryView: View {
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            switch widgetFamily {
                case .systemSmall:
                    QRWidgetSmall(entry: entry)
                        .environmentObject(ContentModel())
                
                default:
                    Text("Not implemented!")
            }
        }
    }
}
