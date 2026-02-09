'use static'

import {
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search, Button, InsertValue,
  TextAlign, AttributeModifier, TextInputAttribute
} from '@ohos.arkui.component';
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  public count : Int = 0;
  public isCallback: Boolean = true;
  applyNormalAttribute(instance: TextInputAttribute): void {
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
  @State textInputModifier: TextInputModifier = new TextInputModifier()
  build() {
    Row(undefined) {
      Column(undefined) {
        Text('' + this.count + this.textInputModifier.count)
          .id('TextInputText').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')

        Button('callback ' + this.isCallback ? 'false' : 'true')
          .id('change')
          .onClick((e: ClickEvent)=>{
            this.isCallback = !this.isCallback;
            this.textInputModifier.isCallback = !this.textInputModifier.isCallback;
          })

        TextInput({ text: this.text })
          .id('TextInput')
          .height(56)
          .onEditChange(this.isCallback ? undefined :
            (status: boolean) => {
              this.count++;
            })
        Text('TextInput Modifier')
        TextInput({ text: this.text })
          .id('Modifier')
          .attributeModifier(this.textInputModifier)
      }.height('100%')
    }.width('100%')
  }
}