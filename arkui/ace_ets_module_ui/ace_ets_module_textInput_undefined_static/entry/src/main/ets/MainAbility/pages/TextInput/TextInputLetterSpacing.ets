'use static'


import { Entry, Row, Column, Component, Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, Resource, TextInputStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct textInputLetterSpacing {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, '

  @State textInputIndex: Int = 0;
  @State textInputArray: (double |string | Resource | undefined)[] = [
    '2', undefined, 1.0, 0.0,$r('app.float.maxFontScale')];
  @State textInputArrayStr: string[] = [ '2', 'undefined', '1.0', '0.0', '3.5']

  build() {
    Row(undefined) {
      Column(undefined) {
        Button('TextInput letterSpacing: ' + this.textInputArrayStr[this.textInputIndex])
          .onClick((e: ClickEvent)=>{
            this.textInputIndex = ++this.textInputIndex % this.textInputArray.length;
          })
          .id('button_letterSpacing')
        Text('TextInput')
        TextInput({ text: this.text })
          .height(56)
          .letterSpacing(this.textInputArray[this.textInputIndex])
          .id('TextInputTest')
      }.height('100%')
    }.width('100%')
  }
}