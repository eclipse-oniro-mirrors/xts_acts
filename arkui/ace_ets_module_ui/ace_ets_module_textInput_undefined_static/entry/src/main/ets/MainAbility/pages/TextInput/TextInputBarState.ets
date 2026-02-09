'use static'


import {
  Entry,
  Component,
  Column,
  Text,
  TextInput,
  ClickEvent,
  Row,
  Button,
  BarState,
  TextInputStyle
} from '@ohos.arkui.component'
import {
  State,

} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextInputBarStateTest {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, ';
  @State textInputIndex: Int = 0;
  @State textInputArray: (BarState | undefined)[] = [BarState.Off, undefined, BarState.On, BarState.Auto];
  @State textInputArrayStr: string[] = ['Off', 'undefined', 'On', 'Auto'];
  build() {
    Column(undefined) {
      Button('textInput BarState: ' + this.textInputArrayStr[this.textInputIndex])
        .onClick((e: ClickEvent)=>{
          this.textInputIndex = ++this.textInputIndex % this.textInputArray.length;
        })
        .id('button_barState')
      TextInput({text:this.text})
        .style(TextInputStyle.Inline)
        .barState(this.textInputArray[this.textInputIndex])
        .id('TextInputTest')
    }
    .height('100%')
  }
}