'use static'

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  Row,
  Navigation,
  NavigationTitleMode,
  Builder,
  ToolbarItem
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State isUndefined1: boolean = true;
  @State isUndefined2: boolean = true;

  build() {
    Navigation() {
      Button('btn1 : ' + this.isUndefined1)
        .id('Navigation_btn1')
        .onClick((e: ClickEvent) => {
          this.isUndefined1 = !this.isUndefined1
        })
      Button('btn2 : ' + this.isUndefined2)
        .id('Navigation_btn2')
        .onClick((e: ClickEvent) => {
          this.isUndefined2 = !this.isUndefined2
        })
    }
    .width('100%')
    .height('100%')
    .borderWidth(1)
    .id('Navigation_1')
    .titleMode(this.isUndefined1 ? undefined : NavigationTitleMode.Full)
    .toolbarConfiguration(this.isUndefined2 ? undefined : [
      {
        value: 'toolbar',
      }
    ] as Array<ToolbarItem>)
  }

}