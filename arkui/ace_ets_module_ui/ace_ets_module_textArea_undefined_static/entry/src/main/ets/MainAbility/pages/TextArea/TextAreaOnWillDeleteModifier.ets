'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, DeleteValue, Text, AttributeModifier, TextAreaAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = true;
  public text: string = 'false';

  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.onWillDelete(undefined)
    } else {
      instance.onWillDelete((info: DeleteValue) => {
        this.text = 'true';
        return true;
      })
    }
  }
}
@Entry
@Component
struct TextAreaOnWillDeleteTest {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        Button('点击切换参数').id('button_onWillDelete1').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
        Text(this.modifier.text).key('test_text_onWillDelete1')
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_onWillDelete_002')
          .attributeModifier(this.modifier)
          }
      .width('100%')
    }
    .height('100%')
  }
}