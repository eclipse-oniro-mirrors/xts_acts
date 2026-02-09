'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, ClickEvent, Button, AttributeModifier,
  TextInputAttribute, CaretStyle, Color } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

const curCaretStyle:(CaretStyle | undefined)[] = [
  { width : '4vp', color : Color.Red } as CaretStyle,
  { width : undefined, color : Color.Red } as CaretStyle,
  { width : '4vp', color : undefined } as CaretStyle,
  { width : undefined, color : undefined } as CaretStyle,
  { width : '4vp', color : Color.Red } as CaretStyle,
  undefined
]

@Observed
class TextInputModifierUndefined implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(30)
      .caretStyle(undefined)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public caretStyleIndex: Int = 0;

  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .height(30)
    if (this.caretStyleIndex === 0) {
      instance
      .caretStyle(curCaretStyle[0])
    } else if (this.caretStyleIndex === 1) {
      instance
        .caretStyle(curCaretStyle[1])
    } else if (this.caretStyleIndex === 2) {
      instance
        .caretStyle(curCaretStyle[2])
    } else if (this.caretStyleIndex === 3) {
      instance
        .caretStyle(curCaretStyle[3])
    } else if (this.caretStyleIndex === 4) {
      instance
        .caretStyle(curCaretStyle[4])
    } else if (this.caretStyleIndex === 5) {
      instance
        .caretStyle(curCaretStyle[5])
    }
  }
}

@Entry
@Component
struct TextInputCaretStyleModifier {
  private textInputModifierUndefined: TextInputModifierUndefined = new TextInputModifierUndefined();
  @State private textInputModifierDynamicSwitch: TextInputModifierDynamicSwitch = new TextInputModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextInput({text: 'TextInput caretStyle undefined'})
        .attributeModifier(this.textInputModifierUndefined)
        .id('TextInput_CaretStyle_Modifier_Undefined0')
      TextInput({text: `TextInput caretStyle ${this.textInputModifierDynamicSwitch.caretStyleIndex}`})
        .attributeModifier(this.textInputModifierDynamicSwitch)
        .id('TextInput_CaretStyle_Modifier_Dynamic0')

      Text('caretStyleIndex:' + this.textInputModifierDynamicSwitch.caretStyleIndex).height(30)
      Button('change caretStyleIndex').onClick((event: ClickEvent) => {
        this.textInputModifierDynamicSwitch.caretStyleIndex = (
        this.textInputModifierDynamicSwitch.caretStyleIndex + 1) %6;      
})
        .margin(5)
        .id('TextInput_CaretStyle_Modifier_Button0')

    }.width('100%')
  }
}