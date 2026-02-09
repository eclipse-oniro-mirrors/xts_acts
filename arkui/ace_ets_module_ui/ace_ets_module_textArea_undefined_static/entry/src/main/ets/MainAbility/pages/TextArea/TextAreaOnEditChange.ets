'use static'

import {
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search, Button, InsertValue,
  TextAlign, AttributeModifier, TextAreaAttribute
} from '@ohos.arkui.component';
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  public count : Int = 0;
  public isCallback: Boolean = true;
  applyNormalAttribute(instance: TextAreaAttribute): void {
    instance.height(56)
    instance.onEditChange(this.isCallback ? undefined :
      (status: boolean) => {
        this.count++;
      })
  }
}

@Entry
@Component
struct Index {
  @State count : Int = 0;
  @State isCallback: Boolean = true;
  @State text: string = 'Hello World!!!!!!!!!!!!'
  @State textAreaModifier: TextAreaModifier = new TextAreaModifier()
  build() {
    Row(undefined) {
      Column(undefined) {
        Text('' + this.count + this.textAreaModifier.count)
          .id('TextAreaText').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')

        Button('callback ' + this.isCallback ? 'false' : 'true')
          .id('change')
          .onClick((e: ClickEvent)=>{
            this.isCallback = !this.isCallback;
            this.textAreaModifier.isCallback = !this.textAreaModifier.isCallback;
          })

        TextArea()
          .id('TextArea')
          .height(56)
          .onEditChange(this.isCallback ? undefined :
            (status: boolean) => {
              this.count++;
            })
        Text('TextArea Modifier')
        TextArea({ text: this.text })
          .id('Modifier')
          .attributeModifier(this.textAreaModifier)
      }.height('100%')
    }.width('100%')
  }
}