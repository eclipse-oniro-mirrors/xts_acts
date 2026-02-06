import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'

@Entry
@Component
struct MyStateSample1 {
  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button('123').backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'On Click');
        })
    }
  }
}

@Component
struct Child {
  build() {
  }
}
