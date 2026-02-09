'use static'

import { Entry, Text, Column, Component, TextInput, Search, ColumnOptions, ClickEvent, Button, TextContentStyle,
  AttributeModifier, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextInputModifierUndefined implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .style(TextContentStyle.INLINE)
      .maxLines(undefined)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public isMaxLinesDefined: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .style(TextContentStyle.INLINE)
    if (this.isMaxLinesDefined) {
      instance.maxLines(5)
    } else {
      instance.maxLines(undefined)
    }
  }
}

@Entry
@Component
struct TextInputMaxLinesModifier {
  longText: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';

  private textInputModifierUndefined: TextInputModifierUndefined = new TextInputModifierUndefined();
  @State private textInputModifierDynamicSwitch: TextInputModifierDynamicSwitch = new TextInputModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({ text: `maxLines undefined ${this.longText}` })
        .attributeModifier(this.textInputModifierUndefined)
        .id('TextInput_MaxLines_Modifier_Undefined0')
      TextInput({ text: `maxLines ${this.textInputModifierDynamicSwitch.isMaxLinesDefined ? `5` : `undefined`} ${this.longText}` })
        .attributeModifier(this.textInputModifierDynamicSwitch)
        .id('TextInput_MaxLines_Modifier_Dynamic0')

      Text('isMaxLinesDefined:' + this.textInputModifierDynamicSwitch.isMaxLinesDefined).height(30)
      Button('change isMaxLinesDefined').onClick((event: ClickEvent) => {
        this.textInputModifierDynamicSwitch.isMaxLinesDefined = !this.textInputModifierDynamicSwitch.isMaxLinesDefined;
      })
        .margin(5)
        .id('TextInput_MaxLines_Modifier_Button0')
    }.width('100%')
  }
}