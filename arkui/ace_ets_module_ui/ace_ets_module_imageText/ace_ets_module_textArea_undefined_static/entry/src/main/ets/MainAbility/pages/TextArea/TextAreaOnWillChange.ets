'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, EditableTextChangeValue, Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaOnWillChangeTest {
  @State isChange: boolean = true
  @State text: string = 'false'

  build() {
    Row() {
      Column() {
        Button('点击切换参数').id('button_onWillChange').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
        Text(this.text).key('test_text_002')
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_onWillChange_001')
          .onWillChange(this.isChange? undefined: (info: EditableTextChangeValue) => {
            this.text = 'true'
            return true;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}