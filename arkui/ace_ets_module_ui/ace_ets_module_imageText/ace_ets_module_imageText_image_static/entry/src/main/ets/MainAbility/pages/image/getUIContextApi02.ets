'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, Image, Color, $r} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { UIContext } from '@ohos.arkui.UIContext';
@Entry
@Component
struct getUIContextApi02 {
  @State text1: string = '';
  @State text2: string = '';
  onPageShow() {
    this.getUIContext().setImageCacheCount(0);
    this.getUIContext().setImageRawDataCacheSize(0);
    console.info('Application onPageShow');
  }
  onDestroy() {
    console.info('Application onDestroy');
  }

  build() {
    Column(undefined) {
      Text('getUIContextApi02')
      Button('setImage')
        .onClick(() => {
          this.getUIContext().setImageCacheCount(0);
          this.getUIContext().setImageRawDataCacheSize(0);
          this.text1 = 'setImageCacheCount = 0'
          this.text2 = 'setImageRawDataCacheSize = 0'
          console.info('Application onPageShow');
        })
        .id('Button001')
        .width('20%')
      Text(this.text1)
        .id('getUIContextApi02_text001')
      Text(this.text2)
        .id('getUIContextApi02_text002')
      Image($r('app.media.startIcon'))
        .width('10%')
        .height(35)
    }.width('100%').height('100%')
  }
}