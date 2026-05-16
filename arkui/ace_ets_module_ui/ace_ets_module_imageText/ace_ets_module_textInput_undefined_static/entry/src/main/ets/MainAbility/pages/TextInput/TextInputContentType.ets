'use static'

import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, ContentType
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputContentTypeTest {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextInput({ text: 'placeholder(TextInput)' })
          .width('100%')
          .key('key_textInput_contentType_001')
          .contentType(this.isChange ? ContentType.EMAIL_ADDRESS : undefined)
        Button('点击切换Undefined').id('button_contentType').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}