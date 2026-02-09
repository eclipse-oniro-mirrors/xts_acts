'use static'


import { Entry, Row, Column, Component, Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, Resource, TextInputStyle } from '@ohos.arkui.component'
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
  @State textAreaArray: (double |string | Resource | undefined)[] = [
    '2', undefined, 1.0, 0.0,$r('app.float.maxFontScale')];
  @State textAreaArrayStr: string[] = [ '2', 'undefined', '1.0', '0.0', '3.5'];

  build() {
    Row(undefined) {
      Column(undefined) {
        Button('TextArea letterSpacing: ' + this.textAreaArrayStr[this.textAreaIndex])
          .onClick((e: ClickEvent)=>{
            this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
          })
          .id('button_letterSpacing')
        Text('TextArea')
        TextArea({ text: this.text })
          .height(56)
          .letterSpacing(this.textAreaArray[this.textAreaIndex])
          .id('TextAreaTest')
      }.height('100%')
    }.width('100%')
  }
}