'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Image,
  $r,
  Color,
  CopyOptions,
  DynamicRangeMode,
  ImageInterpolation,
  ImageFit,
  ImageRepeat,
  ImageRotateOrientation,
  ImageRenderMode,
  ResizableOptions,
  ClickEvent,
  Blank,
  ColumnOptions
} from '@ohos.arkui.component'
import { LengthMetrics } from '@kit.ArkUI'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ImageEventPage {
  @State isAutoResize: boolean = true;
  @State isCopyOption: boolean = true;
  @State isDraggable: boolean = true;
  @State isDynamicRangeMode: boolean = true;
  @State isEnableAnalyzer: boolean = true;
  @State isFillColor: boolean = true;
  @State isInterpolation: boolean = true;
  @State isObjectFit: boolean = true;
  @State isObjectRepeat: boolean = true;
  @State isOrientation: boolean = true;
  @State isPrivacySensitive: boolean = true;
  @State isRenderMode: boolean = true;
  @State isResizable: boolean = true;
  @State isSyncLoad: boolean = true;

  build() {
    Column() {
      Image($r('app.media.startIcon'))
        .autoResize(this.isAutoResize ? true : undefined)
        .copyOption(this.isCopyOption ? CopyOptions.InApp : undefined)
        .draggable(this.isDraggable ? false : undefined)
        .dynamicRangeMode(this.isDynamicRangeMode ? DynamicRangeMode.HIGH : undefined)
        .enableAnalyzer(this.isEnableAnalyzer ? true : undefined)
        .fillColor(this.isFillColor ? 0xCCCCCC : undefined)
        .interpolation(this.isInterpolation ? ImageInterpolation.Medium : undefined)
        .objectFit(this.isObjectFit ? ImageFit.Fill : undefined)
        .objectRepeat(this.isObjectRepeat ? ImageRepeat.X : undefined)
        .orientation(this.isOrientation ? ImageRotateOrientation.RIGHT : undefined)
        .privacySensitive(this.isPrivacySensitive ? true : undefined)
        .renderMode(this.isRenderMode ? ImageRenderMode.Template : undefined)
        .resizable(this.isResizable ? {
          slice: {
            top: 8,
            bottom: 8,
            left: 8,
            right: 8
          }
        } as ResizableOptions : undefined)
        .syncLoad(this.isSyncLoad ? true : undefined)
        .height('10%')
        .id('MyImage')
      Image($r('app.media.startIcon'))
        .height('10%')
        .id('MyImage1')
      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isAutoResize: ' + this.isAutoResize)
          .id('Image_AutoResize')
          .onClick((e: ClickEvent) => {
            this.isAutoResize = !this.isAutoResize
          })
          .height(20)
        Button('isCopyOption: ' + this.isCopyOption)
          .id('Image_CopyOption')
          .onClick((e: ClickEvent) => {
            this.isCopyOption = !this.isCopyOption
          })
          .height(20)
        Button('isDraggable: ' + this.isDraggable)
          .id('Image_Draggable')
          .onClick((e: ClickEvent) => {
            this.isDraggable = !this.isDraggable
          })
          .height(20)
        Button('isDynamicRangeMode: ' + this.isDynamicRangeMode)
          .id('Image_DynamicRangeMode')
          .onClick((e: ClickEvent) => {
            this.isDynamicRangeMode = !this.isDynamicRangeMode
          })
          .height(20)
        Button('isEnableAnalyzer: ' + this.isEnableAnalyzer)
          .id('Image_EnableAnalyzer')
          .onClick((e: ClickEvent) => {
            this.isEnableAnalyzer = !this.isEnableAnalyzer
          })
          .height(20)
        Button('isFillColor: ' + this.isFillColor)
          .id('Image_FillColor')
          .onClick((e: ClickEvent) => {
            this.isFillColor = !this.isFillColor
          })
          .height(20)
        Button('isInterpolation: ' + this.isInterpolation)
          .id('Image_Interpolation')
          .onClick((e: ClickEvent) => {
            this.isInterpolation = !this.isInterpolation
          })
          .height(20)
        Button('isObjectFit: ' + this.isObjectFit)
          .id('Image_ObjectFit')
          .onClick((e: ClickEvent) => {
            this.isObjectFit = !this.isObjectFit
          })
          .height(20)
        Button('isObjectRepeat: ' + this.isObjectRepeat)
          .id('Image_ObjectRepeat')
          .onClick((e: ClickEvent) => {
            this.isObjectRepeat = !this.isObjectRepeat
          })
          .height(20)
        Button('isOrientation: ' + this.isOrientation)
          .id('Image_Orientation')
          .onClick((e: ClickEvent) => {
            this.isOrientation = !this.isOrientation
          })
          .height(20)
        Button('isPrivacySensitive: ' + this.isPrivacySensitive)
          .id('Image_PrivacySensitive')
          .onClick((e: ClickEvent) => {
            this.isPrivacySensitive = !this.isPrivacySensitive
          })
          .height(20)
        Button('isRenderMode: ' + this.isRenderMode)
          .id('Image_RenderMode')
          .onClick((e: ClickEvent) => {
            this.isRenderMode = !this.isRenderMode
          })
          .height(20)
        Button('isResizable: ' + this.isResizable)
          .id('Image_Resizable')
          .onClick((e: ClickEvent) => {
            this.isResizable = !this.isResizable
          })
          .height(20)
        Button('isSyncLoad: ' + this.isSyncLoad)
          .id('Image_SyncLoad')
          .onClick((e: ClickEvent) => {
            this.isSyncLoad = !this.isSyncLoad
          })
          .height(20)

      }
    }

  }
}