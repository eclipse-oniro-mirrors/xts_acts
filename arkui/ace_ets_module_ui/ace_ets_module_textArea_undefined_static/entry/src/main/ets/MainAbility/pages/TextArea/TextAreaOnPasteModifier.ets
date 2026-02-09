'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextAreaAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextAreaModifierUndefined implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance
      .height(30)
      .onPaste(undefined)
  }
}

@Observed
class TextAreaModifierDynamicSwitch implements AttributeModifier<TextAreaAttribute> {
  public isOnPasteValid: boolean = true;
  public value: string = ''

  applyNormalAttribute(instance: TextAreaAttribute): void {
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
struct TextAreaOnPasteModifier {
  private textAreaModifierUndefined: TextAreaModifierUndefined = new TextAreaModifierUndefined();
  @State textAreaModifierDynamicSwitch: TextAreaModifierDynamicSwitch = new TextAreaModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextArea({ text: 'TextArea onPaste undefined'})
        .attributeModifier(this.textAreaModifierUndefined)
        .id('TextArea_OnPaste_Modifier_Undefined0')
      TextArea({ text: 'TextArea supports callback when paste operation' })
        .attributeModifier(this.textAreaModifierDynamicSwitch)
        .id('TextArea_OnPaste_Modifier_Dynamic0')

      Text('pasteValue: ' + this.textAreaModifierDynamicSwitch.value).height(30)
        .id('TextArea_OnPaste_Modifier_Value0')
      Text('isOnPasteValid:' + this.textAreaModifierDynamicSwitch.isOnPasteValid).height(30)
      Button('change isOnPasteValid').onClick((event: ClickEvent) => {
        this.textAreaModifierDynamicSwitch.isOnPasteValid = !this.textAreaModifierDynamicSwitch.isOnPasteValid;
      })
        .margin(5)
        .id('TextArea_OnPaste_Modifier_Button0')
    }.width('100%')
  }
}