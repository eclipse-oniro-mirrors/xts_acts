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
      .showPasswordIcon(undefined)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public isShowPasswordIcon: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(40)
      .margin(20)
      .type(InputType.Password)
    if (this.isShowPasswordIcon) {
      instance.showPasswordIcon(false)
    } else {
      instance.showPasswordIcon(undefined)
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
        .id('TextInput_ShowPasswordIcon_Modifier_Undefined0')
      TextInput({ placeholder: `TextInput showPasswordIcon ${this.textInputModifierDynamicSwitch.isShowPasswordIcon ? `false` : `undefined`}`})
        .attributeModifier(this.textInputModifierDynamicSwitch)
        .id('TextInput_ShowPasswordIcon_Modifier_Dynamic0')

      Text('isShowPasswordIcon: ' + this.textInputModifierDynamicSwitch.isShowPasswordIcon).height(30)
      Button('change isShowPasswordIcon').onClick((event: ClickEvent) => {
        this.textInputModifierDynamicSwitch.isShowPasswordIcon = 
        !this.textInputModifierDynamicSwitch.isShowPasswordIcon;
      })
        .margin(5)
        .id('TextInput_ShowPasswordIcon_Modifier_Button0')
    }.width('100%')
  }
}