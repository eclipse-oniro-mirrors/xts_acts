'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, LengthMetrics
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaLineSpacingTest {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_lineSpacing_001')
          .lineSpacing(this.isChange ? LengthMetrics.vp(5) : undefined)
        Button('点击切换Undefined').id('button_lineSpacing').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}