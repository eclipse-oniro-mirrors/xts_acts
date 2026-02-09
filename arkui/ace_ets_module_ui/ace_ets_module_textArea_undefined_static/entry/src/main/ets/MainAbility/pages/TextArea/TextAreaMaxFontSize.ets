'use static'

import {
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search, Button,
  TextAlign, Resource, Scroll, AttributeModifier, TextAreaAttribute
} from '@ohos.arkui.component';
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: TextAreaAttribute): void {
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
  @State textAreaIndex: Int = 0;
  @State textAreaArray: (number | string | Resource | undefined)[] = [
    undefined,
    10.0,
    '20',
    $r('app.string.maxFontSize'),
    undefined];
  @State textAreaArrayStr: string[] = ['undefined', '10.0', '20', '30', 'undefined']
  @State text: string = 'Hello World!!!!!!!!!!!!!!!!!!!!!!!!'
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier()
  build() {
    Row(undefined) {
      Scroll(undefined){
        Column(undefined) {
          Button('textArea maxFontSize' + this.textAreaArrayStr[this.textAreaIndex])
            .id('change')
            .onClick((e: ClickEvent)=>{
              this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
              this.textAreaModifier.index = ++this.textAreaModifier.index % this.textAreaArray.length;
            })
          TextArea({ text: this.text })
            .id('TextArea')
            .height(56)
            .maxFontSize(this.textAreaArray[this.textAreaIndex])
            .fontSize(50)
            .minFontSize(10)

          Text('TextArea Modifier')
          TextArea({ text: this.text })
            .id('Modifier')
            .attributeModifier(this.textAreaModifier)
        }
      }.height('100%')
    }.width('100%')
  }
}
