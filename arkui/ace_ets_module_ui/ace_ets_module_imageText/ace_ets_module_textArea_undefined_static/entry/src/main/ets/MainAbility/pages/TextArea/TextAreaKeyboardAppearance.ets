'use static'


import { Entry, Row, Column, Component,ClickEvent,Button,
  Text, TextArea, TextInput, Search, ResourceStr, $r, KeyboardAppearance, Resource } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, ';

  @State textAreaIndex: Int = 0;
  @State textAreaArray: (KeyboardAppearance | undefined)[] = [
    KeyboardAppearance.IMMERSIVE, KeyboardAppearance.NONE_IMMERSIVE,
    KeyboardAppearance.DARK_IMMERSIVE, undefined, KeyboardAppearance.LIGHT_IMMERSIVE];
  @State textAreaArrayStr: string[] = ['IMMERSIVE', 'NONE_IMMERSIVE', 'DARK_IMMERSIVE', 'undefined', 'LIGHT_IMMERSIVE'];

  build() {
    Row(undefined) {
      Column(undefined) {
        Button('TextArea KeyboardAppearance: ' + this.textAreaArrayStr[this.textAreaIndex])
          .onClick((e: ClickEvent)=>{
            this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
          })
          .id('button_KeyboardAppearance')
        Search({value:''})
          .id('Search')
        TextArea({ text: this.text })
          .id('TextAreaTest')
          .height(56)
          .keyboardAppearance(this.textAreaArray[this.textAreaIndex])
        }.width('100%')
      }.height('100%')
  }
}