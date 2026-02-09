'use static'

import {
  Entry, Component, $r, Text, Row, Column,ClickEvent, TextInput, TextArea, Span, Search, Button,
  TextAlign, Resource, Scroll, IconOptions, Color, CopyOptions, CancelButtonOptions, CancelButtonSymbolOptions,
  CancelButtonStyle, TextInputAttribute, AttributeModifier
} from '@ohos.arkui.component';
import { State, AppStorage, Observed } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  public index: Int = 0;
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.height(56)
    if (this.index == 0) {
      instance.cancelButton(undefined)
    } else if(this.index == 1) {
      instance.cancelButton({ style: CancelButtonStyle.CONSTANT, icon: {size: 20, color:$r('app.color.red')} as IconOptions} as CancelButtonOptions)
    } else if (this.index == 2) {
      instance.cancelButton(undefined)
    } else if (this.index == 3) {
      instance.cancelButton({ style: CancelButtonStyle.CONSTANT} as CancelButtonSymbolOptions)
    } else if (this.index == 4) {
      instance.cancelButton(undefined)
    }
  }
}

@Entry
@Component
struct Index {
  @State textInputIndex: Int = 0;
  @State textInputArray: (CancelButtonOptions | undefined)[] = [
    undefined,
    { style: CancelButtonStyle.CONSTANT, icon: {size: 20, color:$r('app.color.red')} as IconOptions} as CancelButtonOptions,
    undefined];
  @State textInputArrayStr: string[] = ['undefined', 'CancelButtonStyle', 'undefined']
  @State text: string = 'Hello World!!!!!!!!!!!!!!!!!!!'
  @State textInputModifier: TextInputModifier = new TextInputModifier()
  build() {
    Row(undefined) {
      Column(undefined) {
        Button('textInput CancelButton' + this.textInputArrayStr[this.textInputIndex])
          .id('change')
          .onClick((e: ClickEvent)=>{
            this.textInputIndex = ++this.textInputIndex % this.textInputArray.length;
            this.textInputModifier.index = ++this.textInputModifier.index % this.textInputArray.length;
          })
        TextInput({ text: this.text })
          .id('TextInput')
          .height(56)
          .cancelButton(this.textInputArray[this.textInputIndex])

        Text('TextInput Modifier')
        TextInput({ text: this.text })
          .id('Modifier')
          .attributeModifier(this.textInputModifier)
      }.height('100%')
    }.width('100%')
  }
}