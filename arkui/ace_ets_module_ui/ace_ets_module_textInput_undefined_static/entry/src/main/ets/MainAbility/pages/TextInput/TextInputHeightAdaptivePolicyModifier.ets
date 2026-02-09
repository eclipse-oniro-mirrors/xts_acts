'use static'


import { Entry, Text, Column, Component,TextInput, Search, ColumnOptions, Row, ClickEvent, Button,AttributeModifier,
  TextInputAttribute, TextInputAttribute, SearchAttribute,
  TextInputStyle, TextDecorationType, TextDecorationStyle,
  TextHeightAdaptivePolicy, TextOverflow, $r,Color } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  public state: boolean = false;
  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.state == false) {
      instance.heightAdaptivePolicy(undefined);
    } else {
      instance.heightAdaptivePolicy(TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST);
    }
  }
}

@Entry
@Component
struct TextInputExample {
  @State text: string = 'Hello World!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
  @State textInputModifier: TextInputModifier = new TextInputModifier();
  build() {
    Row() {
      Column( { space: 10 } as ColumnOptions ) {
        Button(`heightAdaptivePolicy: ${this.textInputModifier.state}`)
          .id('button_heightAdaptivePolicy')
          .width(240)
          .fontSize(16)
          .margin(10)
          .onClick((e: ClickEvent)=>{
            this.textInputModifier.state = !this.textInputModifier.state;
          })
        TextInput({text: this.text})
          .attributeModifier(this.textInputModifier)
          .height(56)
          .minFontSize(4)
          .maxFontSize(40)
          .maxLines(3)
          .style(TextInputStyle.Inline)
          .id('TextInput')
      }.width('100%')
    }
    .height('100%')
  }
}