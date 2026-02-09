'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextInputAttribute, TextAlign } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextInputModifierUndefined implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(15)
      .minFontSize(undefined)
      .maxFontSize(40.0)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public isMinFontSizeDefined: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(15)
      .maxFontSize(40.0)
    if (this.isMinFontSizeDefined) {
      instance.minFontSize(20.0)
    } else {
      instance.minFontSize(undefined)
    }
  }
}

@Entry
@Component
struct TextInputMinFontSizeModifier {
  private textInputModifierUndefined: TextInputModifierUndefined = new TextInputModifierUndefined();
  @State private textInputModifierDynamicSwitch: TextInputModifierDynamicSwitch = new TextInputModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({ text: 'TextInput minFontSize undefined && height 15' })
        .attributeModifier(this.textInputModifierUndefined)
        .id('TextInput_MinFontSize_Modifier_Undefined0')
      TextInput({ text: `TextInput minFontSize ${this.textInputModifierDynamicSwitch.isMinFontSizeDefined ? `20` : `undefined`}`})
        .attributeModifier(this.textInputModifierDynamicSwitch)
        .id('TextInput_MinFontSize_Modifier_Dynamic0')

      Text('isMinFontSizeDefined:' + this.textInputModifierDynamicSwitch.isMinFontSizeDefined).height(30)
      Button('change isMinFontSizeDefined').onClick((event: ClickEvent) => {
        this.textInputModifierDynamicSwitch.isMinFontSizeDefined = 
        !this.textInputModifierDynamicSwitch.isMinFontSizeDefined;
      })
        .margin(5)
        .id('TextInput_MinFontSize_Modifier_Button0')
    }.width('100%')
  }
}