'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaFontStyleTest {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_fontStyle_001')
          .fontStyle(this.isChange ? FontStyle.Italic : undefined)
        Button('点击切换Undefined').id('button_fontStyle').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}