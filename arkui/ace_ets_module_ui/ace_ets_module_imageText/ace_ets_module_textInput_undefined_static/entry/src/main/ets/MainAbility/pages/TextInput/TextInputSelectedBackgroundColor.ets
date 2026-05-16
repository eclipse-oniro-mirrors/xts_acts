'use static'


import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, Color, $r
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputSelectedBackgroundColor {
  @State fontColorChange: boolean = true;

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_SelectedBackgroundColor_001')
          .selectedBackgroundColor((this.fontColorChange ? '#FFFFFF00' : undefined))

        Button('点击切换undefined').id('colorButton').onClick((event: ClickEvent) => {
          this.fontColorChange = !this.fontColorChange;
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}