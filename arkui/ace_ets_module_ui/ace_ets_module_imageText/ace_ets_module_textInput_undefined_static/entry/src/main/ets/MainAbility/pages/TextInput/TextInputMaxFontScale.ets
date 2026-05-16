'use static'

import { Entry, Text, Column, Component, TextInput, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextInputMaxFontScale {
  @State maxFontScale: number = 1.1;
  @State isFontScaleDefined: boolean = true;

  build() {
    Column() {
      TextInput({ placeholder: 'TextInput maxFontScale undefined ' })
        .maxFontScale(undefined)
        .id('TextInput_MaxFontScale_Undefined0')
      TextInput({ placeholder: `TextInput maxFontScale ${this.isFontScaleDefined ? `1.1` : `undefined`}` })
        .maxFontScale(this.isFontScaleDefined ? this.maxFontScale : undefined)
        .id('TextInput_MaxFontScale_Dynamic0')

      Text('isFontScaleDefined: ' + this.isFontScaleDefined).height(30)
      Button('change isFontScaleDefined').onClick((event: ClickEvent) => {
        this.isFontScaleDefined = !this.isFontScaleDefined;
      })
        .margin(5)
        .id('TextInput_MaxFontScale_Button0')
    }.width('100%')
  }
}