'use static'


import { Entry, Text, Column, Component, TextInput, TextArea, Search, ColumnOptions, Row, ClickEvent, 
  Button, AttributeModifier, TextInputAttribute, TextAreaAttribute, SearchAttribute,
  TextDecorationOptions, TextDecorationType, TextDecorationStyle,
  KeyboardAppearance, TextOverflow, $r,Color } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  public state: boolean = false;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.state == false) {
      instance.keyboardAppearance(undefined);
    } else {
      instance.keyboardAppearance(KeyboardAppearance.DARK_IMMERSIVE);
    }
  }
}

@Entry
@Component
struct TextInputExample {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, ';
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier();
  build() {
    Row() {
      Column( { space: 10 } as ColumnOptions ) {
        Button(`keyboardAppearance: ${this.textAreaModifier.state}`)
          .id('button_keyboardAppearance')
          .width(240)
          .fontSize(16)
          .margin(10)
          .onClick((e: ClickEvent)=>{
            this.textAreaModifier.state = !this.textAreaModifier.state;
          })
        Search({value:''})
          .id('Search')
        TextArea({text: this.text})
          .attributeModifier(this.textAreaModifier)
          .textOverflow(TextOverflow.Ellipsis)
          .maxLines(2)
          .height(56)
          .id('TextArea')
      }.width('100%')
    }
    .height('100%')
  }
}