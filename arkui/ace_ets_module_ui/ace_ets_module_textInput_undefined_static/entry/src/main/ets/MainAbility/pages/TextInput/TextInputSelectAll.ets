'use static'


import { Entry, Row, Column, Component, Button, ClickEvent,
  Text, TextArea, TextInput, Search, ResourceStr, $r, Resource, TextInputStyle, OnTextSelectionChangeCallback } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State textInputIndex: Int = 0;
  @State textInputArray: (boolean| undefined)[] = [true, undefined, true, false];
  @State textInputArrayStr: string[] = ['true', 'undefined', 'true', 'false'];
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
        Button('TextInput selectAll: ' + this.textInputArrayStr[this.textInputIndex])
          .onClick((e: ClickEvent)=>{
            this.textInputIndex = ++this.textInputIndex % this.textInputArray.length;
          })
          .id('button_selectAll')
        TextInput({ text: this.text })
          .height(56)
          .selectAll(this.textInputArray[this.textInputIndex])
          .id('TextInputTest')
      }.height('100%')
    }.width('100%')
  }
}