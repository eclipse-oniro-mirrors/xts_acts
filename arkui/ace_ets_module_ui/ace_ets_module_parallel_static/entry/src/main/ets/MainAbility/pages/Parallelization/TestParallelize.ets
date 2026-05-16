'use static'
import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ParallelizeUI } from '@ohos.arkui.Parallelize';

class Param {
  str: string;
  constructor(str: string) {
    this.str = str;
  }
}

@Entry
@Component
struct Index {
  @State str: string = 'Hello';
  build() {
    Column() {
      // 使用ParallelizeUI<T>传递外部状态变量来构造参数
      ParallelizeUI<Param>(undefined, () => { return new Param(this.str); }, (param: Param) => {
        Text(param.str)
        .id('key_TestParallelize_001')
          .fontSize(50)
      })
      Button('UpperCase')
      .id('click')
        .onClick((event: ClickEvent) => {
          this.str = this.str.toUpperCase()
        })
    }.height('100%')
    .width('100%')
  }
}