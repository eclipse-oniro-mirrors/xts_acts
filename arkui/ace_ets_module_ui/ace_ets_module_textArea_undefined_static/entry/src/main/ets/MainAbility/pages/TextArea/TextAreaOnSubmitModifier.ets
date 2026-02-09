'use static'


import {
  Entry,
  Component,
  TextMenuItem,
  ResourceStr,
  RichEditorController,
  RichEditorOptions,
  RichEditor,
  TextRange,
  Column,
  ColumnOptions,
  Row,
  TextMenuItemId,
  $r,
  Button,
  TextArea,
  TextInput,
  Search,
  Color,
  Text,
  CopyOptions,
  ClickEvent,
  AttributeModifier,
  TextAreaAttribute,
  TextAreaSubmitCallback,
  EnterKeyType,
  SubmitEvent
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  @State state: boolean = false;
  @State content: EnterKeyType = EnterKeyType.Send;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    if (this.state == false) {
      instance.onSubmit(undefined);
    } else {
      instance.onSubmit((enterKey: EnterKeyType, event?: SubmitEvent) => {
        this.content = enterKey;
      } as TextAreaSubmitCallback);
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
    'The once-blue heavens gradually transform, '
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier();
  build() {
    Row() {
      Column( { space: 10 } as ColumnOptions ) {
        Text(`${this.textAreaModifier.content}`)
          .id('Text')
        Button(`onSubmit: ${this.textAreaModifier.state}`)
          .id('button_onSubmit')
          .width(240)
          .fontSize(16)
          .margin(10)
          .onClick((e: ClickEvent)=>{
            this.textAreaModifier.content = EnterKeyType.Send;
            this.textAreaModifier.state = ! this.textAreaModifier.state;
          })

        TextArea({text: this.text})
          .attributeModifier(this.textAreaModifier)
          .height(56)
          .id('TextArea')
          .enterKeyType(EnterKeyType.Go)
        Search({value: ''})
          .id('Search')

      }.width('100%')
    }
    .height('100%')
  }
}