'use static'


import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, Color
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputTextIndent {
  @State change: boolean = true;

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_textIndent_001')
          .textIndent(this.change ? '50' : undefined)

        Button('点击切换undefined').id('textIndentButton').onClick((event: ClickEvent) => {
          this.change = !this.change;
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}