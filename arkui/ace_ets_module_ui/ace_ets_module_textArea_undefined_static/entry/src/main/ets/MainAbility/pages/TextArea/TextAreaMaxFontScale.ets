'use static'

import { Entry, Text, Column, Component, TextArea, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaMaxFontScale {
  @State maxFontScale: number = 1.1;
  @State isFontScaleDefined: boolean = true;

  build() {
    Column() {
      TextArea({ placeholder: 'TextArea maxFontScale undefined ' })
        .maxFontScale(undefined)
        .id('TextArea_MaxFontScale_Undefined0')
      TextArea({ placeholder: `TextArea maxFontScale ${this.isFontScaleDefined ? `1.1` : `undefined`}` })
        .maxFontScale(this.isFontScaleDefined ? this.maxFontScale : undefined)
        .id('TextArea_MaxFontScale_Dynamic0')

      Text('isFontScaleDefined: ' + this.isFontScaleDefined).height(30)
      Button('change isFontScaleDefined').onClick((event: ClickEvent) => {
        this.isFontScaleDefined = !this.isFontScaleDefined;
      })
        .margin(5)
        .id('TextArea_MaxFontScale_Button0')
    }.width('100%')
  }
}