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
  DragPreviewOptions,
  DragPreviewMode,
  UniformDataType,
  DragEvent,
  CommonMethod,
  Color,
  Rectangle,
  RowOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import inspector from '@ohos.arkui.inspector'


@Entry
@Component
struct Index {
  @State dragPreviewText: string = 'hello';
  @State allowDropText: string = 'hello';

  @Builder
  dragPreviewBuilder() {
    Column() {
      Image($r('app.media.boom_once'))
        .id('preview_Image')
        .width(200)
        .height(50)
        .onFinish(() => {
          this.dragPreviewText = 'dragPreview';
        })
    }.id('preview_Column')
  }

  @Builder
  dragPreviewBuilder1() {
    Column() {
      Image($r('app.media.background'))
        .id('preview_Image')
        .width(50)
        .height(50)
    }
  }

  @State isDragPreview: boolean = true;
  @State isDragPreviewOptions: boolean = true;
  @State isAllowDrop1: boolean = true;
  @State isAllowDrop2: boolean = true;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row({ space: 5 } as RowOptions) {
        Text(this.dragPreviewText)
          .id('DC_text1')
        Text(this.allowDropText)
          .id('DC_text2')
        Button('reset')
          .id('DC_resetBtn')
          .onClick((e: ClickEvent) => {
            this.dragPreviewText = 'hello';
            this.allowDropText = 'hello';
          })
      }

      Row() {
        Image($r('app.media.startIcon'))
          .id('DC_image1')
          .width('20%')
          .draggable(true)
          .dragPreview(this.isDragPreview ? undefined : this.dragPreviewBuilder)
        Image($r('app.media.startIcon'))
          .id('DC_image2')
          .width('20%')
          .draggable(true)
          .dragPreview(this.dragPreviewBuilder1)
          .dragPreviewOptions(this.isDragPreviewOptions ? undefined :
            { mode: DragPreviewMode.ENABLE_DEFAULT_RADIUS } as DragPreviewOptions)
      }.height('15%')

      Row() {
        Row() {
        }
        .id('DC_dropRow1')
        .height('15%')
        .width('50%')
        .border({ width: 1 })
        .borderColor(Color.Red)
        .allowDrop(this.isAllowDrop1 ? undefined : [UniformDataType.TEXT] as Array<UniformDataType>)
        .onDrop((event?: DragEvent, extraParams?: string) => {
          this.allowDropText = 'allowDrop1';
        })

        Row() {
        }
        .id('DC_dropRow2')
        .height('15%')
        .width('50%')
        .border({ width: 1 })
        .borderColor(Color.Red)
        .allowDrop(this.isAllowDrop2 ? undefined : null)
        .onDrop((event?: DragEvent, extraParams?: string) => {
          this.allowDropText = 'allowDrop2';
        })
      }


      Column({ space: 5 } as ColumnOptions) {
        Row() {
          Button('btn1 : ' + this.isDragPreview)
            .id('DC_btn1')
            .onClick((e: ClickEvent) => {
              this.isDragPreview = !this.isDragPreview
            })
          Button('btn2 : ' + this.isDragPreviewOptions)
            .id('DC_btn2')
            .onClick((e: ClickEvent) => {
              this.isDragPreviewOptions = !this.isDragPreviewOptions
            })
        }

        Row() {
          Button('btn3 : ' + this.isAllowDrop1)
            .id('DC_btn3')
            .onClick((e: ClickEvent) => {
              this.isAllowDrop1 = !this.isAllowDrop1
            })
          Button('btn4 : ' + this.isAllowDrop2)
            .id('DC_btn4')
            .onClick((e: ClickEvent) => {
              this.isAllowDrop2 = !this.isAllowDrop2
            })
        }

      }
    }.width('100%')
    .height('100%')
  }
}