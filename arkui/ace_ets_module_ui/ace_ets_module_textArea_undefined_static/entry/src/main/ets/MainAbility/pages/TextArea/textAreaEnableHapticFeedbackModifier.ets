'use static'


import { Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontWeight, AttributeModifier, TextAreaAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = true;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.enableHapticFeedback(false)
    } else {
      instance.enableHapticFeedback(undefined)
    }
  }
}

@Entry
@Component
struct TextAreaEnableHapticFeedbackModifier {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        TextArea({ text: 'TextArea case' })
          .width('100%')
          .key('TextAreaEnableHapticFeedbackModifier')
          .attributeModifier(this.modifier)

        Button('点击切换undefined').id('TextAreaEnableHapticFeedbackModifierButton').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}