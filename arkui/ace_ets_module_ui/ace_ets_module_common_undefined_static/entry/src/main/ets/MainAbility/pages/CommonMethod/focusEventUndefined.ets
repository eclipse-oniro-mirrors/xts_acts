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
  focusControl
} from '@ohos.arkui.component'

@Entry
@Component
struct Index {
  @State isUndefined: boolean = true;
  @State cnt: int = 0;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button(`focus:${this.cnt}`)
        .id('FE_btn1')
        .onFocus(this.isUndefined ? undefined : () => {
          this.cnt++;
        })
      Row() {
        Button('req')
          .id('FE_req')
          .onClick((e: ClickEvent) => {
            focusControl.requestFocus('FE_btn1')
          })
        Button('req2')
          .id('FE_req2')
          .onClick((e: ClickEvent) => {
            focusControl.requestFocus('FE_btn2')
          })
      }

      Button('Btn2 : ' + this.isUndefined)
        .id('FE_btn2')
        .onClick((e: ClickEvent) => {
          this.isUndefined = !this.isUndefined;
        }).defaultFocus(true)
    }.width('100%').height('100%')
  }
}