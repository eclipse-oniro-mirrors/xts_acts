'use static'

import { Entry, Text, Column, Component, TextArea, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextAreaAttribute, TextAlign } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextAreaModifierUndefined implements AttributeModifier<TextAreaAttribute> {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance
      .minFontScale(undefined)
  }
}

@Observed
class TextAreaModifierDynamicSwitch implements AttributeModifier<TextAreaAttribute> {
  public isFontScaleDefined: boolean = true;

  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.isFontScaleDefined) {
      instance.minFontScale(0.9)
    } else {
      instance.minFontScale(undefined)
    }
  }
}

@Entry
@Component
struct TextAreaMinFontScaleModifier {
  private textAreaModifierUndefined: TextAreaModifierUndefined = new TextAreaModifierUndefined();
  @State private textAreaModifierDynamicSwitch: TextAreaModifierDynamicSwitch = new TextAreaModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {

      TextArea({ text: 'TextArea fontScale undefined'})
        .attributeModifier(this.textAreaModifierUndefined)
        .id('TextArea_MinFontScale_Modifier_Undefined0')
      TextArea({ text: `TextArea lineHeight ${this.textAreaModifierDynamicSwitch.isFontScaleDefined ? `1.1` : `undefined`}` })
        .attributeModifier(this.textAreaModifierDynamicSwitch)
        .id('TextArea_MinFontScale_Modifier_Dynamic0')

      Text('isFontScaleDefined:' + this.textAreaModifierDynamicSwitch.isFontScaleDefined).height(30)
      Button('change isFontScaleDefined').onClick((event: ClickEvent) => {
        this.textAreaModifierDynamicSwitch.isFontScaleDefined = !this.textAreaModifierDynamicSwitch.isFontScaleDefined;
      })
        .margin(5)
        .id('TextArea_MinFontScale_Modifier_Button0')

    }.width('100%')
  }
}