'use static'


import { Entry, Row, Column, Component, Button, ClickEvent,
  TextArea,TextContentStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State textAreaIndex: Int = 0;
  @State textAreaArray: (TextContentStyle| undefined)[] = [
    TextContentStyle.DEFAULT, TextContentStyle.INLINE, undefined, TextContentStyle.INLINE];
  @State textAreaArrayStr: string[] = ['DEFAULT', 'INLINE', 'DEFAULT', 'INLINE'];

  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, ';
  build() {
    Row(undefined) {
      Column(undefined) {
        Button('textArea style: ' + this.textAreaArrayStr[this.textAreaIndex])
          .onClick((e: ClickEvent)=>{
            this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
          })
          .id('button_style')
        TextArea({ text: this.text })
          .id('TextAreaTest')
          .height(56)
          .style(this.textAreaArray[this.textAreaIndex])
      }.height('100%')
    }.width('100%')
  }
}