import SwiftUI

struct DatePickerView: View {
    
    @Binding var dateValue: Date
    @Binding var dateText: String
    var placeholderText: String
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8).stroke(Color.strokeColor, lineWidth: 1).frame(maxHeight: 43).padding([.leading, .trailing], 0.3)
            HStack {
                if(dateText.isEmpty) {
                    Text(placeholderText)
                        .padding(.leading, 16)
                        .padding([.top, .bottom], 13)
                        .foregroundColor(.grayFaded)
                        .font(.system(size: 14, weight: .regular))
                }
                else {
                    Text(dateText)
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

            }
        }
        
    }
    
}

//struct DatePickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        DatePickerView()
//    }
//}
