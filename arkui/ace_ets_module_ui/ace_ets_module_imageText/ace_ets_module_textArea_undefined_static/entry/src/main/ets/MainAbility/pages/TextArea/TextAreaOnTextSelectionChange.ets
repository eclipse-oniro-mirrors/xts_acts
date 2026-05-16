'use static'

import { Entry, Row, Column, Component, Button, ClickEvent,
  Text, TextArea, ResourceStr, $r, Resource, TextInputStyle, OnTextSelectionChangeCallback } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State text: string = 'Hello World!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!' +
    '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';
  @State message: Int = 0;
  callBack: OnTextSelectionChangeCallback = (selectionStart: Int, selectionEnd: Int) => {
    this.isOnChangeText = true;
    this.message = selectionStart;
  }

  @State isOnChangeText: boolean = false;
  @State textAreaIndex: Int = 0;
  @State textAreaArray: (OnTextSelectionChangeCallback | undefined)[] = [undefined, this.callBack];
  @State textAreaArrayStr: string[] = ['undefined', 'callback'];

  build() {
    Row(undefined) {
      Column(undefined) {
        Button('textArea onTextSelectionChange: ' + this.textAreaArrayStr[this.textAreaIndex])
          .onClick((e: ClickEvent)=>{
            this.textAreaIndex = ++this.textAreaIndex % this.textAreaArray.length;
            this.isOnChangeText = false;
          })
          .id('button_onTextSelectionChange')
        Text(this.isOnChangeText ? `${this.message}` : 'undefined')
          .id('text_onTextSelectionChange')
        TextArea({text: this.text})
          .id('TextAreaTest')
          .height(56)
          .onTextSelectionChange(this.textAreaArray[this.textAreaIndex])
      }.height('100%')
    }.width('100%')
  }
}