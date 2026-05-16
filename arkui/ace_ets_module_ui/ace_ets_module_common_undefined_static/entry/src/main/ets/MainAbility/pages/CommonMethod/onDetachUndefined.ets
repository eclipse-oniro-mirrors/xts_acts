'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  Flex,
  FlexAlign,
  Margin,
  ColumnOptions,
  HorizontalAlign,
  FontWeight
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct AppearExample {
  @State change: boolean = true;
  @State isShow: boolean = true;
  @State count: Int = 0;

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('change' + this.change)
        .onClick(() => {
          this.change = !this.change
        }).margin(15)
        .id('button_onDetach')
      Button('onDetach')
        .onClick(() => {
          this.isShow = !this.isShow
        }).margin(15)
        .id('button_onDetach2')
      Text('Count' + this.count)
        .fontSize(26)
        .id('commonmethod_onDetach')
      if (this.isShow === true) {
        Text('Text for onDetach')
          .fontSize(26)
          .onDetach(this.change?() => {
            this.count += 1;
          }: undefined)
      }
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}