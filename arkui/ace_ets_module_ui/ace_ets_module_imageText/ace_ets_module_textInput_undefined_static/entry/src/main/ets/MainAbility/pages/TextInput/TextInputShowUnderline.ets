'use static'


import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, Color, InputType
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputShowUnderline {
  @State change: boolean = true;

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_showUnderline_001')
          .showUnderline(this.change ? true : undefined)

        Button('点击切换undefined').id('showUnderlineButton').onClick((event: ClickEvent) => {
          this.change = !this.change;
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}