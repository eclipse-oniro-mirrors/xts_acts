'use static'


import { Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontWeight, AttributeModifier, TextAreaAttribute, TextOverflow, TextAreaType } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = true;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.type(TextAreaType.NUMBER)
    } else {
      instance.type(undefined)
    }
  }
}

@Entry
@Component
struct TextAreaTypeModifier {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        TextArea({ text: 'TextArea case' })
          .width('100%')
          .key('TextAreaTypeModifier')
          .attributeModifier(this.modifier)

        Button('点击切换undefined').id('TextAreaTypeModifierButton').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}