'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaEnablePreviewTextTest {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_enablePreviewText_001')
          .enablePreviewText(this.isChange ? false : undefined)
        Button('点击切换Undefined').id('button_enablePreviewText').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}