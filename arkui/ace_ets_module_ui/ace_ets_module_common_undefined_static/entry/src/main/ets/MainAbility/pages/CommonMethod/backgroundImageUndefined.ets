'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  $r,
  ImageRepeat,
  BackgroundImageOptions,
  ColumnOptions,
  BorderOptions,
  Row,
  Image,
  Builder,
  Position,
  RowOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import inspector from '@ohos.arkui.inspector'

@Entry
@Component
struct Index {
  @State isBgImage1: boolean = true;
  @State isBgImage2: boolean = true;
  @State isBgImagePosition: boolean = true;

  build() {
    Column({ space: 5 } as ColumnOptions) {

      Column() {
      }
      .id('bg_column1')
      .width('100%')
      .height('10%')
      .border({ width: 1 } as BorderOptions)
      .backgroundImage(this.isBgImage1 ? undefined : $r('app.media.startIcon'), ImageRepeat.X)

      Column() {
      }
      .id('bg_column2')
      .width('100%')
      .height('10%')
      .border({ width: 1 } as BorderOptions)
      .backgroundImage(this.isBgImage2 ? undefined : $r('app.media.startIcon'),
        { repeat: ImageRepeat.X } as BackgroundImageOptions)

      Column() {
      }
      .id('bg_column3')
      .width('100%')
      .height('10%')
      .border({ width: 1 } as BorderOptions)
      .backgroundImage($r('app.media.startIcon'),
        { repeat: ImageRepeat.X } as BackgroundImageOptions)
      .backgroundImagePosition(this.isBgImagePosition ? undefined : { x: '-50px' } as Position)

      Column() {
        Button('Btn1 : ' + this.isBgImage1)
          .id('bg_Btn1')
          .onClick((e: ClickEvent) => {
            this.isBgImage1 = !this.isBgImage1
          })
        Button('Btn2 : ' + this.isBgImage2)
          .id('bg_Btn2')
          .onClick((e: ClickEvent) => {
            this.isBgImage2 = !this.isBgImage2
          })
        Button('Btn3 : ' + this.isBgImagePosition)
          .id('bg_Btn3')
          .onClick((e: ClickEvent) => {
            this.isBgImagePosition = !this.isBgImagePosition
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}

