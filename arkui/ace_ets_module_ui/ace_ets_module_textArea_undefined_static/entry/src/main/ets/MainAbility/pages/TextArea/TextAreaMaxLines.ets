'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, Button, ClickEvent, TextContentStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct TextAreaMaxLines {
  @State isMaxLinesDefined: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextArea({ text: 'TextArea maxLines undefined' })
        .style(TextContentStyle.INLINE)
        .maxLines(undefined)
        .id('TextArea_MaxLines_Undefined0')
      TextArea({ text: `TextArea maxLines ${this.isMaxLinesDefined ? `5` : `undefined`}` })
        .style(TextContentStyle.INLINE)
        .maxLines(this.isMaxLinesDefined ? 5 : undefined)
        .id('TextArea_MaxLines_Dynamic0')

      Text('isMaxLinesDefined: ' + this.isMaxLinesDefined).height(30)
      Button('change isMaxLinesDefined').onClick((event: ClickEvent) => {
        this.isMaxLinesDefined = !this.isMaxLinesDefined;
      })
        .margin(5)
        .id('TextArea_MaxLines_Button0')
    }.width('100%')
  }
}