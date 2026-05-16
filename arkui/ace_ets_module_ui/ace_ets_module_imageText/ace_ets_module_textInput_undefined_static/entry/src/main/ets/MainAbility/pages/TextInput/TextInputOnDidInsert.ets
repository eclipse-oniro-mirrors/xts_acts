'use static'


import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, Color, InputType, InsertValue, Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputOnDidInsert {
  @State change: boolean = false;
  @State istFlag: boolean = false;
  @State istValue: string = '';

  build() {
    Row() {
      Column() {
        Text(`${this.istValue}`)
          .id('InsertValue').fontSize(10).width('100%').height('5%')
        Button('点击切换undefined').id('onDidInsertButton').onClick((event: ClickEvent) => {
          this.change = !this.change;
        })
        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .id('TextInput_onDidInsert_001')
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