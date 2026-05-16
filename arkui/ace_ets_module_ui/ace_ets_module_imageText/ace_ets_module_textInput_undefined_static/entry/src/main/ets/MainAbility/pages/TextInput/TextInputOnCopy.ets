'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, ClickEvent, Button} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputOnCopy {
  @State copyValue: string = '';
  @State isOnCopyValid: boolean = true;

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({ text: 'TextInput onCopy undefined long long long long text' })
        .onCopy(undefined)
        .id('TextInput_OnCopy_Undefined0')
      TextInput({ text: `TextInput onCopy ${this.isOnCopyValid ? `defined` : `undefined`} long long long long text`})
        .onCopy(this.isOnCopyValid ? (copyValue: string) => {
          this.copyValue = this.copyValue + 'onCopy';
        } : undefined)
        .id('TextInput_OnCopy_Dynamic0')

      Text('copyValue: ' + this.copyValue).height(30)
        .id('TextInput_OnCopy_Value0')
      Text('isOnCopyValid: ' + this.isOnCopyValid).height(30)
      Button('change isOnCopyValid').onClick((event: ClickEvent) => {
        this.isOnCopyValid = !this.isOnCopyValid;
      })
        .margin(5)
        .id('TextInput_OnCopy_Button0')
    }.width('100%')
  }
}