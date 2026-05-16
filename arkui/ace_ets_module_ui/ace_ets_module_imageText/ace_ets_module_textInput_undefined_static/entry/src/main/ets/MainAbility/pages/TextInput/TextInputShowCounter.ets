'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, TextArea, TextInput, InputCounterOptions, Row, Scroll,
  AttributeModifier, TextAreaAttribute, TextInputAttribute } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputShowCounter {
  @State change: boolean = true;

  build() {
    Row() {
      Column() {
        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_showCounter_001')
          .showCounter(this.change ? undefined : true)

        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_showCounter_002')
          .showCounter(true,
            { thresholdPercentage: this.change ? 50.0 : undefined, highlightBorder: true } as InputCounterOptions)

        TextInput({ placeholder: 'input your word...' })
          .width('100%')
          .key('TextInput_showCounter_003')
          .showCounter(true,
            { thresholdPercentage:  50.0 ,  highlightBorder: this.change ? false : undefined } as InputCounterOptions)

        Button('点击切换undefined').id('showCounterButton').onClick((event: ClickEvent) => {
          this.change = !this.change;
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}