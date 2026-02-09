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
      instance.onContentScroll((totalOffsetX: number, totalOffsetY: number) => {
        this.text = 'true';
      })
    } else {
      instance.onContentScroll(undefined)
    }
  }
}
@Entry
@Component
struct TextAreaOnContentScrollTest {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        Button('点击切换参数').id('button_onContentScroll1').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
          if (this.modifier.text == 'true') {
            this.modifier.text = 'false';
          }
        })
        Text(this.modifier.text).key('test_text_onContentScroll1')
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .height(50)
          .key('key_textArea_onContentScroll_002')
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}