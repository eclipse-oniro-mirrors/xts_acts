'use static'

import { Entry, Text, Column, Component, TextArea, Search, ColumnOptions, ClickEvent, Button, TextContentStyle,
  AttributeModifier, TextAreaAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextAreaModifierUndefined implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance
      .style(TextContentStyle.INLINE)
      .maxLines(undefined)
  }
}

@Observed
class TextAreaModifierDynamicSwitch implements AttributeModifier<TextAreaAttribute> {
  public isMaxLinesDefined: boolean = true;

  applyNormalAttribute(instance: TextAreaAttribute): void {
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
struct TextAreaMaxLinesModifier {
  longText: string = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';

  private textAreaModifierUndefined: TextAreaModifierUndefined = new TextAreaModifierUndefined();
  @State private textAreaModifierDynamicSwitch: TextAreaModifierDynamicSwitch = new TextAreaModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextArea({ text: `maxLines undefined ${this.longText}` })
        .attributeModifier(this.textAreaModifierUndefined)
        .id('TextArea_MaxLines_Modifier_Undefined0')
      TextArea({ text: `maxLines ${this.textAreaModifierDynamicSwitch.isMaxLinesDefined ? `5` : `undefined`} ${this.longText}` })
        .attributeModifier(this.textAreaModifierDynamicSwitch)
        .id('TextArea_MaxLines_Modifier_Dynamic0')

      Text('isMaxLinesDefined:' + this.textAreaModifierDynamicSwitch.isMaxLinesDefined).height(30)
      Button('change isMaxLinesDefined').onClick((event: ClickEvent) => {
        this.textAreaModifierDynamicSwitch.isMaxLinesDefined = !this.textAreaModifierDynamicSwitch.isMaxLinesDefined;
      })
        .margin(5)
        .id('TextArea_MaxLines_Modifier_Button0')
    }.width('100%')
  }
}