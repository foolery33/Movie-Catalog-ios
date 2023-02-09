import SwiftUI

struct SexButton: View {
    
    @Binding var sexText: Int?
    
    var fillColorMale: Color {
        return sexText == 0 ? Color.redColor : Color.backgroundColor
    }
    var textColorMale: Color {
        return sexText == 0 ? Color.sexTextColor : Color.grayFaded
    }
    
    var fillColorFemale: Color {
        return sexText == 1 ? Color.redColor : Color.backgroundColor
    }
    var textColorFemale: Color {
        return sexText == 1 ? Color.sexTextColor : Color.grayFaded
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8).fill(Color.strokeColor).frame(height: 37)
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Spacer().frame(width: 1)
                    Button(action: {
                        sexText = (sexText == 0 ? 2 : 0)
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
                        sexText = (sexText == 1 ? 2 : 1)
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
    @State static var value: Int? = nil
    static var previews: some View {
        SexButton(sexText: $value)
    }
}
