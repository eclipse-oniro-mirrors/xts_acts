'use static'

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  GestureJudgeResult,
  GestureInfo,
  BaseGestureEvent,
  GestureEvent,
  GestureGroup,
  GestureMode,
  TapGesture
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State isUndefined: boolean = true;
  @State count: int = 0;

  build() {
    Column({ space: 10 } as ColumnOptions) {

      Column() {
        Text(`Click${this.count}`)
          .id('GJ_text')
          .width('100%')
          .height('20%')
          .gesture(
            TapGesture()
              .tag('tap4')// 设置点击手势标志
          )
          .onGestureJudgeBegin(this.isUndefined ? undefined :
            (gestureInfo: GestureInfo, event: BaseGestureEvent) => {
              this.count++;
              return GestureJudgeResult.CONTINUE;
            })
      }

      Button('btn: ' + this.isUndefined)
        .id('GJ_btn')
        .onClick((e: ClickEvent) => {
          this.isUndefined = !this.isUndefined
        })

    }
  }
}