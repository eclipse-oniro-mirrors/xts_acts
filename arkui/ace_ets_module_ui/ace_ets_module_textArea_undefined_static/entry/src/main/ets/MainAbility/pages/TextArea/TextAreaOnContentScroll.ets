'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaOnContentScrollTest {
  @State isChange: boolean = true
  @State text: string = 'false'

  build() {
    Row() {
      Column() {
        Button('点击切换参数').id('button_onContentScroll').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
          if (this.text == 'true') {
            this.text = 'false';
          }
        })
        Text(this.text).key('test_text_onContentScroll')
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .height(50)
          .key('key_textArea_onContentScroll_001')
          .onContentScroll(this.isChange? (totalOffsetX: number, totalOffsetY: number) => {
            this.text = 'true';
          }: undefined)
      }
      .width('100%')
    }
    .height('100%')
  }
}