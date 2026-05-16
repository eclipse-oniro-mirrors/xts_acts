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
  ResizableOptions,
  Color,
  HoverEffect,
  ImageSize,
  HitTestMode,
  Blank
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct CommonUndefined {
  @State cnt : int = 0;
  @State isBackgroundImageResizableUndefined: boolean = true;
  @State isHoverEffectUndefined: boolean = true;
  @State isBackgroundImageSizeUndefined: boolean = true;
  @State isHitTestBehaviorUndefined: boolean = true;
  @State isOnClickUndefined: boolean = true;

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Column() {}
      .width('100%')
      .height('12%')
      .border({ width: 1 } as BorderOptions)
      .id('MyColumn')
      .backgroundColor(Color.Gray)
      .backgroundImage($r('app.media.startIcon'))
      .backgroundImageResizable(this.isBackgroundImageResizableUndefined ? {
        slice: {
          top: 8,
          bottom: 8,
          left: 8,
          right: 8
        }
      } as ResizableOptions : undefined)
      .hoverEffect(this.isHoverEffectUndefined ? HoverEffect.Scale : undefined)
      .backgroundImageSize(this.isBackgroundImageSizeUndefined ? ImageSize.Cover : undefined)
      .hitTestBehavior(this.isHitTestBehaviorUndefined ? HitTestMode.Block : undefined)

      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isBackgroundImageResizableUndefined: ' + this.isBackgroundImageResizableUndefined)
          .id('Common_BackgroundImageResizable')
          .onClick((e: ClickEvent) => {
            this.isBackgroundImageResizableUndefined = !this.isBackgroundImageResizableUndefined
          })
          .height(20)
        Button('isHoverEffectUndefined: ' + this.isHoverEffectUndefined)
          .id('Common_HoverEffect')
          .onClick((e: ClickEvent) => {
            this.isHoverEffectUndefined = !this.isHoverEffectUndefined
          })
          .height(20)
        Button('isBackgroundImageSizeUndefined: ' + this.isBackgroundImageSizeUndefined)
          .id('Common_BackgroundImageSize')
          .onClick((e: ClickEvent) => {
            this.isBackgroundImageSizeUndefined = !this.isBackgroundImageSizeUndefined
          })
          .height(20)
        Button('isHitTestBehaviorUndefined: ' + this.isHitTestBehaviorUndefined)
          .id('Common_HitTestBehavior')
          .onClick((e: ClickEvent) => {
            this.isHitTestBehaviorUndefined = !this.isHitTestBehaviorUndefined
          })
          .height(20)
      }
      Button(`click:${this.cnt}`).width(100).height(40).margin(30)
        .id('MyButton')
        .onClick(this.isOnClickUndefined ? (event: ClickEvent) => {
          this.cnt++;
        } : undefined)
      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isOnClickUndefined: ' + this.isOnClickUndefined)
          .id('Common_OnClick')
          .onClick((e: ClickEvent) => {
            this.isOnClickUndefined = !this.isOnClickUndefined
          })
          .height(20)
      }

    }

  }
}