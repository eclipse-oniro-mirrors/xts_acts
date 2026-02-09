'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, Row, ClickEvent, Button,
  AttributeModifier, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextInputModifierUndefined implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(30)
      .lineHeight(undefined)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public isLineHeightDefined: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(30)
    if (this.isLineHeightDefined) {
      instance.lineHeight(40.0)
    } else {
      instance.lineHeight(undefined)
    }
  }
}

@Entry
@Component
struct TextInputLineHeightModifier {
  private textInputModifierUndefined: TextInputModifierUndefined = new TextInputModifierUndefined();
  @State private textInputModifierDynamicSwitch: TextInputModifierDynamicSwitch = new TextInputModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({text: 'TextInput lineHeight undefined'})
        .attributeModifier(this.textInputModifierUndefined)
        .id('TextInput_LineHeight_Modifier_Undefined0')
      TextInput({text: `TextInput lineHeight ${this.textInputModifierDynamicSwitch.isLineHeightDefined ? `40` : `undefined`}`})
        .attributeModifier(this.textInputModifierDynamicSwitch)
        .id('TextInput_LineHeight_Modifier_Dynamic0')

      Text('isLineHeightDefined:' + this.textInputModifierDynamicSwitch.isLineHeightDefined).height(30)
      Button('change isLineHeightDefined').onClick((event: ClickEvent) => {
        this.textInputModifierDynamicSwitch.isLineHeightDefined = 
        !this.textInputModifierDynamicSwitch.isLineHeightDefined;
      })
        .margin(5)
        .id('TextInput_LineHeight_Modifier_Button0')

    }.width('100%')
  }
}