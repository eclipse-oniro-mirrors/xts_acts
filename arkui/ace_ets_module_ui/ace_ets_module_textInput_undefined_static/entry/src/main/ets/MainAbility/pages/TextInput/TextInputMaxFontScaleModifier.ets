'use static'

import { Entry, Text, Column, Component, TextInput, ColumnOptions, ClickEvent, Button,
  AttributeModifier, TextInputAttribute, TextAlign } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class TextInputModifierUndefined implements AttributeModifier<TextInputAttribute> {
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance
      .maxFontScale(undefined)
  }
}

@Observed
class TextInputModifierDynamicSwitch implements AttributeModifier<TextInputAttribute> {
  public isFontScaleDefined: boolean = true;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isFontScaleDefined) {
      instance.maxFontScale(1.1)
    } else {
      instance.maxFontScale(undefined)
    }
  }
}

@Entry
@Component
struct TextInputMaxFontScaleModifier {
  private textInputModifierUndefined: TextInputModifierUndefined = new TextInputModifierUndefined();
  @State private textInputModifierDynamicSwitch: TextInputModifierDynamicSwitch = new TextInputModifierDynamicSwitch();

  build() {
    Column( { space: 10 } as ColumnOptions ) {

      TextInput({ text: 'TextInput fontScale undefined'})
        .attributeModifier(this.textInputModifierUndefined)
        .id('TextInput_MaxFontScale_Modifier_Undefined0')
      TextInput({ text: `TextInput lineHeight ${this.textInputModifierDynamicSwitch.isFontScaleDefined ? `1.1` : `undefined`}` })
        .attributeModifier(this.textInputModifierDynamicSwitch)
        .id('TextInput_MaxFontScale_Modifier_Dynamic0')

      Text('isFontScaleDefined:' + this.textInputModifierDynamicSwitch.isFontScaleDefined).height(30)
      Button('change isFontScaleDefined').onClick((event: ClickEvent) => {
        this.textInputModifierDynamicSwitch.isFontScaleDefined =
        !this.textInputModifierDynamicSwitch.isFontScaleDefined;
      })
        .margin(5)
        .id('TextInput_MaxFontScale_Modifier_Button0')

    }.width('100%')
  }
}