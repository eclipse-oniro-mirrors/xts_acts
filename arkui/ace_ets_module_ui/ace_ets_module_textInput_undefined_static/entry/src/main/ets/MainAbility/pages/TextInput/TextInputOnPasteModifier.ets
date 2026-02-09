'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextInputModifierUndefined implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(30)
      .onPaste(undefined)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public isOnPasteValid: boolean = true;
  public value: string = ''

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.height(30)
    if(this.isOnPasteValid){
      instance.onPaste((pasteValue1: string) => {
        this.value += 'onPaste';
      })
    } else {
      instance.onPaste(undefined)
    }
  }
}

@Entry
@Component
struct TextInputOnPasteModifier {
  private textInputModifierUndefined: TextInputModifierUndefined = new TextInputModifierUndefined();
  @State textInputModifierDynamicSwitch: TextInputModifierDynamicSwitch = new TextInputModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({ text: 'TextInput onPaste undefined'})
        .attributeModifier(this.textInputModifierUndefined)
        .id('TextInput_OnPaste_Modifier_Undefined0')
      TextInput({ text: 'TextInput supports callback when paste operation' })
        .attributeModifier(this.textInputModifierDynamicSwitch)
        .id('TextInput_OnPaste_Modifier_Dynamic0')

      Text('pasteValue: ' + this.textInputModifierDynamicSwitch.value).height(30)
        .id('TextInput_OnPaste_Modifier_Value0')
      Text('isOnPasteValid:' + this.textInputModifierDynamicSwitch.isOnPasteValid).height(30)
      Button('change isOnPasteValid').onClick((event: ClickEvent) => {
        this.textInputModifierDynamicSwitch.isOnPasteValid = !this.textInputModifierDynamicSwitch.isOnPasteValid;
      })
        .margin(5)
        .id('TextInput_OnPaste_Modifier_Button0')
    }.width('100%')
  }
}