'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, ClickEvent, Button} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputOnPaste {
  @State pasteValue: string = '';
  @State isOnPasteValid: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({ text: 'TextInput onPaste undefined long long long long text' })
        .onPaste(undefined)
        .id('TextInput_OnPaste_Undefined0')
      TextInput({ text: `TextInput onPaste ${this.isOnPasteValid ? `defined` : `undefined`} long long long long text`})
        .onPaste(this.isOnPasteValid ? (pasteValue: string) => {
          this.pasteValue = this.pasteValue + 'onPaste';
        } : undefined)
        .id('TextInput_OnPaste_Dynamic0')

      Text('pasteValue: ' + this.pasteValue).height(30)
        .id('TextInput_OnPaste_Value0')
      Text('isOnPasteValid: ' + this.isOnPasteValid).height(30)
      Button('change isOnPasteValid').onClick((event: ClickEvent) => {
        this.isOnPasteValid = !this.isOnPasteValid;
      })
        .margin(5)
        .id('TextInput_OnPaste_Button0')
    }.width('100%')
  }
}