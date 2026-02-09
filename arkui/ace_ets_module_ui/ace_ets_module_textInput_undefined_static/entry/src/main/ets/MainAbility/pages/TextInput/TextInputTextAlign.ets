'use static'


import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, Color, TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputTextAlign {
  @State textAlignChange: boolean = true;

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_textAlign_001')
          .textAlign(this.textAlignChange ? TextAlign.Center : undefined)

        Button('点击切换undefined').id('textAlignButton').onClick((event: ClickEvent) => {
          this.textAlignChange = !this.textAlignChange;
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}