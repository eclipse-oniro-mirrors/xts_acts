'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, ContentType
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaHalfLeadingTest {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'placeholder(TextArea)' })
          .width('100%')
          .key('key_textArea_halfLeading_001')
          .halfLeading(this.isChange ? true : undefined)
        Button('点击切换Undefined').id('button_halfLeading').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}