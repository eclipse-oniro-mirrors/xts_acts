'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, Button, ClickEvent, Color, CaretStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaCaretStyle {
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
      TextArea({text: 'TextArea caretStyle undefined'})
        .height(30)
        .caretStyle(undefined)
        .id('TextArea_CaretStyle_Undefined0')
      TextArea({text: `TextArea caretStyle ${this.caretStyleIndex} `})
        .height(30)
        .caretStyle(this.curCaretStyle[this.caretStyleIndex])
        .id('TextArea_CaretStyle_Dynamic0')

      Text('caretStyleIndex: ' + this.caretStyleIndex).height(30)
      Button('change caretStyleIndex').onClick((event: ClickEvent) => {
        this.caretStyleIndex = (this.caretStyleIndex + 1) % 6;
      })
        .margin(5)
        .id('TextArea_CaretStyle_Button0')

    }.width('100%')
  }
}