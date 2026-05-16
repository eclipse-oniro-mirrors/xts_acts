'use static'


import { Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontWeight, TextOverflow } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaTextOverflow {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'TextArea case' })
          .width('100%')
          .key('TextAreaTextOverflow')
          .textOverflow(this.isChange ? TextOverflow.Clip : undefined)

        Button('点击切换undefined').id('TextAreaTextOverflowButton').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}