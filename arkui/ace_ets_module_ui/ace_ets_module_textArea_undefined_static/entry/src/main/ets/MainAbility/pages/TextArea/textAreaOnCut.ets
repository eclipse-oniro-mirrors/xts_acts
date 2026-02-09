'use static'


import {
  Entry, Component, Column, TextArea, Row, Button, ClickEvent, Color, InputType, Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaOnCut {
  @State onCutChange: boolean = false;
  @State cutValue: string = '';
  @State cutFlag: boolean = false;

  build() {
    Row() {
      Column() {
        Button('点击切换undefined').id('TextAreaOnCutButton').onClick((event: ClickEvent) => {
          this.onCutChange = !this.onCutChange;
        })
        Text(this.cutValue).height(30)
          .id('TextAreaOnCut')

        TextArea({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextAreaOnCut')
          .onCut(this.onCutChange ? (cutValue: string) => {
            this.cutValue = cutValue ;
            this.cutFlag = true;
          } : undefined)
      }
      .width('100%')
    }
    .height('100%')
  }
}
