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
  Blank
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct AreaExample {
  @State cnt : int = 0;
  @State value4: string = 'Text'
  @State isOnSizeChangeUndefined: boolean = false;

  build() {
    Column() {
      Text(this.value4)
        .margin(30)
        .fontSize(20)
        .onClick(() => {
          this.value4 = this.value4 + 'Text'
        })
        .onSizeChange(this.isOnSizeChangeUndefined ? undefined : (oldValue: SizeOptions, newValue: SizeOptions) => {
          this.cnt++;
        })
        .id('changeValue')

      Button(`onSizeChange:${this.cnt}`).width(100).height(40).margin(30)
        .id('MyButton')

      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isOnSizeChangeUndefined: ' + this.isOnSizeChangeUndefined)
          .id('Common_OnSizeChange')
          .onClick((e: ClickEvent) => {
            this.isOnSizeChangeUndefined = !this.isOnSizeChangeUndefined
          })
          .height(20)
      }


    }
    .width('100%').height('100%').margin({ top: 30 } as Margin)
  }
}