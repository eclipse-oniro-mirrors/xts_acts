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
  Margin,
  TextInputStyle,
  TextHeightAdaptivePolicy
} from '@ohos.arkui.component'
import {
  State,

} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextAreaCaretColorTest {
  @State text: string = 'Hello World!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
  @State array: (TextHeightAdaptivePolicy | undefined)[] = [
    TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST, undefined,
    TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST, TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST,
    TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST, TextHeightAdaptivePolicy.MAX_LINES_FIRST];
  @State index: Int = 0;
  build() {
    Column(undefined) {
      Row(undefined){
        Button('button1').onClick((e:ClickEvent)=>{
          this.index = 0;
        })
          .id('button1')
          .width('33%')
        Button('button2').onClick((e:ClickEvent)=>{
          this.index = 1;
        })
          .id('button2')
          .width('33%')
      }.height('5%')
      Row(undefined) {
        Button('button3').onClick((e:ClickEvent)=>{
          this.index = 2;
        })
          .id('button3')
          .width('33%')
        Button('button4').onClick((e:ClickEvent)=>{
          this.index = 3;
        })
          .id('button4')
          .width('33%')
      }.height('5%')
      Row(undefined) {
        Button('button5').onClick((e:ClickEvent)=>{
          this.index = 4;
        })
          .id('button5')
          .width('33%')
        Button('button6').onClick((e:ClickEvent)=>{
          this.index = 5;
        })
          .id('button6')
          .width('33%')
      }.height('5%')
      TextInput({text:this.text})
        .height(56)
        .minFontSize(4)
        .maxFontSize(40)
        .maxLines(3)
        .style(TextInputStyle.Inline)
        .heightAdaptivePolicy(this.array[this.index])
        .id('TextInputTest')
    }
    .height('100%')
  }
}