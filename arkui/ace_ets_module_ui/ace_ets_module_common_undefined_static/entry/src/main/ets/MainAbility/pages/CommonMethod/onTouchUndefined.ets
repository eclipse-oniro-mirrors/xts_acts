'use static'
import {
  Entry,
  Component,
  Column,
  Button,
  Text,
  ColumnOptions,
  ClickEvent,
  Margin,
  Color,
  SizeOptions,
  Blank,
  TouchEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TouchExample {
  @State cnt : int = 0;
  @State isOnTouchUndefined: boolean = true;

  build() {
    Column() {
      Button(`onTouch:${this.cnt}`).width(100).height(40).margin(30)
        .id('MyButtonTouch')
        .onTouch(this.isOnTouchUndefined ? (event?: TouchEvent): void => {
          this.cnt++;
        } : undefined)
      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isOnTouchUndefined: ' + this.isOnTouchUndefined)
          .id('Common_OnTouch')
          .onClick((e: ClickEvent) => {
            this.isOnTouchUndefined = !this.isOnTouchUndefined
          })
          .height(20)
      }
    }
    .width('100%').height('100%').margin({ top: 30 } as Margin)
  }
}