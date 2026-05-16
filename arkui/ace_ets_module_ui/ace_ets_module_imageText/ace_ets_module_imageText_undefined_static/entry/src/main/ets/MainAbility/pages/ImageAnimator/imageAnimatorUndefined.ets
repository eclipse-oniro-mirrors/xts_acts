'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  Image,
  Tabs,
  Color,
  $r,
  Row,
  ClickEvent,
  ImageAnimator,
  AnimationStatus,
  Margin,
  ForEach,
  TextAlign,
  Text,
  Scroller,
  Scroll,
  Blank,
  FillMode,
  ImageFrameInfo
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct ImageAnimatorExample {
  scroller: Scroller = new Scroller();
  @State isDuration: boolean = true;
  @State isIterations: boolean = true;
  @State isFillMode: boolean = true;
  @State isFixedSize: boolean = true;
  @State isMonitorInvisibleArea: boolean = true;
  @State isReverse: boolean = true;
  @State isState: boolean = true;
  @State isImages: boolean = true;

  build() {
    Column() {
      ImageAnimator()
        .id('ImageAnimator')
        .images(this.isImages ? [
          {
            src: $r('app.media.background'),
            width: 150,
            height: 150
          } as ImageFrameInfo,
          {
            src: $r('app.media.icon'),
            width: 150,
            height: 150
          } as ImageFrameInfo,
          {
            src: $r('app.media.startIcon'),
            width: 150,
            height: 150
          } as ImageFrameInfo
        ] : undefined)
        .duration(this.isDuration ? 5000 : undefined) // 设置图片播放时间
        .iterations(this.isIterations ? 2 : undefined)
        .fillMode(this.isFillMode ? FillMode.Backwards : undefined)
        .fixedSize(this.isFixedSize ? false : undefined)
        .monitorInvisibleArea(this.isMonitorInvisibleArea ? true : undefined)
        .reverse(this.isReverse ? true : undefined)
        .state(this.isState ? AnimationStatus.Running : undefined) // 设置播放状态
        .width(200)
        .height(150)

      Blank().height(10)

      Row() {
        Button('isDuration: ' + this.isDuration)
          .id('ImageAnimator_duration')
          .onClick((e: ClickEvent) => {
            this.isDuration = !this.isDuration;
          })
        Button('isIterations: ' + this.isIterations)
          .id('ImageAnimator_iterations')
          .onClick((e: ClickEvent) => {
            this.isIterations = !this.isIterations;
          })
      }

      Row() {
        Button('isFillMode: ' + this.isFillMode)
          .id('ImageAnimator_fillMode')
          .onClick((e: ClickEvent) => {
            this.isFillMode = !this.isFillMode;
          })
        Button('isFixedSize: ' + this.isFixedSize)
          .id('ImageAnimator_fixedSize')
          .onClick((e: ClickEvent) => {
            this.isFixedSize = !this.isFixedSize;
          })
      }

      Row() {
        Button('isMonitorInvisibleArea: ' + this.isMonitorInvisibleArea)
          .id('ImageAnimator_monitorInvisibleArea')
          .onClick((e: ClickEvent) => {
            this.isMonitorInvisibleArea = !this.isMonitorInvisibleArea;
          })
        Button('isReverse: ' + this.isReverse)
          .id('ImageAnimator_reverse')
          .onClick((e: ClickEvent) => {
            this.isReverse = !this.isReverse;
          })
      }

      Row() {
        Button('isState: ' + this.isState)
          .id('ImageAnimator_state')
          .onClick((e: ClickEvent) => {
            this.isState = !this.isState;
          })
        Button('isImages: ' + this.isImages)
          .id('ImageAnimator_images')
          .onClick((e: ClickEvent) => {
            this.isImages = !this.isImages;
          })
      }

    }
    .width('100%')
    .height('100%')
  }
}
