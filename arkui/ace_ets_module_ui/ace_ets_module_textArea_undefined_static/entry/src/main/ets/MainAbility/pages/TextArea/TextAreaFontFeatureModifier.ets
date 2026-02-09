'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, AttributeModifier, TextAreaAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextAreaAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isChange) {
      instance.fontFeature('\'ss01\' on')
    } else {
      instance.fontFeature(undefined)
    }
  }
}

@Entry
@Component
struct TextAreaFontFeatureTest {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        TextArea({ text: '12345678' })
          .width('100%')
          .key('key_textArea_fontFeature_002')
          .attributeModifier(this.modifier)
        Button('点击切换Undefined').id('button_fontFeature1').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}