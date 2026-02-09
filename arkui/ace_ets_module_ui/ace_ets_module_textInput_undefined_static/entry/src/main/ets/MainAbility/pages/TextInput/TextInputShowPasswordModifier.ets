'use static'

import { Entry, Text, Column, Component, TextInput, InputType, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextInputModifierUndefined implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(40)
      .margin(20)
      .type(InputType.Password)
      .showPassword(undefined)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public isShowPassword: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(40)
      .margin(20)
      .type(InputType.Password)
    if (this.isShowPassword) {
      instance.showPassword(true)
    } else {
      instance.showPassword(undefined)
    }
  }
}

@Entry
@Component
struct TextInputExample {
  private textInputModifierUndefined: TextInputModifierUndefined = new TextInputModifierUndefined();
  @State private textInputModifierDynamicSwitch: TextInputModifierDynamicSwitch = new TextInputModifierDynamicSwitch();

  build() {
    Column() {
      TextInput({ placeholder: 'showPassword and showPasswordIcon undefined' })
        .attributeModifier(this.textInputModifierUndefined)
        .id('TextInput_ShowPassword_Modifier_Undefined0')
      TextInput({ placeholder: `TextInput showPassword ${this.textInputModifierDynamicSwitch.isShowPassword ? `true` : `undefined`}`})
        .attributeModifier(this.textInputModifierDynamicSwitch)
        .id('TextInput_ShowPassword_Modifier_Dynamic0')

      Text('isShowPassword: ' + this.textInputModifierDynamicSwitch.isShowPassword).height(30)
      Button('change isShowPassword').onClick((event: ClickEvent) => {
        this.textInputModifierDynamicSwitch.isShowPassword = !this.textInputModifierDynamicSwitch.isShowPassword;
      })
        .margin(5)
        .id('TextInput_ShowPassword_Modifier_Button0')
    }.width('100%')
  }
}