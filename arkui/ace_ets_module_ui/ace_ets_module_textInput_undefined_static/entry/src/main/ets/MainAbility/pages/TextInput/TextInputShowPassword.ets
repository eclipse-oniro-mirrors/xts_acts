'use static'

import { Entry, Text, Column, Component, TextInput, InputType, ClickEvent, Button } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputShowPassword {
  @State isShowPassword: boolean = true;

  build() {
    Column() {
      TextInput({ placeholder: 'TextInput showPassword undefined' })
        .height(40)
        .margin(20)
        .type(InputType.Password)
        .showPassword(undefined)
        .id('TextInput_ShowPassword_Undefined0')
      TextInput({ placeholder: `TextInput showPassword ${this.isShowPassword ? `true` : `undefined`}`})
        .height(40)
        .margin(20)
        .type(InputType.Password)
        .showPassword(this.isShowPassword ? true : undefined)
        .id('TextInput_ShowPassword_Dynamic0')

      Text('isShowPassword: ' + this.isShowPassword).height(30)
      Button('change isShowPassword').onClick((event: ClickEvent) => {
        this.isShowPassword = !this.isShowPassword;
      })
        .margin(5)
        .id('TextInput_ShowPassword_Button0')

    }.width('100%')
  }
}