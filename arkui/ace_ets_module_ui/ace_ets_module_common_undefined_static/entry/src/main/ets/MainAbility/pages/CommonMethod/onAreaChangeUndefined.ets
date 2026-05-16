'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  $r,
  ColumnOptions,
  BorderOptions,
  Position,
  Color,
  Area
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State isUndefined: boolean = true;
  @State msg: string = 'a';
  @State cnt: int = 0;

  build() {
    Column({ space: 10 } as ColumnOptions) {

      Text(`change${this.cnt}`)
        .id('OAC_text1')
      Text(this.msg)
        .id('OAC_text2')
        .onClick((e: ClickEvent) => {
          this.msg += 'a';
        })
        .onAreaChange(this.isUndefined ? undefined : (oldValue: Area, newValue: Area) => {
          this.cnt = this.msg.length;
        })
      Button('btn : ' + this.isUndefined)
        .id('OAC_btn1')
        .onClick((e: ClickEvent) => {
          this.isUndefined = !this.isUndefined
        })
    }
  }
}
