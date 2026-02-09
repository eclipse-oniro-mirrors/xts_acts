'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct TextAreaMaxLength {
  @State isMaxLengthDefined: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextArea({text: 'TextArea maxLength undefined'})
        .maxLength(undefined)
        .id('TextArea_MaxLength_Undefined0')
      TextArea({text: `TextArea maxLength ${this.isMaxLengthDefined ? `25` : `undefined`}` })
        .maxLength(this.isMaxLengthDefined ? 25 : undefined)
        .id('TextArea_MaxLength_Dynamic0')

      Text('isMaxLengthDefined: ' + this.isMaxLengthDefined).height(30)
      Button('change isMaxLengthDefined').onClick((event: ClickEvent) => {
        this.isMaxLengthDefined = !this.isMaxLengthDefined;
      })
        .margin(5)
        .id('TextArea_MaxLength_Button0')

    }.width('100%')
  }
}