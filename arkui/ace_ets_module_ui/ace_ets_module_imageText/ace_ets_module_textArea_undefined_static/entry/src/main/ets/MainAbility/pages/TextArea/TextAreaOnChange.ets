'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaOnChangeTest {
  @State isChange: boolean = true
  @State text: string = 'false'

  build() {
    Row() {
      Column() {
        Button('点击切换参数').id('button_onChange').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
        Text(this.text).key('test_text_onChange')
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_onChange_001')
          .onChange(this.isChange? undefined: (value: string) => {
            this.text = 'true'
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}