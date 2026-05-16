'use static'


import { Entry, Text, Column, Component, Button, ClickEvent, Search, Color, TextArea, TextInput, SearchController,
  AttributeModifier, SearchAttribute, TextAreaAttribute, TextInputAttribute, DeleteValue } from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct TextAreaOnDidDelete {
  controller: SearchController = new SearchController();
  @State onDelChange: boolean = false;
  @State delFlag: boolean = false;
  @State delValue: string = '';

  build() {
    Column() {
      Text(`${this.delValue}`)
        .id('TextAreaOnDidDelete')
      Button('点击切换undefined')
        .id('TextAreaOnDidDeleteButton')
        .onClick(() => {
          this.onDelChange = !this.onDelChange;
        })
      TextArea({ placeholder: 'input your word...' })
        .key('TextAreaOnDidDelete')
        .onDidDelete(this.onDelChange ? (info: DeleteValue) => {
          this.delValue = info.deleteValue;
          this.delFlag = true;
        } : undefined)
    }
  }
}