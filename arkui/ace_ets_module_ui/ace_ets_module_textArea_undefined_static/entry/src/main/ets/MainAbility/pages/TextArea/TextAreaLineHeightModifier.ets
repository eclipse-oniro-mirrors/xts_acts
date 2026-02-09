'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, Row, ClickEvent, Button,
  AttributeModifier, TextAreaAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextAreaModifierUndefined implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance
      .height(30)
      .lineHeight(undefined)
  }
}

@Observed
class TextAreaModifierDynamicSwitch implements AttributeModifier<TextAreaAttribute> {
  public isLineHeightDefined: boolean = true;

  applyNormalAttribute(instance: TextAreaAttribute): void {
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
struct TextAreaLineHeightModifier {
  private textAreaModifierUndefined: TextAreaModifierUndefined = new TextAreaModifierUndefined();
  @State private textAreaModifierDynamicSwitch: TextAreaModifierDynamicSwitch = new TextAreaModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextArea({text: 'TextArea lineHeight undefined'})
        .attributeModifier(this.textAreaModifierUndefined)
        .id('TextArea_LineHeight_Modifier_Undefined0')
      TextArea({text: `TextArea lineHeight ${this.textAreaModifierDynamicSwitch.isLineHeightDefined ? `40` : `undefined`}`})
        .attributeModifier(this.textAreaModifierDynamicSwitch)
        .id('TextArea_LineHeight_Modifier_Dynamic0')

      Text('isLineHeightDefined:' + this.textAreaModifierDynamicSwitch.isLineHeightDefined).height(30)
      Button('change isLineHeightDefined').onClick((event: ClickEvent) => {
        this.textAreaModifierDynamicSwitch.isLineHeightDefined = 
        !this.textAreaModifierDynamicSwitch.isLineHeightDefined;
      })
        .margin(5)
        .id('TextArea_LineHeight_Modifier_Button0')

    }.width('100%')
  }
}