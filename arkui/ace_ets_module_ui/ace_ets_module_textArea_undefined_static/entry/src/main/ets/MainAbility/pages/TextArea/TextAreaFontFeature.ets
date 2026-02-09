'use static'

import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaFontFeatureTest {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: '12345678' })
          .width('100%')
          .key('key_textArea_fontFeature_001')
          .fontFeature(this.isChange ? '\"ss01\" on' : undefined)
        Button('点击切换Undefined').id('button_fontFeature').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}