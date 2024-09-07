import SwiftUI

struct RequestTimeOffView: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var reason = ""
    @State private var showConfirmation = false
    @State private var showValidationError = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            // Mocha Background Color
            Color(red: 0.76, green: 0.69, blue: 0.64)
                .ignoresSafeArea()

            VStack(spacing: 25) {
                // Title for the page
                Text("Request Time Off")
                    .font(.system(size: 34, weight: .bold, design: .serif))
                    .foregroundColor(.black)
                    .padding(.top, 40)

                // Instructional subtitle
                Text("Please fill out the details below")
                    .font(.headline)
                    .foregroundColor(.black.opacity(0.8))

                // Start Date Picker with an icon
                DatePickerView(label: "Start Date", selection: $startDate, iconName: "calendar")

                // End Date Picker with an icon
                DatePickerView(label: "End Date", selection: $endDate, iconName: "calendar")

                // Reason for time off input field
                HStack {
                    Image(systemName: "pencil")
                        .font(.title2)
                        .foregroundColor(.black.opacity(0.7))

                    TextField("Reason for Time Off", text: $reason)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                .padding(.horizontal)

                // Submit Request Button
                Button(action: {
                    // Basic validation: Ensure the reason is not empty and dates are valid
                    if !reason.isEmpty && startDate <= endDate {
                        showConfirmation = true
                        showValidationError = false
                    } else {
                        showValidationError = true
                    }
                }) {
                    Text("Submit Request")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)

                // Display validation error if necessary
                if showValidationError {
                    Text("Please enter a valid reason and ensure the end date is after the start date.")
                        .font(.footnote)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }

                Spacer()

                // Logout button at the bottom
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
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)

                // Confirmation alert
                .alert(isPresented: $showConfirmation) {
                    Alert(
                        title: Text("Request Submitted"),
                        message: Text("Your time off request from \(formattedDate(startDate)) to \(formattedDate(endDate)) has been submitted."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .padding()
        }
    }

    // Helper function to format the date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

// Custom View for Date Picker with Icon
struct DatePickerView: View {
    let label: String
    @Binding var selection: Date
    let iconName: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.title2)
                .foregroundColor(.black.opacity(0.7))
            
            DatePicker(label, selection: $selection, displayedComponents: [.date])
                .padding(.horizontal)
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
                .shadow(radius: 3)
        }
        .padding(.horizontal)
    }
}

// Preview
struct RequestTimeOffView_Previews: PreviewProvider {
    static var previews: some View {
        RequestTimeOffView()
    }
}
