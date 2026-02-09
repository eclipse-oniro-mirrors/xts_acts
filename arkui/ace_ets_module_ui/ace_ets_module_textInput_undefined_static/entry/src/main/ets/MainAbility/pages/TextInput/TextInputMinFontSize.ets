'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputMinFontSize {
  @State isMinFontSizeDefined: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({text: 'TextInput minFontSize undefined && height 15'})
        .height(15)
        .minFontSize(undefined)
        .maxFontSize(40.0)
        .id('TextInput_MinFontSize_Undefined0')
      TextInput({text: `TextInput minFontSize ${this.isMinFontSizeDefined ? `20` : `undefined`}`})
        .height(15)
        .minFontSize(this.isMinFontSizeDefined ? 20.0 : undefined)
        .maxFontSize(40.0)
        .id('TextInput_MinFontSize_Dynamic0')

      Text('isMinFontSizeDefined: ' + this.isMinFontSizeDefined).height(30)
      Button('change isMinFontSizeDefined').onClick((event: ClickEvent) => {
        this.isMinFontSizeDefined = !this.isMinFontSizeDefined;
      })
        .margin(5)
        .id('TextInput_MinFontSize_Button0')

    }.width('100%')
  }
}