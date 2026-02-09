'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaFontWeightTest {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_fontWeight_001')
          .fontWeight(this.isChange ? 500 : undefined)
        Button('点击切换Undefined').id('button_fontWeight').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}