'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, DeleteValue, Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaOnWillDeleteTest {
  @State isChange: boolean = true
  @State text: string = 'false'

  build() {
    Row() {
      Column() {
        Button('点击切换参数').id('button_onWillDelete').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
        Text(this.text).key('test_text_001')
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_onWillDelete_001')
          .onWillDelete(this.isChange? undefined: (info: DeleteValue) => {
            this.text = 'true'
            return true;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}