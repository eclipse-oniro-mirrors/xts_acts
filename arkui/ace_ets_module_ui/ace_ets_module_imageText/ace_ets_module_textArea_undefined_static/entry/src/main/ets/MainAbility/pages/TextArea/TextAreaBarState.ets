'use static'


import {
  Entry,
  Component,
  Column,
  Text,
  TextArea,
  ClickEvent,
  Row,
  Button,
  BarState
} from '@ohos.arkui.component'
import {
  State,

} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextAreaBarStateTest {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, ';
  @State textAreaIndex: Int = 0;
  @State textAreaArray: (BarState | undefined)[] = [BarState.Off, undefined, BarState.On, BarState.Auto];
  @State textAreaArrayStr: string[] = ['Off', 'undefined', 'On', 'Auto'];
  build() {
    Column(undefined) {
      Button('TextArea BarState: ' + this.textAreaArrayStr[this.textAreaIndex])
        .onClick((e: ClickEvent)=>{
          this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
        })
        .id('button_barState')
      TextArea({text:this.text})
        .height(50)
        .barState(this.textAreaArray[this.textAreaIndex])
        .id('TextAreaTest')
    }
    .height('100%')
  }
}