'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, EditableTextChangeValue,
  Text, AttributeModifier, TextAreaAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = true;
  public text: string = 'false';

  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.onWillChange(undefined)
    } else {
      instance.onWillChange((info: EditableTextChangeValue) => {
        this.text = 'true';
        return true;
      })
    }
  }
}
@Entry
@Component
struct TextAreaOnWillChangeTest {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        Button('点击切换参数').id('button_onWillChange1').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
        Text(this.modifier.text).key('test_text_onWillChange1')
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_onWillChange_002')
          .attributeModifier(this.modifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}