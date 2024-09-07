import SwiftUI

struct AbsenceHistoryView: View {
    @Environment(\.presentationMode) var presentationMode

    // Sample data (can be replaced with dynamic data from a backend or state management)
    let absenceHistory: [(date: String, reason: String)] = [
        ("2024-08-10", "Sick Leave"),
        ("2024-07-20", "Annual Leave")
    ]

    var body: some View {
        ZStack {
            // Mocha background
            Color(red: 0.76, green: 0.69, blue: 0.64)
                .ignoresSafeArea()

            VStack(spacing: 25) {
                // Title with mocha style
                Text("Absence History")
                    .font(.system(size: 34, weight: .bold, design: .serif))
                    .foregroundColor(.black)
                    .padding(.top, 40)

                // Instructional subtitle
                Text("Review your past absences")
                    .font(.headline)
                    .foregroundColor(.black.opacity(0.8))

                // Display absence history with visual improvements
                List(absenceHistory, id: \.date) { entry in
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(entry.date)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text(entry.reason)
                                    .font(.subheadline)
                                    .foregroundColor(.black.opacity(0.7))
                            }
                            Spacer()
                            // Icon to enhance UI clarity for each absence
                            Image(systemName: "calendar")
                                .font(.title3)
                                .foregroundColor(.black.opacity(0.8))
                        }
                        .padding(.vertical, 10)
                        .background(Color.white.opacity(0.9)) // White card style for items
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        
                        // Separator for better visual distinction
                        Divider()
                            .background(Color.black.opacity(0.3))
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

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
                .padding(.bottom, 20)
            }
            .padding()
        }
    }
}

struct AbsenceHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        AbsenceHistoryView()
    }
}
