'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextAreaAttribute, TextAlign } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextAreaModifierUndefined implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance
      .height(15)
      .minFontSize(undefined)
      .maxFontSize(40.0)
  }
}

@Observed
class TextAreaModifierDynamicSwitch implements AttributeModifier<TextAreaAttribute> {
  public isMinFontSizeDefined: boolean = true;

  applyNormalAttribute(instance: TextAreaAttribute): void {
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
struct TextAreaMinFontSizeModifier {
  private textAreaModifierUndefined: TextAreaModifierUndefined = new TextAreaModifierUndefined();
  @State private textAreaModifierDynamicSwitch: TextAreaModifierDynamicSwitch = new TextAreaModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextArea({ text: 'TextArea minFontSize undefined && height 15' })
        .attributeModifier(this.textAreaModifierUndefined)
        .id('TextArea_MinFontSize_Modifier_Undefined0')
      TextArea({ text: `TextArea minFontSize ${this.textAreaModifierDynamicSwitch.isMinFontSizeDefined ? `20` : `undefined`}`})
        .attributeModifier(this.textAreaModifierDynamicSwitch)
        .id('TextArea_MinFontSize_Modifier_Dynamic0')

      Text('isMinFontSizeDefined:' + this.textAreaModifierDynamicSwitch.isMinFontSizeDefined).height(30)
      Button('change isMinFontSizeDefined').onClick((event: ClickEvent) => {
        this.textAreaModifierDynamicSwitch.isMinFontSizeDefined = 
        !this.textAreaModifierDynamicSwitch.isMinFontSizeDefined;
      })
        .margin(5)
        .id('TextArea_MinFontSize_Modifier_Button0')
    }.width('100%')
  }
}