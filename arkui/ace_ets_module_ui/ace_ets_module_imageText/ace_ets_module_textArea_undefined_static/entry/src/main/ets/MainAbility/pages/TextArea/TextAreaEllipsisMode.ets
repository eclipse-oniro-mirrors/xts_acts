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
  EllipsisMode,
  TextOverflow
} from '@ohos.arkui.component'
import {
  State,

} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextAreaCaretColorTest {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, ';
  @State array: (EllipsisMode | undefined)[] = [
    EllipsisMode.START, undefined, EllipsisMode.START, EllipsisMode.END, EllipsisMode.CENTER];
  @State index: Int = 0;
  build() {
    Column(undefined) {
      Row(undefined){
        Button('button1').onClick((e:ClickEvent)=>{
          this.index = 1;
        })
          .id('button1')
          .width('33%')
        Button('button2').onClick((e:ClickEvent)=>{
          this.index = 2;
        })
          .id('button2')
          .width('33%')
      }.height('5%')
      Row(undefined) {
        Button('button3').onClick((e:ClickEvent)=>{
          this.index = 3;
        })
          .id('button3')
          .width('33%')
        Button('button4').onClick((e:ClickEvent)=>{
          this.index = 4;
        })
          .id('button4')
          .width('33%')
      }.height('5%')
      TextArea({text:this.text})
        .height(50)
        .maxLines(1)
        .textOverflow(TextOverflow.Ellipsis)
        .ellipsisMode(this.array[this.index])
        .id('TextAreaTest')
    }
    .height('100%')
  }
}