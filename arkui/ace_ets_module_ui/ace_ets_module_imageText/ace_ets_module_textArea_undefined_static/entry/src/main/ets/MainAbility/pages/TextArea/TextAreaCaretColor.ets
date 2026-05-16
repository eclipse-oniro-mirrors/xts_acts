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
  Color,
  $r,
  ResourceColor
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
  @State caretColorList: (ResourceColor | undefined)[] = [
    Color.Orange, undefined, $r('app.color.red'), 125834408, '#00F5FF'];
  @State caretColorIndex: Int = 0;
  build() {
    Column(undefined) {
      Row(undefined){
        Button('setCaretColor1').onClick((e:ClickEvent)=>{
          this.caretColorIndex = 1;
        })
          .id('setCaretColor1')
          .width('33%')
        Button('setCaretColor2').onClick((e:ClickEvent)=>{
          this.caretColorIndex = 2;
        })
          .id('setCaretColor2')
          .width('33%')
      }.height('5%')
      Row(undefined) {
        Button('setCaretColor3').onClick((e:ClickEvent)=>{
          this.caretColorIndex = 3;
        })
          .id('setCaretColor3')
          .width('33%')
        Button('setCaretColor4').onClick((e:ClickEvent)=>{
          this.caretColorIndex = 4;
        })
          .id('setCaretColor4')
          .width('33%')
      }.height('5%')
      TextArea({text:this.text})
        .height(50)
        .caretColor(this.caretColorList[this.caretColorIndex])
        .id('TextAreaCaretColorTest')
    }
    .height('100%')
  }
}