import SwiftUI
import Charts

struct SustainabilityMetric: Identifiable {
    let id = UUID()
    let month: String
    let impactScore: Int // A score out of 100
}

let mockMetrics: [SustainabilityMetric] = [
    .init(month: "Jan", impactScore: 65),
    .init(month: "Feb", impactScore: 70),
    .init(month: "Mar", impactScore: 78),
    .init(month: "Apr", impactScore: 85),
    .init(month: "May", impactScore: 82),
    .init(month: "Jun", impactScore: 90)
]

struct MetricView: View {
    let value: Int
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text("\(value)")
                .font(.title2.bold())
                .foregroundColor(Color("ButtonColor")) 
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(Color(.systemGray6)) 
        .cornerRadius(12)
    }
}

struct TrackerView: View {
    let data = mockMetrics
        var body: some View {
            NavigationView {
                List {
                    VStack (alignment: .leading, spacing: 5) {
                        Text("Campaign Sustainability Overview")
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                            
                        Text ("Track the enviromental impact score of your marketing campaigns over time.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 10)
                    }
                    .padding(.vertical, 10)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
                    Section ("Monthly Impact Score") {
                        VStack (alignment: .leading){
                            Text ("Current Score 90 / 100")
                                .font(.title3.bold())
                                .foregroundColor(.green)
                                .padding(.bottom, 10)
                                
                            Chart (data) {
                                metric in BarMark (x: .value("Month", metric.month), y: .value("Score", metric.impactScore))
                                    .foregroundStyle(
                                        LinearGradient (
                                            gradient: Gradient(colors: [Color.green.opacity(0.8)]), startPoint: .bottom, endPoint: .top)
                                    )
                            }
                            .chartYScale(domain: 0...100)
                            .frame (height: 250)
                        }
                    }
                    .listRowBackground(Color(.systemGray6).opacity(0.5))
                    
                    Section ("Key Insights") {
                        Label ("Junes Score of 90 is 5% better than the 6-month average.", systemImage: "chart.line.uptrend.xyaxis")
                            .foregroundColor(.green)
                        Label ("Review optimization tips for Q3 to reach 95+ score.", systemImage: "lightbulb.fill")
                            .foregroundColor(.orange)
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Tracker")
            }
        }
    }
