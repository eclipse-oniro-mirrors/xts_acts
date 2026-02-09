'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextAreaAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextAreaModifierUndefined implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance
      .height(30)
      .onCopy(undefined)
  }
}

@Observed
class TextAreaModifierDynamicSwitch implements AttributeModifier<TextAreaAttribute> {
  public isOnCopyValid: boolean = true;
  public value: string = ''

  applyNormalAttribute(instance: TextAreaAttribute): void {
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
struct TextAreaOnCopyModifier {
  private searchModifierUndefined: TextAreaModifierUndefined = new TextAreaModifierUndefined();
  @State searchModifierDynamicSwitch: TextAreaModifierDynamicSwitch = new TextAreaModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextArea({ text: 'TextArea onCopy undefined long long long long text'})
        .attributeModifier(this.searchModifierUndefined)
        .id('TextArea_OnCopy_Modifier_Undefined0')
      TextArea({ text: `TextArea onCopy ${this.searchModifierDynamicSwitch.isOnCopyValid ? `defined` : `undefined`} long long long long text`})
        .attributeModifier(this.searchModifierDynamicSwitch)
        .id('TextArea_OnCopy_Modifier_Dynamic0')

      Text('copyValue: ' + this.searchModifierDynamicSwitch.value).height(30)
        .id('TextArea_OnCopy_Modifier_Value0')
      Text('isOnCopyValid:' + this.searchModifierDynamicSwitch.isOnCopyValid).height(30)
      Button('change isOnCopyValid').onClick((event: ClickEvent) => {
        this.searchModifierDynamicSwitch.isOnCopyValid = !this.searchModifierDynamicSwitch.isOnCopyValid;
      })
        .margin(5)
        .id('TextArea_OnCopy_Modifier_Button0')

    }.width('100%')
  }
}