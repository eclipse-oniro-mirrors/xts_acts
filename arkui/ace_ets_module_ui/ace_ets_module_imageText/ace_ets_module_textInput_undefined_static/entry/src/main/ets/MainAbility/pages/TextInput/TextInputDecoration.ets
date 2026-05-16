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
  TextDecorationType,
  Color,
  TextDecorationStyle,
  TextDecorationOptions
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputCaretColorTest {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, '
  @State option1: TextDecorationOptions = 
  {type: TextDecorationType.Underline, color: Color.Red, style: TextDecorationStyle.DOUBLE} as TextDecorationOptions
  @State option2: TextDecorationOptions = 
  {type: TextDecorationType.Overline, color: Color.Blue, style: TextDecorationStyle.DASHED} as TextDecorationOptions
  @State option3: TextDecorationOptions = 
  {type: TextDecorationType.LineThrough, color: Color.Blue, style: TextDecorationStyle.SOLID} as TextDecorationOptions
  @State option4: TextDecorationOptions = 
  {type: undefined, color: Color.Blue, style: TextDecorationStyle.DOUBLE} as TextDecorationOptions
  @State option5: TextDecorationOptions = 
  {type: TextDecorationType.LineThrough, color: undefined, style: TextDecorationStyle.DOUBLE} as TextDecorationOptions
  @State option6: TextDecorationOptions = 
  {type: TextDecorationType.Underline, color: Color.Blue,style: undefined} as TextDecorationOptions
  @State array: (TextDecorationOptions | undefined)[] = [
    this.option1, undefined, this.option2, this.option3, this.option4, this.option5, this.option6];
  @State index: Int = 0
  build() {
    Column(undefined) {
      Row(undefined){
        Button('button1').onClick((e:ClickEvent)=>{
          this.index = 1
        })
          .id('button1')
          .width('33%')
        Button('button2').onClick((e:ClickEvent)=>{
          this.index = 2
        })
          .id('button2')
          .width('33%')
      }.height('5%')
      Row(undefined) {
        Button('button3').onClick((e:ClickEvent)=>{
          this.index = 3
        })
          .id('button3')
          .width('33%')
        Button('button4').onClick((e:ClickEvent)=>{
          this.index = 4
        })
          .id('button4')
          .width('33%')
      }.height('5%')
      Row(undefined) {
        Button('button5').onClick((e:ClickEvent)=>{
          this.index = 5
        })
          .id('button5')
          .width('33%')
        Button('button6').onClick((e:ClickEvent)=>{
          this.index = 6
        })
          .id('button6')
          .width('33%')
      }.height('5%')
      TextInput({text:this.text})
        .height(50)
        .decoration(this.array[this.index])
        .id('TextInputTest')
    }
    .height('100%')
  }
}