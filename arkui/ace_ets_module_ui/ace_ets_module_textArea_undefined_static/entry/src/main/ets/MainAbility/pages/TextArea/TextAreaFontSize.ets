'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaFontSizeTest {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_fontSize_001')
          .fontSize(this.isChange ? 20.0 : undefined)
        Button('点击切换Undefined').id('button_fontSize').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}