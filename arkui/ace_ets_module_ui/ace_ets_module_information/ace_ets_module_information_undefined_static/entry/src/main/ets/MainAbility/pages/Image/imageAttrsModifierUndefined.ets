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
  ColumnOptions,
  AttributeModifier,
  ImageAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ImageAttribute> {
  public isAutoResize: boolean = true;
  public isCopyOption: boolean = true;
  public isDraggable: boolean = true;
  public isDynamicRangeMode: boolean = true;
  public isEnableAnalyzer: boolean = true;
  public isFillColor: boolean = true;
  public isInterpolation: boolean = true;
  public isObjectFit: boolean = true;
  public isObjectRepeat: boolean = true;
  public isOrientation: boolean = true;
  public isPrivacySensitive: boolean = true;
  public isRenderMode: boolean = true;
  public isResizable: boolean = true;
  public isSyncLoad: boolean = true;

  applyNormalAttribute(instance: ImageAttribute): void {
    instance
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
  }
}

@Entry
@Component
struct ImageEventPage {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Image($r('app.media.startIcon'))
        .height('10%')
        .id('MyImageAttributeModifier')
        .attributeModifier(this.myModifier)
      Blank().height(5)
      Column({ space: 5 } as ColumnOptions) {
        Button('isAutoResize: ' + this.myModifier.isAutoResize)
          .id('Image_AutoResize')
          .onClick((e: ClickEvent) => {
            this.myModifier.isAutoResize = !this.myModifier.isAutoResize
          })
          .height(20)
        Button('isCopyOption: ' + this.myModifier.isCopyOption)
          .id('Image_CopyOption')
          .onClick((e: ClickEvent) => {
            this.myModifier.isCopyOption = !this.myModifier.isCopyOption
          })
          .height(20)
        Button('isDraggable: ' + this.myModifier.isDraggable)
          .id('Image_Draggable')
          .onClick((e: ClickEvent) => {
            this.myModifier.isDraggable = !this.myModifier.isDraggable
          })
          .height(20)
        Button('isDynamicRangeMode: ' + this.myModifier.isDynamicRangeMode)
          .id('Image_DynamicRangeMode')
          .onClick((e: ClickEvent) => {
            this.myModifier.isDynamicRangeMode = !this.myModifier.isDynamicRangeMode
          })
          .height(20)
        Button('isEnableAnalyzer: ' + this.myModifier.isEnableAnalyzer)
          .id('Image_EnableAnalyzer')
          .onClick((e: ClickEvent) => {
            this.myModifier.isEnableAnalyzer = !this.myModifier.isEnableAnalyzer
          })
          .height(20)
        Button('isFillColor: ' + this.myModifier.isFillColor)
          .id('Image_FillColor')
          .onClick((e: ClickEvent) => {
            this.myModifier.isFillColor = !this.myModifier.isFillColor
          })
          .height(20)
        Button('isInterpolation: ' + this.myModifier.isInterpolation)
          .id('Image_Interpolation')
          .onClick((e: ClickEvent) => {
            this.myModifier.isInterpolation = !this.myModifier.isInterpolation
          })
          .height(20)
        Button('isObjectFit: ' + this.myModifier.isObjectFit)
          .id('Image_ObjectFit')
          .onClick((e: ClickEvent) => {
            this.myModifier.isObjectFit = !this.myModifier.isObjectFit
          })
          .height(20)
        Button('isObjectRepeat: ' + this.myModifier.isObjectRepeat)
          .id('Image_ObjectRepeat')
          .onClick((e: ClickEvent) => {
            this.myModifier.isObjectRepeat = !this.myModifier.isObjectRepeat
          })
          .height(20)
        Button('isOrientation: ' + this.myModifier.isOrientation)
          .id('Image_Orientation')
          .onClick((e: ClickEvent) => {
            this.myModifier.isOrientation = !this.myModifier.isOrientation
          })
          .height(20)
        Button('isPrivacySensitive: ' + this.myModifier.isPrivacySensitive)
          .id('Image_PrivacySensitive')
          .onClick((e: ClickEvent) => {
            this.myModifier.isPrivacySensitive = !this.myModifier.isPrivacySensitive
          })
          .height(20)
        Button('isRenderMode: ' + this.myModifier.isRenderMode)
          .id('Image_RenderMode')
          .onClick((e: ClickEvent) => {
            this.myModifier.isRenderMode = !this.myModifier.isRenderMode
          })
          .height(20)
        Button('isResizable: ' + this.myModifier.isResizable)
          .id('Image_Resizable')
          .onClick((e: ClickEvent) => {
            this.myModifier.isResizable = !this.myModifier.isResizable
          })
          .height(20)
        Button('isSyncLoad: ' + this.myModifier.isSyncLoad)
          .id('Image_SyncLoad')
          .onClick((e: ClickEvent) => {
            this.myModifier.isSyncLoad = !this.myModifier.isSyncLoad
          })
          .height(20)

      }
    }

  }
}