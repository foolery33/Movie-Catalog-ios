import SwiftUI

struct DatePickerView: View {
    
    @Binding var dateValue: Date
    @Binding var dateText: String?
    let placeholderText: String
    let isNecessary: Bool
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8).stroke(Color.strokeColor, lineWidth: 1).frame(height: 43).padding([.leading, .trailing], 0.3)
            HStack {
                if(dateText == nil) {
                    HStack(spacing: 0) {
                        Text(placeholderText)
                            .padding(.leading, 16)
                            .foregroundColor(.grayFaded)
                            .font(.system(size: 14, weight: .regular))
                        if(isNecessary) {
                            Text("*")
                                .foregroundColor(.redColor)
                                .font(.system(size: 14, weight: .bold))
                        }
                    }
                }
                else {
                    Text(dateText!)
                        .foregroundColor(.redColor)
                        .font(.system(size: 14, weight: .regular))
                        .padding([.top, .bottom], 13)
                        .padding(.leading, 16)
                }
                Spacer()
                ZStack {
                    DatePicker("", selection: $dateValue, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(.automatic)
                        .labelsHidden()
                        .padding(.trailing, 10)
                        .colorMultiply(.redColor)
                }

            }.frame(height: 43)
        }
    }
    
}

struct DatePickerView_Previews: PreviewProvider {
    @State static var dateValue = Date()
    @State static var dateText: String? = ""
    static var previews: some View {
        DatePickerView(dateValue: $dateValue, dateText: $dateText, placeholderText: "Date", isNecessary: true)
    }
}
