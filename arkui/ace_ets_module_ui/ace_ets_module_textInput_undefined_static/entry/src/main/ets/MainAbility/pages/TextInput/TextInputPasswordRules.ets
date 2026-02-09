'use static'


import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, Color, InputType
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputPasswordRules {
  @State change: boolean = true;

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_passwordRules_001')
          .passwordRules(this.change ? 'begin:[lower],special:[yes],len:[maxlen:32,minlen:12]' : undefined)

        Button('点击切换undefined').id('passwordRulesButton').onClick((event: ClickEvent) => {
          this.change = !this.change;
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}