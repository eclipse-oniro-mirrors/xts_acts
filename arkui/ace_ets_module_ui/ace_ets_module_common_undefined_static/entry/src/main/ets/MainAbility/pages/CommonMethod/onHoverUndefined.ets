'use static'

import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Button,
  ClickEvent,
  Column,
  ColumnOptions,
  Row,
  Entry,
  Component,
  Text,
  Color,
  HoverEvent
} from '@ohos.arkui.component'

@Entry
@Component
struct Index {
  @State isUndefined: boolean = true;
  @State cnt : int = 0;
  build() {
    Column({ space: 5 } as ColumnOptions) {

      Button(`hover:${this.cnt}`)
        .id('hover_btn1')
        .onHover(this.isUndefined ? undefined : (isHover: boolean, event: HoverEvent) => {
          this.cnt++;
        })

      Button('btn : ' + this.isUndefined)
        .id('hover_btn2')
        .onClick((e: ClickEvent) => {
          this.isUndefined = !this.isUndefined;
        })
    }.width('100%').height('100%')
  }
}