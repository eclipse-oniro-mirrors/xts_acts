'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, ClickEvent, Button} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaOnPaste {
  @State pasteValue: string = '';
  @State isOnPasteValid: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextArea({ text: 'TextArea onPaste undefined long long long long text' })
        .onPaste(undefined)
        .id('TextArea_OnPaste_Undefined0')
      TextArea({ text: `TextArea onPaste ${this.isOnPasteValid ? `defined` : `undefined`} long long long long text`})
        .onPaste(this.isOnPasteValid ? (pasteValue: string) => {
          this.pasteValue = this.pasteValue + 'onPaste';
        } : undefined)
        .id('TextArea_OnPaste_Dynamic0')

      Text('pasteValue: ' + this.pasteValue).height(30)
        .id('TextArea_OnPaste_Value0')
      Text('isOnPasteValid: ' + this.isOnPasteValid).height(30)
      Button('change isOnPasteValid').onClick((event: ClickEvent) => {
        this.isOnPasteValid = !this.isOnPasteValid;
      })
        .margin(5)
        .id('TextArea_OnPaste_Button0')
    }.width('100%')
  }
}