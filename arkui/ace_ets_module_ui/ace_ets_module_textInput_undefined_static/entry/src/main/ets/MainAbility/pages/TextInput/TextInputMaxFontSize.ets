'use static'

import {
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search, Button,
  TextAlign, Resource, Scroll, AttributeModifier, TextInputAttribute
} from '@ohos.arkui.component';
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.height(56)
    if (this.index == 0) {
      instance.maxFontSize(undefined)
    } else if(this.index == 1) {
      instance.maxFontSize(10.0)
    } else if (this.index == 2) {
      instance.maxFontSize('20')
    } else if (this.index == 3) {
      instance.maxFontSize($r('app.string.maxFontSize'))
    } else if (this.index == 4) {
      instance.maxFontSize(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State textInputIndex: Int = 0;
  @State textInputArray: (number | string | Resource | undefined)[] = [
    undefined,
    10.0,
    '20',
    $r('app.string.maxFontSize'),
    undefined];
  @State textInputArrayStr: string[] = ['undefined', '10.0', '20', '30', 'undefined']
  @State text: string = 'Hello World!!!!!!!!!!!'
  @State textInputModifier: TextInputModifier = new TextInputModifier()
  build() {
    Row(undefined) {
      Scroll(undefined){
        Column(undefined) {
          Button('textInput maxFontSize' + this.textInputArrayStr[this.textInputIndex])
            .id('change')
            .onClick((e: ClickEvent)=>{
              this.textInputIndex = ++this.textInputIndex % this.textInputArray.length;
              this.textInputModifier.index = ++this.textInputModifier.index % this.textInputArray.length;
            })
          TextInput({ text: this.text })
            .id('TextInput')
            .height(56)
            .maxFontSize(this.textInputArray[this.textInputIndex])
            .fontSize(50)
            .minFontSize(10)
          Text('TextInput Modifier')
          TextInput({ text: this.text })
            .id('Modifier')
            .attributeModifier(this.textInputModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}
