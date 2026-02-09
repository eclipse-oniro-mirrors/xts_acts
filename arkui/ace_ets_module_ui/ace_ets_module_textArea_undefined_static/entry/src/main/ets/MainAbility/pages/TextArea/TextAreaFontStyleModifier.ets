'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontStyle, AttributeModifier, TextAreaAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.fontStyle(FontStyle.Italic)
    } else {
      instance.fontStyle(undefined)
    }
  }
}

@Entry
@Component
struct TextAreaFontStyleTest {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_fontStyle_002')
          .attributeModifier(this.modifier)
        Button('点击切换Undefined').id('button_fontStyle1').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}