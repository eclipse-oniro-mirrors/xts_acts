'use static'


import {
  Entry, Component, Column, TextInput, Row, Button, ClickEvent, Color, InputType, Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputOnCut {
  @State onCutChange: boolean = false;
  @State cutValue: string = '';
  @State cutFlag: boolean = false;

  build() {
    Row() {
      Column() {
        Button('点击切换undefined').id('onCutButton').onClick((event: ClickEvent) => {
          this.onCutChange = !this.onCutChange;
        })
        Text(this.cutValue).height(30)
          .id('TextInput_onCut_Value')

        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_onCut_001')
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
