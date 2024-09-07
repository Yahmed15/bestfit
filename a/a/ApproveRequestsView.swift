import SwiftUI

struct ApproveRequestsView: View {
    @Environment(\.presentationMode) var presentationMode

    // Sample data (can be replaced with dynamic data from a backend or state management)
    let requests: [(employee: String, dateRange: String, status: String)] = [
        ("Alice Smith", "2024-09-15 to 2024-09-20", "Pending"),
        ("Bob Johnson", "2024-09-25", "Approved")
    ]

    var body: some View {
        ZStack {
            // Mocha background for the entire view
            Color(red: 0.76, green: 0.69, blue: 0.64)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Title with mocha style
                Text("Approve/Reject Requests")
                    .font(.system(size: 34, weight: .bold, design: .serif))
                    .foregroundColor(.black)
                    .padding()

                // Instructional subtitle
                Text("Manage time-off requests from employees")
                    .font(.headline)
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.bottom, 10)

                // Display request approval interface with visual improvements
                List(requests, id: \.employee) { request in
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(request.employee)")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text("Date Range: \(request.dateRange)")
                                    .font(.subheadline)
                                    .foregroundColor(.black.opacity(0.7))

                                Text("Status: \(request.status)")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(request.status == "Pending" ? .orange : .green)
                            }
                            Spacer()

                            // Stack Approve and Reject buttons vertically with spacing
                            VStack(spacing: 15) {
                                Button(action: {
                                    // Approve request action
                                }) {
                                    Text("Approve")
                                        .font(.headline)
                                        .frame(width: 100, height: 30)
                                        .background(Color.green.opacity(0.8))
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                        .shadow(radius: 3)
                                }

                                Button(action: {
                                    // Reject request action
                                }) {
                                    Text("Reject")
                                        .font(.headline)
                                        .frame(width: 100, height: 30)
                                        .background(Color.red.opacity(0.8))
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                        .shadow(radius: 3)
                                }
                            }
                        }
                        .padding()
                        .background(Color(red: 0.76, green: 0.69, blue: 0.64)) // Mocha background for list items
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        
                        // Separator for better visual distinction
                        Divider()
                            .background(Color.black.opacity(0.5))
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal)
                .frame(maxWidth: .infinity)

                // Logout button
                Button(action: {
                    // Navigate back to the main page
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Logout")
                        .font(.title2)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .padding()
        }
    }
}

struct ApproveRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        ApproveRequestsView()
    }
}
