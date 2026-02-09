'use static'

import { Entry, Text, Column, Component, TextArea, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaMinFontScale {
  @State minFontScale: number = 0.9;
  @State isFontScaleDefined: boolean = true;

  build() {
    Column() {
      TextArea({ placeholder: 'TextArea minFontScale undefined ' })
        .minFontScale(undefined)
        .id('TextArea_MinFontScale_Undefined0')
      TextArea({ placeholder: `TextArea minFontScale ${this.isFontScaleDefined ? `0.9` : `undefined`}` })
        .minFontScale(this.isFontScaleDefined ? this.minFontScale : undefined)
        .id('TextArea_MinFontScale_Dynamic0')

      Text('isFontScaleDefined: ' + this.isFontScaleDefined).height(30)
      Button('change isFontScaleDefined').onClick((event: ClickEvent) => {
        this.isFontScaleDefined = !this.isFontScaleDefined;
      })
        .margin(5)
        .id('TextArea_MinFontScale_Button0')
    }.width('100%')
  }
}