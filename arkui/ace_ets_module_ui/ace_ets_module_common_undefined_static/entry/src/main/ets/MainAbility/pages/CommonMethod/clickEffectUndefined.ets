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
  Row,
  Image,
  Builder,
  Color,
  ClickEffect,
  ClickEffectLevel,
  RowOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import inspector from '@ohos.arkui.inspector'


@Entry
@Component
struct Index {
  @State isClickEffect1: boolean = true;
  @State isClickEffect2: boolean = true;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('CEBtn1')
        .height(100)
        .width(100)
        .id('CE_ClickBtn1')
        .clickEffect(this.isClickEffect1 ? undefined : { level: ClickEffectLevel.LIGHT } as ClickEffect)
      Button('CEBtn2')
        .height(100)
        .width(100)
        .id('CE_ClickBtn2')
        .clickEffect(this.isClickEffect2 ? undefined : null)

      Button('btn1:' + this.isClickEffect1)
        .id('CE_btn1')
        .onClick((e: ClickEvent) => {
          this.isClickEffect1 = !this.isClickEffect1;
        })
      Button('btn2:' + this.isClickEffect2)
        .id('CE_btn2')
        .onClick((e: ClickEvent) => {
          this.isClickEffect2 = !this.isClickEffect2;
        })
    }
  }
}