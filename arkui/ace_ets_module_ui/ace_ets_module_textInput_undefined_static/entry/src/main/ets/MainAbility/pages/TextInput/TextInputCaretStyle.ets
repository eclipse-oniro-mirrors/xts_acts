'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, Button, ClickEvent, Color, CaretStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputCaretStyle {
  @State caretStyleIndex: Int = 0;
  @State curCaretStyle:(CaretStyle | undefined)[] = [
    { width : '4vp', color : Color.Red } as CaretStyle,
    { width : undefined, color : Color.Red } as CaretStyle,
    { width : '4vp', color : undefined } as CaretStyle,
    { width : undefined, color : undefined } as CaretStyle,
    { width : '4vp', color : Color.Red } as CaretStyle,
    undefined
  ]

  build() {
    Column( { space: 5 } as ColumnOptions ) {
      TextInput({text: 'TextInput caretStyle undefined'})
        .height(30)
        .caretStyle(undefined)
        .id('TextInput_CaretStyle_Undefined0')
      TextInput({text: `TextInput caretStyle ${this.caretStyleIndex} `})
        .height(30)
        .caretStyle(this.curCaretStyle[this.caretStyleIndex])
        .id('TextInput_CaretStyle_Dynamic0')

      Text('caretStyleIndex: ' + this.caretStyleIndex).height(30)
      Button('change caretStyleIndex').onClick((event: ClickEvent) => {
        this.caretStyleIndex = (this.caretStyleIndex + 1) % 6;
      })
        .margin(5)
        .id('TextInput_CaretStyle_Button0')

    }.width('100%')
  }
}