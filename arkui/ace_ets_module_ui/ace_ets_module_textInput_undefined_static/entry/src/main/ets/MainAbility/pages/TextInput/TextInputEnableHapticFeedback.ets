'use static'


import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, Color, InputType
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputEnableHapticFeedback {
  @State isEnabled: boolean = true;

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_enableHapticFeedback_001')
          .enableHapticFeedback(this.isEnabled ? false: undefined)

        Button('点击切换undefined').id('enableHapticFeedbackButton').onClick((event: ClickEvent) => {
          this.isEnabled = !this.isEnabled;
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}