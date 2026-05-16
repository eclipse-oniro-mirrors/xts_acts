'use static'

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  HitTestMode,
  TouchEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State isUndefined: boolean = true;
  @State count : int = 0;
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Column() {
        Text(`touch:${this.count}`)
          .id('EI_text')
          .fontSize(20)
          .width('100%')
      }
      .id('EI_column')
      .width('100%')
      .height('20%')
      .borderWidth(1)
      .onTouchIntercept(this.isUndefined ? undefined : (event: TouchEvent) => {
        this.count++;
        return HitTestMode.Default;
      })

      Button('btn : ' + this.isUndefined)
        .id('EI_btn')
        .onClick((e: ClickEvent) => {
          this.isUndefined = !this.isUndefined
        })
    }

  }
}