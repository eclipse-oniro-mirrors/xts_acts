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
  SideBarContainer,
  ButtonStyle,
  DividerStyle,
  ButtonIconOptions,
  SideBarPosition,
  $r
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State isUndefined1: boolean = true;
  @State isUndefined2: boolean = true;
  @State isUndefined3: boolean = true;
  @State isUndefined4: boolean = true;
  @State isUndefined5: boolean = true;
  @State isUndefined6: boolean = true;
  @State isUndefined7: boolean = true;
  @State isUndefined8: boolean = true;
  @State isUndefined9: boolean = true;
  @State isUndefined10: boolean = true;
  @State isUndefined11: boolean = true;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      SideBarContainer() {
        Column()
        Column()
      }
      .id('SideBar_1')
      .autoHide(this.isUndefined1 ? undefined : false)
      .maxSideBarWidth(this.isUndefined3 ? undefined : 30.0)
      .minContentWidth(this.isUndefined4 ? undefined : 200.0)
      .minSideBarWidth(this.isUndefined5 ? undefined : 10.0)
      .showControlButton(this.isUndefined6 ? undefined : false)
      .divider(this.isUndefined7 ? undefined : { strokeWidth: 4 } as DividerStyle)
      .width('100%')
      .height('10%')
      .borderWidth(1)

      SideBarContainer() {
        Column()
        Column()
      }
      .id('SideBar_2')
      .autoHide( false)
      .controlButton(this.isUndefined2 ? undefined : {
        icons: {
          shown: $r('app.media.startIcon'),
          hidden: $r('app.media.startIcon'),
          switching: $r('app.media.startIcon')
        } as ButtonIconOptions
      } as ButtonStyle)
      .width('100%')
      .height('10%')
      .borderWidth(1)

      SideBarContainer() {
        Column()
        Column()
      }
      .id('SideBar_3')
      .autoHide( false)
      .divider(this.isUndefined8 ? undefined : null)
      .width('100%')
      .height('10%')
      .borderWidth(1)

      SideBarContainer() {
        Column()
        Column()
      }
      .id('SideBar_4')
      .sideBarWidth(this.isUndefined9 ? undefined : 150.0 as number)
      .showSideBar(this.isUndefined10 ? undefined : false)
      .width('100%')
      .height('10%')
      .borderWidth(1)

      SideBarContainer() {
        Column()
        Column()
      }
      .id('SideBar_5')
      .sideBarPosition(this.isUndefined11 ? undefined : SideBarPosition.End)
      .width('100%')
      .height('10%')
      .borderWidth(1)

      Row() {
        Button('btn1 : ' + this.isUndefined1)
          .id('SideBar_btn1')
          .onClick((e: ClickEvent) => {
            this.isUndefined1 = !this.isUndefined1
          })
        Button('btn2 : ' + this.isUndefined2)
          .id('SideBar_btn2')
          .onClick((e: ClickEvent) => {
            this.isUndefined2 = !this.isUndefined2
          })
        Button('btn3 : ' + this.isUndefined3)
          .id('SideBar_btn3')
          .onClick((e: ClickEvent) => {
            this.isUndefined3 = !this.isUndefined3
          })
      }

      Row() {
        Button('btn4 : ' + this.isUndefined4)
          .id('SideBar_btn4')
          .onClick((e: ClickEvent) => {
            this.isUndefined4 = !this.isUndefined4
          })
        Button('btn5 : ' + this.isUndefined5)
          .id('SideBar_btn5')
          .onClick((e: ClickEvent) => {
            this.isUndefined5 = !this.isUndefined5
          })
        Button('btn6 : ' + this.isUndefined6)
          .id('SideBar_btn6')
          .onClick((e: ClickEvent) => {
            this.isUndefined6 = !this.isUndefined6
          })
      }

      Row() {
        Button('btn7 : ' + this.isUndefined7)
          .id('SideBar_btn7')
          .onClick((e: ClickEvent) => {
            this.isUndefined7 = !this.isUndefined7
          })
        Button('btn8 : ' + this.isUndefined8)
          .id('SideBar_btn8')
          .onClick((e: ClickEvent) => {
            this.isUndefined8 = !this.isUndefined8
          })
        Button('btn9 : ' + this.isUndefined9)
          .id('SideBar_btn9')
          .onClick((e: ClickEvent) => {
            this.isUndefined9 = !this.isUndefined9
          })
      }

      Row() {
        Button('btn10 : ' + this.isUndefined10)
          .id('SideBar_btn10')
          .onClick((e: ClickEvent) => {
            this.isUndefined10 = !this.isUndefined10
          })
        Button('btn11 : ' + this.isUndefined11)
          .id('SideBar_btn11')
          .onClick((e: ClickEvent) => {
            this.isUndefined11 = !this.isUndefined11
          })
      }
    }.width('100%').height('100%')

  }
}