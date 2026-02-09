'use static'

import { Entry, Text, Column, Component, TextInput, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputCaretPosition {
  @State isCaretPositionDefined: boolean = true;

  build() {
    Column() {
      TextInput({ text: 'TextInput caretPosition undefined' })
        .caretPosition(undefined)
        .id('TextInput_CaretPosition_Undefined0')
      TextInput({ text: `TextInput caretPosition ${this.isCaretPositionDefined ? `5` : `undefined`}`})
        .caretPosition(this.isCaretPositionDefined ? 5 : undefined)
        .id('TextInput_CaretPosition_Dynamic0')

      Text('isCaretPositionDefined: ' + this.isCaretPositionDefined).height(30)
      Button('change isCaretPositionDefined').onClick((event: ClickEvent) => {
        this.isCaretPositionDefined = !this.isCaretPositionDefined;
      })
        .margin(5)
        .id('TextInput_CaretPosition_Button0')
    }.width('100%')
  }
}