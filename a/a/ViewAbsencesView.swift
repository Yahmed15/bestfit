import SwiftUI

struct ViewAbsencesView: View {
    @Environment(\.presentationMode) var presentationMode

    // Sample employee data (matching with EmployeeDetailsView)
    let absences: [(date: String, employee: String, type: String)] = [
        ("2024-09-15", "Alice Smith", "Sick Leave"),
        ("2024-09-25", "Bob Johnson", "Annual Leave")
    ]

    var body: some View {
        ZStack {
            // Mocha background for the entire view
            Color(red: 0.76, green: 0.69, blue: 0.64)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Title with mocha style
                Text("View Absences")
                    .font(.system(size: 34, weight: .bold, design: .serif))
                    .foregroundColor(.black)
                    .padding()

                // Instructional subtitle
                Text("Here is the list of employee absences")
                    .font(.headline)
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.bottom, 10)

                // Display absence data with improved design
                List(absences, id: \.date) { absence in
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Date: \(absence.date)")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text("Employee: \(absence.employee)")
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.8))

                            Text("Type: \(absence.type)")
                                .font(.subheadline)
                                .foregroundColor(.blue) // Color to differentiate types
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color(red: 0.76, green: 0.69, blue: 0.64)) // Mocha background for list items
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
                .listStyle(PlainListStyle()) // Use PlainListStyle for a clean look
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

struct ViewAbsencesView_Previews: PreviewProvider {
    static var previews: some View {
        ViewAbsencesView()
    }
}
