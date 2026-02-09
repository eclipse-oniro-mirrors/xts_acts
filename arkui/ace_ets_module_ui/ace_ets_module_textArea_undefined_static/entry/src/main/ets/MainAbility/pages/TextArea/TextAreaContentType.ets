'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, ContentType
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaContentTypeTest {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_contentType_001')
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