'use static'

import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Row,
  RowOptions,
  Text,
  $r,
  Alignment,
  KeyEvent,
  KeyType,
  ModifierKey
} from '@ohos.arkui.component'

@Entry
@Component
struct Index {
  @State isUndefined: boolean = true;
  @State count: int = 0;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button(`click:${this.count}`)
        .id('kevent_btn1')
        .defaultFocus(true)
        .onKeyEvent(this.isUndefined ? undefined : (event?: KeyEvent) => {
          this.count++;
          return true;
        })
      Button('btn : ' + this.isUndefined)
        .id('kevent_btn2')
        .focusable(false)
        .onClick((e: ClickEvent) => {
          this.isUndefined = !this.isUndefined;
        })
    }.width('100%').height('100%')
  }
}