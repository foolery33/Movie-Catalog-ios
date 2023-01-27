import SwiftUI

struct SexButton: View {
    
    @Binding var sexText: String
    
    var fillColorMale: Color {
        return sexText == "male" ? Color.redColor : Color.backgroundColor
    }
    var textColorMale: Color {
        return sexText == "male" ? Color.sexTextColor : Color.grayFaded
    }
    
    var fillColorFemale: Color {
        return sexText == "female" ? Color.redColor : Color.backgroundColor
    }
    var textColorFemale: Color {
        return sexText == "female" ? Color.sexTextColor : Color.grayFaded
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8).fill(Color.strokeColor).frame(height: 37)
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Spacer().frame(width: 1)
                    Button(action: {
                        sexText = "Мужчина"
                    }, label: {
                        Text("Мужчина")
                            .frame(maxWidth: .infinity)
                            .padding([.top, .bottom], 9)
                            .foregroundColor(textColorMale)
                            .font(.system(size: 14, weight: .regular))
                            .background(Rectangle().fill(fillColorMale).cornerRadius(8, corners: [.topLeft, .bottomLeft]))
                    }).frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                    Spacer().frame(width: 1)
                    Button(action: {
                        sexText = "Женщина"
                    }, label: {
                        Text("Женщина")
                            .frame(maxWidth: .infinity)
                            .padding([.top, .bottom], 9)
                            .foregroundColor(textColorFemale)
                            .font(.system(size: 14, weight: .regular))
                            .background(Rectangle().fill(fillColorFemale).cornerRadius(8, corners: [.topRight, .bottomRight]))
                        Spacer().frame(width: 1)
                    }).frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    @State static var value = ""
    static var previews: some View {
        SexButton(sexText: $value)
    }
}
