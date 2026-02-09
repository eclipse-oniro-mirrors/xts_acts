'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, Search, Color, TextArea, TextInput, SearchController,
  AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute, DeleteValue } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct TextInputOnDidDelete {
  controller: SearchController = new SearchController();
  @State onDelChange: boolean = false;
  @State delFlag: boolean = false;
  @State delValue: string = '';

  build() {
    Column() {
      Text(`${this.delValue}`)
        .id('DeleteValue')
      Button('点击切换undefined')
        .id('onDidDeleteButton')
        .onClick(() => {
          this.onDelChange = !this.onDelChange;
        })
      TextInput({ placeholder: 'input your word...' })
        .key('TextInput_onDidDelete_001')
        .onDidDelete(this.onDelChange ? (info: DeleteValue) => {
          this.delValue = info.deleteValue;
          this.delFlag = true;
        } : undefined)
    }
  }
}