'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, TextArea, TextInput, TextOverflow, TextInputStyle,
  AttributeModifier, TextAreaAttribute, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'



@Observed
class MyTextInputModifier implements AttributeModifier<TextInputAttribute> {
  public isChange: boolean = false;

  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.isChange) {
      instance.textOverflow(TextOverflow.Ellipsis);
    } else {
      instance.textOverflow(undefined);
    }
  }
}

@Entry
@Component
struct TextInputTextOverFlowModifier {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange,' +
    ' pink, and lavender, creating a breath taking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.';
  @State change: boolean = false;
  @State textInputModifier: MyTextInputModifier = new MyTextInputModifier();

  build() {
    Column() {

      Text('-----Modifier-----')
      Button('Modifier_change')
        .id('textOverflowButton')
        .onClick(() => {
          this.textInputModifier.isChange = !this.textInputModifier.isChange;
        })
      Text('---Inline---')
      TextInput({ text: this.text })
        .key('TextInput_textOverflow_001')
        .width('50%')
        .style(TextInputStyle.Inline as TextInputStyle)
        .attributeModifier(this.textInputModifier)
    }
  }
}