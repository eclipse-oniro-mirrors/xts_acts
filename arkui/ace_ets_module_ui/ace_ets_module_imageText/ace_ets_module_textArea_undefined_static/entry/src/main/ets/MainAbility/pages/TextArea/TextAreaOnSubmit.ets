'use static'


import { Entry, Text, Column, Component, TextInput, TextArea, Search, ColumnOptions, Row, ClickEvent, Button,
  FontStyle, FontWeight, CopyOptions, TextAlign, Color, CaretStyle, EnterKeyType, TextAreaSubmitCallback, SubmitEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextAreaExample {
  @State enterKeyType:EnterKeyType = EnterKeyType.Send;
  @State isOnSubmitValid:boolean = false;

  build() {
    Row(undefined) {
      Column(undefined) {
        Text(`${this.enterKeyType}`)
          .id('enterKeyType')
        TextArea({text: 'HelloWorld'})
          .id('TextAreaTest')
          .enterKeyType(EnterKeyType.Go)
          .onSubmit(this.isOnSubmitValid ? (enterKey: EnterKeyType, event?: SubmitEvent) => {
            this.enterKeyType = enterKey;
            this.isOnSubmitValid = true;
            console.info(`${enterKey}`)
          } as TextAreaSubmitCallback : undefined)
        Button('change isOnSubmitValid:' + this.isOnSubmitValid)
          .onClick((event: ClickEvent) => {
            this.enterKeyType = EnterKeyType.Send;
            this.isOnSubmitValid = !this.isOnSubmitValid;
        })
          .id('changeIsOnSubmitValid')
      }.width('100%')
    }
    .height('100%')
  }
}