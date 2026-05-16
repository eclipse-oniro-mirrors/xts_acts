'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  Margin,
  Row,
  Visibility,
  ColumnOptions,
  HorizontalAlign,
  FlexAlign,
  Color
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct EnabledExample {
  @State isVisibility: Visibility | undefined = undefined

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('undefined').fontSize(15).width('90%').fontColor(0xCCCCCC)
      Row().visibility(this.isVisibility).width('90%').height(80).backgroundColor(Color.Blue)
        .id('common_visibility')

      Button('visibility: ' + this.isVisibility)
        .height('5%')
        .onClick(() => {
          this.isVisibility = this.isVisibility === undefined ? Visibility.Hidden : undefined
        })
        .id('button_visibility')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}