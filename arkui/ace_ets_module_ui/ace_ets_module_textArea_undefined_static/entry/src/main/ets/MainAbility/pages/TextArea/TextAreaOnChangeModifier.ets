'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, Text, AttributeModifier, TextAreaAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = true;
  public text: string = 'false';

  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.onChange(undefined)
    } else {
      instance.onChange((value: string) => {
        this.text = 'true';
      })
    }
  }
}
@Entry
@Component
struct TextAreaOnChangeTest {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        Button('点击切换参数').id('button_onChange1').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
        Text(this.modifier.text).key('test_text_onChange1')
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_onChange_002')
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}