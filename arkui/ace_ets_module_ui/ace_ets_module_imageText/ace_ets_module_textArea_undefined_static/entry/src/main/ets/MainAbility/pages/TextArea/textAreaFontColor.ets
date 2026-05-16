'use static'


import { Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontWeight, Color } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaFontColor {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'TextArea case' })
          .width('100%')
          .key('TextAreaFontColor')
          .fontColor(this.isChange ? Color.Red : undefined)

        Button('点击切换undefined').id('TextAreaFontColorButton').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}