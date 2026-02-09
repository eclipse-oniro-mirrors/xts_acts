'use static'

import { Entry, Text, Column, Component, TextInput, InputType, ClickEvent, Button } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputShowPasswordIcon {
  @State isShowPasswordIcon: boolean = true;

  build() {
    Column() {
      TextInput({ placeholder: 'TextInput showPasswordIcon undefined' })
        .height(40)
        .margin(20)
        .type(InputType.Password)
        .showPasswordIcon(undefined)
        .id('TextInput_ShowPasswordIcon_Undefined0')
      TextInput({ placeholder: `TextInput showPasswordIcon ${this.isShowPasswordIcon ? `false` : `undefined`}`})
        .height(40)
        .margin(20)
        .type(InputType.Password)
        .showPasswordIcon(this.isShowPasswordIcon ? false : undefined)
        .id('TextInput_ShowPasswordIcon_Dynamic0')

      Text('isShowPasswordIcon: ' + this.isShowPasswordIcon).height(30)
      Button('isShowPasswordIcon' + this.isShowPasswordIcon).onClick((event: ClickEvent) => {
        this.isShowPasswordIcon = !this.isShowPasswordIcon;
      })
        .margin(5)
        .id('TextInput_ShowPasswordIcon_Button0')

    }.width('100%')
  }
}