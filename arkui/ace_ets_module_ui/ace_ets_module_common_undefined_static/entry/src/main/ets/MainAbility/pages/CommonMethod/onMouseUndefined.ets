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
  MouseEvent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct MouseExample {
  @State cnt: int = 0;
  @State isOnMouseUndefined: boolean = true;

  build() {
    Column() {
      Button(`onMouse:${this.cnt}`)
        .width(100)
        .height(40)
        .margin(30)
        .id('MyButtonMouse')
        .onMouse(this.isOnMouseUndefined ? (event: MouseEvent): void => {
          this.cnt++;
        } : undefined)
      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isOnMouseUndefined: ' + this.isOnMouseUndefined)
          .id('Common_OnMouse')
          .onClick((e: ClickEvent) => {
            this.isOnMouseUndefined = !this.isOnMouseUndefined
          })
          .height(20)
      }
    }
    .width('100%').height('100%').margin({ top: 30 } as Margin)
  }
}