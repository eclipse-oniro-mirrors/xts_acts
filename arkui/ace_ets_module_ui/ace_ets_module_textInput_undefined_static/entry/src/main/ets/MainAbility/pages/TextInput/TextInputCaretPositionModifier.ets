'use static'

import { Entry, Text, Column, Component, TextInput, Button, ClickEvent, AttributeModifier, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextInputModifierUndefined implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
    .caretPosition(undefined)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public isCaretPositionDefined: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isCaretPositionDefined) {
      instance
      .caretPosition(5)
    } else {
      instance
      .caretPosition(undefined)
    }
  }
}

@Entry
@Component
struct TextInputCaretPositionModifier {
  private textInputModifierUndefined: TextInputModifierUndefined = new TextInputModifierUndefined();
  @State private textInputModifierDynamicSwitch: TextInputModifierDynamicSwitch = new TextInputModifierDynamicSwitch();

  build() {
    Column( undefined ) {
      TextInput({ text: 'TextInput caretPosition undefined' })
        .attributeModifier(this.textInputModifierUndefined)
        .id('TextInput_CaretPosition_Modifier_Undefined0')
      TextInput({ text: `TextInput caretPosition ${this.textInputModifierDynamicSwitch.isCaretPositionDefined ? `5` : `undefined`}`})
        .attributeModifier(this.textInputModifierDynamicSwitch)
        .id('TextInput_CaretPosition_Modifier_Dynamic0')

      Text('isCaretPositionDefined: ' + this.textInputModifierDynamicSwitch.isCaretPositionDefined).height(30)
      Button('change isCaretPositionDefined').onClick((event: ClickEvent) => {
        this.textInputModifierDynamicSwitch.isCaretPositionDefined = 
        !this.textInputModifierDynamicSwitch.isCaretPositionDefined;
      })
        .margin(5)
        .id('TextInput_CaretPosition_Modifier_Button0')

    }.width('100%')
  }
}