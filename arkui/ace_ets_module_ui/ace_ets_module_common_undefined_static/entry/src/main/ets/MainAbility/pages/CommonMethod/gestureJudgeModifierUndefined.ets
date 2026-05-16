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
  TapGesture,
  TextAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier implements AttributeModifier<TextAttribute> {
  public isUndefined: boolean = true;
  public cnt: int = 0;

  applyNormalAttribute(instance: TextAttribute): void {
    instance
      .onGestureJudgeBegin(this.isUndefined ? undefined :
        (gestureInfo: GestureInfo, event: BaseGestureEvent) => {
          this.cnt++;
          return GestureJudgeResult.CONTINUE;
        })

  }
}

@Entry
@Component
struct Index {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column({ space: 10 } as ColumnOptions) {

      Column() {
        Text(`Click${this.myModifier.cnt}`)
          .id('GJM_text')
          .width('100%')
          .height('20%')
          .gesture(
            TapGesture()
              .tag('tap4')// 设置点击手势标志
          )
          .attributeModifier(this.myModifier)
      }

      Button('btn: ' + this.myModifier.isUndefined)
        .id('GJM_btn')
        .onClick((e: ClickEvent) => {
          this.myModifier.isUndefined = !this.myModifier.isUndefined
        })

    }
  }
}