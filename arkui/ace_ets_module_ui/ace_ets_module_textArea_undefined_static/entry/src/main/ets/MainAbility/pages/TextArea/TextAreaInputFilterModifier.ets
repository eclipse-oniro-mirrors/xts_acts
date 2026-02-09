'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, Text, AttributeModifier, TextAreaAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.inputFilter('[a-z]')
    } else {
    instance.inputFilter(undefined)
    }
  }
}
@Entry
@Component
struct TextAreaInputFilterTest {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        Button('点击切换参数').id('button_inputFilter1').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_inputFilter_002')
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}