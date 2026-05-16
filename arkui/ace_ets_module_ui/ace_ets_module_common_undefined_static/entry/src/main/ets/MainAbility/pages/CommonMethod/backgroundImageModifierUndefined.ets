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
  RowOptions,
  ColumnAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'


@Observed
export class MyModifier2 implements AttributeModifier<ColumnAttribute> {
  public isBgImage2: boolean = true;

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance
      .backgroundImage(this.isBgImage2 ? undefined : $r('app.media.startIcon'),
        { repeat: ImageRepeat.X } as BackgroundImageOptions)
  }
}

@Observed
export class MyModifier3 implements AttributeModifier<ColumnAttribute> {
  public isBgImagePosition: boolean = true;

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance
      .backgroundImagePosition(this.isBgImagePosition ? undefined : { x: '-50px' } as Position)
  }
}

@Entry
@Component
struct Index {
  @State myModifier2: MyModifier2 = new MyModifier2();
  @State myModifier3: MyModifier3 = new MyModifier3();

  build() {
    Column({ space: 5 } as ColumnOptions) {

      Column() {
      }
      .id('bgM_column2')
      .width('100%')
      .height('10%')
      .border({ width: 1 } as BorderOptions)
      .attributeModifier(this.myModifier2)

      Column() {
      }
      .id('bgM_column3')
      .width('100%')
      .height('10%')
      .border({ width: 1 } as BorderOptions)
      .backgroundImage($r('app.media.startIcon'),
        { repeat: ImageRepeat.X } as BackgroundImageOptions)
      .attributeModifier(this.myModifier3)

      Column() {
        Button('Btn2 : ' + this.myModifier2.isBgImage2)
          .id('bgM_Btn2')
          .onClick((e: ClickEvent) => {
            this.myModifier2.isBgImage2 = !this.myModifier2.isBgImage2
          })
        Button('Btn3 : ' + this.myModifier3.isBgImagePosition)
          .id('bgM_Btn3')
          .onClick((e: ClickEvent) => {
            this.myModifier3.isBgImagePosition = !this.myModifier3.isBgImagePosition
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}

