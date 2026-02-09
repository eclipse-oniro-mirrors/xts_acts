'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaInputFilterTest {
  @State isChange: boolean = true
  @State text: string = 'false'

  build() {
    Row() {
      Column() {
        Button('点击切换参数').id('button_inputFilter').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_inputFilter_001')
          .inputFilter(this.isChange? undefined: '[a-zA-Z]+')
      }
      .width('100%')
    }
    .height('100%')
  }
}