'use static';
import { ResourceColor, Color, QRCode, Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

// xxx.ets
@Entry
@Component
struct QRCodeExample {
  @State isChange:Boolean | undefined = false;
  @State color_:ResourceColor | undefined = '#FF0000FF';

  build() {
    Column() {
      QRCode('hello world').width(140).height(140)
        .color(this.color_)
        .id('TestQrcodeColor')

      Button('Change').onClick(() => {
          this.color_ = undefined;
      })
        .id('changeButton')
    }.width('100%')
  }
}



