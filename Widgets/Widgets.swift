//
//  Widgets.swift
//  Widgets
//
//  Created by Rostislav Brož on 3/9/22.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), primaryAddress: ContentModel().addresses[ContentModel().primary], qrCode: ContentModel().generateQRCode(from: ContentModel().addresses[ContentModel().primary]))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, primaryAddress: ContentModel().addresses[ContentModel().primary], qrCode: ContentModel().generateQRCode(from: ContentModel().addresses[ContentModel().primary]))
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
            let entry = SimpleEntry(date: .now, configuration: configuration, primaryAddress: ContentModel().addresses[ContentModel().primary], qrCode: ContentModel().generateQRCode(from: ContentModel().addresses[ContentModel().primary]))
            let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 30)))
            completion(timeline)
    }
}


struct SimpleEntry: TimelineEntry {    
    let date: Date
    let configuration: ConfigurationIntent
    let primaryAddress: String
    let qrCode: UIImage
}


struct QRWidget: Widget {
    let kind: String = "QR Code Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            QRWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("QR Code Widget")
        .description("Widget that displays QR code of primary Solana address picked by you")
        .supportedFamilies([.systemSmall])
    }
}


// MARK: @main

@main
struct StuduWidgetsBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        QRWidget()
    }
}
