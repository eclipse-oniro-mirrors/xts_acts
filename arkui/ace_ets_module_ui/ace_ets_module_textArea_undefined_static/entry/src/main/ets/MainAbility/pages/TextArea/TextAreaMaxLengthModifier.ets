'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextAreaAttribute, BorderOptions } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextAreaModifierUndefined implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance
      .border({ width: 1 } as BorderOptions).padding(10).height(30)
      .maxLength(undefined)
  }
}

@Observed
class TextAreaModifierDynamicSwitch implements AttributeModifier<TextAreaAttribute> {
  public isMaxLengthDefined: boolean = true;

  applyNormalAttribute(instance: TextAreaAttribute): void {
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
struct TextAreaMaxLengthModifier {
  private textAreaModifierUndefined: TextAreaModifierUndefined = new TextAreaModifierUndefined();
  @State private textAreaModifierDynamicSwitch: TextAreaModifierDynamicSwitch = new TextAreaModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextArea({text: 'TextArea maxLength undefined'})
        .attributeModifier(this.textAreaModifierUndefined)
        .id('TextArea_MaxLength_Modifier_Undefined0')
      TextArea({text: `TextArea maxLength ${this.textAreaModifierDynamicSwitch.isMaxLengthDefined ? `25` : `undefined`}` })
        .attributeModifier(this.textAreaModifierDynamicSwitch)
        .id('TextArea_MaxLength_Modifier_Dynamic0')

      Text('isMaxLengthDefined:' + this.textAreaModifierDynamicSwitch.isMaxLengthDefined).height(30)
      Button('change isMaxLengthDefined').onClick((event: ClickEvent) => {
        this.textAreaModifierDynamicSwitch.isMaxLengthDefined = !this.textAreaModifierDynamicSwitch.isMaxLengthDefined;
      })
        .margin(5)
        .id('TextArea_MaxLength_Modifier_Button0')

    }.width('100%')
  }
}