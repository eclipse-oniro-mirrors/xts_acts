'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextInputModifierUndefined implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(30)
      .onCopy(undefined)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public isOnCopyValid: boolean = true;
  public value: string = ''

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.height(30)
    if(this.isOnCopyValid){
      instance.onCopy((copyValue1: string) => {
        this.value += 'onCopy';
      })
    } else {
      instance.onCopy(undefined)
    }
  }
}

@Entry
@Component
struct TextInputOnCopyModifier {
  private searchModifierUndefined: TextInputModifierUndefined = new TextInputModifierUndefined();
  @State searchModifierDynamicSwitch: TextInputModifierDynamicSwitch = new TextInputModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({ text: 'TextInput onCopy undefined long long long long text'})
        .attributeModifier(this.searchModifierUndefined)
        .id('TextInput_OnCopy_Modifier_Undefined0')
      TextInput({ text: `TextInput onCopy ${this.searchModifierDynamicSwitch.isOnCopyValid ? `defined` : `undefined`} long long long long text`})
        .attributeModifier(this.searchModifierDynamicSwitch)
        .id('TextInput_OnCopy_Modifier_Dynamic0')

      Text('copyValue: ' + this.searchModifierDynamicSwitch.value).height(30)
        .id('TextInput_OnCopy_Modifier_Value0')
      Text('isOnCopyValid:' + this.searchModifierDynamicSwitch.isOnCopyValid).height(30)
      Button('change isOnCopyValid').onClick((event: ClickEvent) => {
        this.searchModifierDynamicSwitch.isOnCopyValid = !this.searchModifierDynamicSwitch.isOnCopyValid;
      })
        .margin(5)
        .id('TextInput_OnCopy_Modifier_Button0')

    }.width('100%')
  }
}