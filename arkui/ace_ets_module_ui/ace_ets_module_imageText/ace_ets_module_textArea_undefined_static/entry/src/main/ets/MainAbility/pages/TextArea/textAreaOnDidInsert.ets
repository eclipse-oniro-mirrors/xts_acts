'use static'


import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, Color, InputType, InsertValue, Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaOnDidInsert {
  @State change: boolean = false;
  @State istFlag: boolean = false;
  @State istValue: string = '';

  build() {
    Row() {
      Column() {
        Text(`${this.istValue}`)
          .id('TextAreaOnDidInsertText').fontSize(10).width('100%').height('5%')
        Button('点击切换undefined').id('TextAreaOnDidInsertButton').onClick((event: ClickEvent) => {
          this.change = !this.change;
        })
        TextArea({ placeholder: 'input your word...' })
          .width('100%')
          .id('TextAreaOnDidInsert')
          .onDidInsert(this.change ? (info: InsertValue) => {
            this.istValue = info.insertValue;
            this.istFlag = true;
          } : undefined)
      }
      .width('100%')
    }
    .height('100%')
  }
}