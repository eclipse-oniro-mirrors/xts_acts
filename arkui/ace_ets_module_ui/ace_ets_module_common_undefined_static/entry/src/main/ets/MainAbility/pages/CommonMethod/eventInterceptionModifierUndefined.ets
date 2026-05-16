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
  TouchEvent,
  ColumnAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyModifier implements AttributeModifier<ColumnAttribute> {
  public isUndefined: boolean = true;
  public count: int = 0;

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance
      .onTouchIntercept(this.isUndefined ? undefined : (event: TouchEvent) => {
        this.count++;
        return HitTestMode.Default;
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
        Text(`touch:${this.myModifier.count}`)
          .id('EIM_text')
          .fontSize(20)
          .width('100%')
      }
      .id('EIM_column')
      .width('100%')
      .height('20%')
      .borderWidth(1)
      .attributeModifier(this.myModifier)

      Button('btn : ' + this.myModifier.isUndefined)
        .id('EIM_btn')
        .onClick((e: ClickEvent) => {
          this.myModifier.isUndefined = !this.myModifier.isUndefined
        })
    }

  }
}