'use static'


import { Entry, Component, Column, TextArea, Row, Button, ClickEvent, FontWeight } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaEnableKeyboardOnFocus {
  @State isChange: boolean = true

  build() {
    Row() {
      Column() {
        TextArea({ text: 'TextArea case' })
          .width('100%')
          .key('TextAreaEnableKeyboardOnFocus')
          .enableKeyboardOnFocus(this.isChange ? false : undefined)

        Button('点击切换undefined').id('TextAreaEnableKeyboardOnFocusButton').onClick((event: ClickEvent) => {
          this.isChange = !this.isChange
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}