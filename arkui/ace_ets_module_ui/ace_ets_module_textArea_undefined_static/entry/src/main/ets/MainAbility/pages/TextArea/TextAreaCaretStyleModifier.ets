'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, ClickEvent, Button, AttributeModifier,
  TextAreaAttribute, CaretStyle, Color } from '@ohos.arkui.component'
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
class TextAreaModifierUndefined implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance
      .height(30)
      .caretStyle(undefined)
  }
}

@Observed
class TextAreaModifierDynamicSwitch implements AttributeModifier<TextAreaAttribute> {
  public caretStyleIndex: Int = 0;

  applyNormalAttribute(instance: TextAreaAttribute): void {
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
struct TextAreaCaretStyleModifier {
  private textAreaModifierUndefined: TextAreaModifierUndefined = new TextAreaModifierUndefined();
  @State private textAreaModifierDynamicSwitch: TextAreaModifierDynamicSwitch = new TextAreaModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {
      TextArea({text: 'TextArea caretStyle undefined'})
        .attributeModifier(this.textAreaModifierUndefined)
        .id('TextArea_CaretStyle_Modifier_Undefined0')
      TextArea({text: `TextArea caretStyle ${this.textAreaModifierDynamicSwitch.caretStyleIndex}`})
        .attributeModifier(this.textAreaModifierDynamicSwitch)
        .id('TextArea_CaretStyle_Modifier_Dynamic0')

      Text('caretStyleIndex:' + this.textAreaModifierDynamicSwitch.caretStyleIndex).height(30)
      Button('change caretStyleIndex').onClick((event: ClickEvent) => {
        this.textAreaModifierDynamicSwitch.caretStyleIndex = 
        (this.textAreaModifierDynamicSwitch.caretStyleIndex + 1) % 6;
      })
        .margin(5)
        .id('TextArea_CaretStyle_Modifier_Button0')

    }.width('100%')
  }
}