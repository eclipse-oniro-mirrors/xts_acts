'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaLineHeight {
  @State isLineHeightDefined: boolean = true;

  build() {
    Column( { space: 5 } as ColumnOptions ) {
      TextArea({text: 'TextArea lineHeight undefined'})
        .height(30)
        .lineHeight(undefined)
        .id('TextArea_LineHeight_Undefined0')
      TextArea({text: `TextArea lineHeight ${this.isLineHeightDefined ? `40` : `undefined`}`})
        .height(30)
        .lineHeight(this.isLineHeightDefined ? 40.0 : undefined)
        .id('TextArea_LineHeight_Dynamic0')

      Text('isLineHeightDefined: ' + this.isLineHeightDefined).height(30)
      Button('change isLineHeightDefined').onClick((event: ClickEvent) => {
        this.isLineHeightDefined = !this.isLineHeightDefined;
      })
        .margin(5)
        .id('TextArea_LineHeight_Button0')

    }.width('100%')
  }
}