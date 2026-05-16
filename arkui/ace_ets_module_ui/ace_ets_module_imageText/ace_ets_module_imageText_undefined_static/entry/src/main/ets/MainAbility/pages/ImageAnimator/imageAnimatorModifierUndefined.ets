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
  ImageFrameInfo,
  ImageAnimatorAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyPointModifier implements AttributeModifier<ImageAnimatorAttribute> {
  public isDuration: boolean = true;
  public isIterations: boolean = true;
  public isFillMode: boolean = true;
  public isFixedSize: boolean = true;
  public isMonitorInvisibleArea: boolean = true;
  public isReverse: boolean = true;
  public isState: boolean = true;
  public isImages: boolean = true;

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance
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
  }
}

@Entry
@Component
struct ImageAnimatorExample {
  scroller: Scroller = new Scroller();
  @State modifier: MyPointModifier = new MyPointModifier()

  build() {
    Column() {
      ImageAnimator()
        .id('ImageAnimatorM')
        .width(200)
        .height(150)
        .attributeModifier(this.modifier)

      Row() {
        Button('isDuration: ' + this.modifier.isDuration)
          .id('ImageAnimatorM_duration')
          .onClick((e: ClickEvent) => {
            this.modifier.isDuration = !this.modifier.isDuration;
          })
        Button('isIterations: ' + this.modifier.isIterations)
          .id('ImageAnimatorM_iterations')
          .onClick((e: ClickEvent) => {
            this.modifier.isIterations = !this.modifier.isIterations;
          })
      }

      Row() {
        Button('isFillMode: ' + this.modifier.isFillMode)
          .id('ImageAnimatorM_fillMode')
          .onClick((e: ClickEvent) => {
            this.modifier.isFillMode = !this.modifier.isFillMode;
          })
        Button('isFixedSize: ' + this.modifier.isFixedSize)
          .id('ImageAnimatorM_fixedSize')
          .onClick((e: ClickEvent) => {
            this.modifier.isFixedSize = !this.modifier.isFixedSize;
          })
      }

      Row() {
        Button('isMonitorInvisibleArea: ' + this.modifier.isMonitorInvisibleArea)
          .id('ImageAnimatorM_monitorInvisibleArea')
          .onClick((e: ClickEvent) => {
            this.modifier.isMonitorInvisibleArea = !this.modifier.isMonitorInvisibleArea;
          })
        Button('isReverse: ' + this.modifier.isReverse)
          .id('ImageAnimatorM_reverse')
          .onClick((e: ClickEvent) => {
            this.modifier.isReverse = !this.modifier.isReverse;
          })
      }

      Row() {
        Button('isState: ' + this.modifier.isState)
          .id('ImageAnimatorM_state')
          .onClick((e: ClickEvent) => {
            this.modifier.isState = !this.modifier.isState;
          })
        Button('isImages: ' + this.modifier.isImages)
          .id('ImageAnimatorM_images')
          .onClick((e: ClickEvent) => {
            this.modifier.isImages = !this.modifier.isImages;
          })
      }

    }
    .width('100%')
    .height('100%')
  }
}
