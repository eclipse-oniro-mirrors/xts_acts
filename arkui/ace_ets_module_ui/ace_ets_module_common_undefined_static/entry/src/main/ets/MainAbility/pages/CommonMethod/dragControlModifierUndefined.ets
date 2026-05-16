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
  RowOptions,
  AttributeModifier,
  ImageAttribute,
  RowAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import inspector from '@ohos.arkui.inspector'



@Observed
export class MyModifier1 implements AttributeModifier<RowAttribute> {
  public isAllowDrop1: boolean = true;

  applyNormalAttribute(instance: RowAttribute): void {
    instance
      .allowDrop(this.isAllowDrop1 ? undefined : [UniformDataType.TEXT] as Array<UniformDataType>)
  }
}

@Observed
export class MyModifier2 implements AttributeModifier<RowAttribute> {
  public isAllowDrop2: boolean = true;

  applyNormalAttribute(instance: RowAttribute): void {
    instance
      .allowDrop(this.isAllowDrop2 ? undefined : null)
  }
}

@Observed
export class MyModifier3 implements AttributeModifier<ImageAttribute> {
  public isDragPreviewOptions: boolean = true;

  applyNormalAttribute(instance: ImageAttribute): void {
    instance
      .dragPreviewOptions(this.isDragPreviewOptions ? undefined :
        { mode: DragPreviewMode.ENABLE_DEFAULT_RADIUS } as DragPreviewOptions)
  }
}

@Entry
@Component
struct Index {
  @State myModifier1: MyModifier1 = new MyModifier1();
  @State myModifier2: MyModifier2 = new MyModifier2();
  @State myModifier3: MyModifier3 = new MyModifier3();
  @State allowDropText : string = 'hello';
  @Builder dragPreviewBuilder1() {
  Column() {
    Image($r('app.media.background'))
      .id('preview_Image')
      .width(50)
      .height(50)
  }
}
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row({ space: 5 } as RowOptions) {
        Text(this.allowDropText)
          .id('DCM_text1')
        Button('reset')
          .id('DCM_resetBtn')
          .onClick((e: ClickEvent) => {
            this.allowDropText = 'hello';
          })
      }

      Row() {
        Image($r('app.media.startIcon'))
          .id('DCM_image1')
          .width('20%')
          .draggable(true)
          .dragPreview(this.dragPreviewBuilder1)
          .attributeModifier(this.myModifier3)
      }.height('15%')

      Row() {
        Row() {
        }
        .id('DCM_dropRow1')
        .height('15%')
        .width('50%')
        .border({ width: 1 })
        .borderColor(Color.Red)
        .attributeModifier(this.myModifier1)
        .onDrop((event?: DragEvent, extraParams?: string) => {
          this.allowDropText = 'allowDrop1';
        })

        Row() {
        }
        .id('DCM_dropRow2')
        .height('15%')
        .width('50%')
        .border({ width: 1 })
        .borderColor(Color.Red)
        .attributeModifier(this.myModifier2)
        .onDrop((event?: DragEvent, extraParams?: string) => {
          this.allowDropText = 'allowDrop2';
        })
      }

      Column({ space: 5 } as ColumnOptions) {
        Button('btn1 : ' + this.myModifier1.isAllowDrop1)
          .id('DCM_btn1')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isAllowDrop1 = !this.myModifier1.isAllowDrop1
          })
        Button('btn2 : ' + this.myModifier2.isAllowDrop2)
          .id('DCM_btn2')
          .onClick((e: ClickEvent) => {
            this.myModifier2.isAllowDrop2 = !this.myModifier2.isAllowDrop2
          })
        Button('btn3 : ' + this.myModifier3.isDragPreviewOptions)
          .id('DCM_btn3')
          .onClick((e: ClickEvent) => {
            this.myModifier3.isDragPreviewOptions = !this.myModifier3.isDragPreviewOptions
          })
      }
    }.width('100%')
    .height('100%')
  }
}