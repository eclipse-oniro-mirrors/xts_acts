'use static'

import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, ContentType, AttributeModifier, TextInputAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyTextModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.contentType(ContentType.EMAIL_ADDRESS)
    } else {
      instance.contentType(undefined)
    }
  }
}

@Entry
@Component
struct TextInputContentTypeTest {
  @State isChange: boolean = true
  @State modifier: MyTextModifier = new MyTextModifier()

  build() {
    Row() {
      Column() {
        TextInput({ text: 'placeholder(TextInput)' })
          .width('100%')
          .key('key_textInput_contentType_002')
          .attributeModifier(this.modifier)
        Button('点击切换Undefined').id('button_contentType1').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}