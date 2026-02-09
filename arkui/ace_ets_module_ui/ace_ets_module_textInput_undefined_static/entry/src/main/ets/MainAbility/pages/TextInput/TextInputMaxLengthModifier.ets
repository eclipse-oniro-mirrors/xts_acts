'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextInputAttribute, BorderOptions } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextInputModifierUndefined implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .border({ width: 1 } as BorderOptions).padding(10).height(30)
      .maxLength(undefined)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public isMaxLengthDefined: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .border({ width: 1 } as BorderOptions).padding(10).height(30)
    if (this.isMaxLengthDefined) {
      instance.maxLength(25)
    } else {
      instance.maxLength(undefined)
    }
  }
}

@Entry
@Component
struct TextInputMaxLengthModifier {
  private textInputModifierUndefined: TextInputModifierUndefined = new TextInputModifierUndefined();
  @State private textInputModifierDynamicSwitch: TextInputModifierDynamicSwitch = new TextInputModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({text: 'TextInput maxLength undefined'})
        .attributeModifier(this.textInputModifierUndefined)
        .id('TextInput_MaxLength_Modifier_Undefined0')
      TextInput({text: `TextInput maxLength ${this.textInputModifierDynamicSwitch.isMaxLengthDefined ? `25` : `undefined`}` })
        .attributeModifier(this.textInputModifierDynamicSwitch)
        .id('TextInput_MaxLength_Modifier_Dynamic0')

      Text('isMaxLengthDefined:' + this.textInputModifierDynamicSwitch.isMaxLengthDefined).height(30)
      Button('change isMaxLengthDefined').onClick((event: ClickEvent) => {
        this.textInputModifierDynamicSwitch.isMaxLengthDefined = 
        !this.textInputModifierDynamicSwitch.isMaxLengthDefined;
      })
        .margin(5)
        .id('TextInput_MaxLength_Modifier_Button0')

    }.width('100%')
  }
}