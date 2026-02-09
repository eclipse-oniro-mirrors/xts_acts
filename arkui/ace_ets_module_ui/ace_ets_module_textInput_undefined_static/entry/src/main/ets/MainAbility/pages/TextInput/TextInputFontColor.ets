'use static'


import { Entry, Text, Row, Column, Component, Button, ClickEvent, Search, Color, TextArea, TextInput, SearchController,
  AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute, $r } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct TextInputFontColor {
  @State fontColorChange: boolean = true;

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_FontColor_001')
          .fontColor(this.fontColorChange ? '#FFFFFF00' : undefined)

        Button('点击切换undefined').id('button1').onClick((event: ClickEvent) => {
          this.fontColorChange = !this.fontColorChange;
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}