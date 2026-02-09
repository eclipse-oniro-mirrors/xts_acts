'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct TextInputMaxLength {
  @State isMaxLengthDefined: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({text: 'TextInput maxLength undefined'})
        .maxLength(undefined)
        .id('TextInput_MaxLength_Undefined0')
      TextInput({text: `TextInput maxLength ${this.isMaxLengthDefined ? `25` : `undefined`}` })
        .maxLength(this.isMaxLengthDefined ? 25 : undefined)
        .id('TextInput_MaxLength_Dynamic0')

      Text('isMaxLengthDefined: ' + this.isMaxLengthDefined).height(30)
      Button('change isMaxLengthDefined').onClick((event: ClickEvent) => {
        this.isMaxLengthDefined = !this.isMaxLengthDefined;
      })
        .margin(5)
        .id('TextInput_MaxLength_Button0')

    }.width('100%')
  }
}