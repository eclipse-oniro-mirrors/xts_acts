'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  FlexAlign,
  Row,
  ColumnOptions,
  HorizontalAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct EnabledExample {
  @State isEnabled: boolean | undefined = false

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('undefined').enabled(this.isEnabled)
        .id('commonmethod_enabled')
      Button('undefined: ' + this.isEnabled)
        .onClick(() => {
          this.isEnabled = this.isEnabled === undefined ? false : undefined
        })
        .id('button_enabled')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}