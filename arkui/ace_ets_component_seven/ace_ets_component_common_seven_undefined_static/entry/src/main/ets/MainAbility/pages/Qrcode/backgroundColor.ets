'use static';
import { ResourceColor, Color, QRCode, Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

// xxx.ets
@Entry
@Component
struct QRCodeExample {
  private value: string = 'hello world';

  @State isChange:Boolean | undefined = false;
  @State backgroundColor_:ResourceColor | undefined = Color.Blue;

  build() {
    Column() {
      QRCode(this.value).width(140).height(140)
        .backgroundColor(this.backgroundColor_)
        .id('TestQrcodebackgroundColor')

      Button('Change').onClick(() => {
          this.backgroundColor_ = undefined;
      })
        .id('changeButton')

    }.width('100%')
  }
}



