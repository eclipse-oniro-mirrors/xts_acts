'use static'

import { Entry, Text, Column, Component, TextInput, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputMinFontScale {
  @State minFontScale: number = 0.9;
  @State isFontScaleDefined: boolean = true;

  build() {
    Column() {
      TextInput({ placeholder: 'TextInput minFontScale undefined ' })
        .minFontScale(undefined)
        .id('TextInput_MinFontScale_Undefined0')
      TextInput({ placeholder: `TextInput minFontScale ${this.isFontScaleDefined ? `0.9` : `undefined`}` })
        .minFontScale(this.isFontScaleDefined ? this.minFontScale : undefined)
        .id('TextInput_MinFontScale_Dynamic0')

      Text('isFontScaleDefined: ' + this.isFontScaleDefined).height(30)
      Button('change isFontScaleDefined').onClick((event: ClickEvent) => {
        this.isFontScaleDefined = !this.isFontScaleDefined;
      })
        .margin(5)
        .id('TextInput_MinFontScale_Button0')
    }.width('100%')
  }
}