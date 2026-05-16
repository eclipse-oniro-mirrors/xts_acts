'use static'


import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, Color, TextContentStyle, TextOverflow, TextInputStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputTextOverFlow {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breath taking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.';
  @State change: boolean = false;

  build() {
    Row() {
      Column() {
        TextInput({ text: this.text })
          .width('50%')
          .key('TextInput_textOverflow_001')
          .style(TextInputStyle.Inline as TextInputStyle)
          .textOverflow(this.change ? TextOverflow.Ellipsis : undefined)

        Button('点击切换undefined').id('textOverflowButton').onClick((event: ClickEvent) => {
          this.change = !this.change;
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}