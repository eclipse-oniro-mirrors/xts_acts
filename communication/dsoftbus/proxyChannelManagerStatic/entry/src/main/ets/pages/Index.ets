'use static'

import { Entry, Text, RelativeContainer, TextAttribute, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'

@Entry
@Component
struct MyStateSample {
  @State message: string = 'proxychannelmanagerstatic';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('proxychannelmanagerstatic')
        .fontSize(20)
        .margin({ left: 0, top: '50%' })
    }
    .height('100%')
    .width('100%')
  }
}
