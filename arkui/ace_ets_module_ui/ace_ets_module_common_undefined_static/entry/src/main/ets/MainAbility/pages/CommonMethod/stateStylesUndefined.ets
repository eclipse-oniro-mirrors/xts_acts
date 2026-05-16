'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  $r,
  ImageRepeat,
  BackgroundImageOptions,
  ColumnOptions,
  BorderOptions,
  Row,
  Image,
  Builder,
  CommonMethod,
  StateStyles,
  Color,
  Position,
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
  private bgColor1: Color = Color.Red;

  normalStyle(instance: CommonMethod) {
    instance.height(60)
  }

  @State isStateStyles: boolean = true;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button() {
      }
      .id('ss_column')
      .height(30)
      .width('15%')
      .border({ width: 1 })
      .stateStyles(this.isStateStyles ? undefined : {
        normal: this.normalStyle
      } as StateStyles)


      Button('btn1 : ' + this.isStateStyles)
        .id('ss_btn1')
        .onClick((e: ClickEvent) => {
          this.isStateStyles = !this.isStateStyles
        })
    }
  }
}