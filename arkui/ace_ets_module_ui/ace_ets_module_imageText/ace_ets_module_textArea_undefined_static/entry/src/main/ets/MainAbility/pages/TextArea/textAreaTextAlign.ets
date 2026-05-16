'use static'


import { Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontWeight } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { TextAlign } from '@kit.ArkUI';

@Entry
@Component
struct TextAreaTextAlign {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'TextArea case' })
          .width('100%')
          .key('TextAreaTextAlign')
          .textAlign(this.isChange ? TextAlign.Center : undefined)

        Button('点击切换undefined').id('TextAreaTextAlignButton').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}