'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Shape,
  Margin,
  Rect,
  ColumnOptions,
  Ellipse,
  Path,
  Color,
  LineCapStyle,
  LineJoinStyle,
  Row,
  Blank,
  Length,
  OffscreenCanvasRenderingContext2D,
  ImageBitmap,
  $r,
  ViewportRect,
  Offset,
  Circle,
  AttributeModifier,
  ShapeAttribute,
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import image from '@ohos.multimedia.image'

@Observed
export class MyPointModifier implements AttributeModifier<ShapeAttribute> {
  public isStroke: boolean = true;
  public isAntiAlias: boolean = true;
  public isStrokeDashOffset: boolean = true;
  public isStrokeWidth: boolean = true;
  public isStrokeMiterLimit: boolean = true;
  public isStrokeLineCap: boolean = true;
  public isStrokeDashArray: boolean = true;
  public isStrokeOpacity: boolean = true;
  public isStrokeLineJoin: boolean = true;
  public isFill: boolean = true;
  public isFillOpacity: boolean = true;

  applyNormalAttribute(instance: ShapeAttribute): void {
    if (this.isStrokeDashArray) {
      instance.strokeDashArray([20])
    } else {
      instance.strokeDashArray(undefined)
    }
    instance
      .stroke(this.isStroke ? '#2787D9' : undefined)
      .antiAlias(this.isAntiAlias ? false : undefined)
      .strokeDashOffset(this.isStrokeDashOffset ? 100.0 : undefined)
      .strokeWidth(this.isStrokeWidth ? '8px' : undefined)
      .strokeMiterLimit(this.isStrokeMiterLimit ? 14.0 : undefined)
      .strokeLineCap(this.isStrokeLineCap ? LineCapStyle.Round : undefined)
      .strokeOpacity(this.isStrokeOpacity ? 0.1 : undefined)
      .strokeLineJoin(this.isStrokeLineJoin ? LineJoinStyle.Round : undefined)
      .fill(this.isFill ? '#ffbbf17f' : undefined)
      .fillOpacity(this.isFillOpacity ? 0.1 : undefined)
      .width(100)
      .height(100)
  }
}

@Observed
export class MyPointModifier2 implements AttributeModifier<ShapeAttribute> {
  public isViewPort: boolean = true

  applyNormalAttribute(instance: ShapeAttribute): void {
    if (this.isViewPort) {
      instance.viewPort({
        x: 1,
        y: -2,
        width: 100,
        height: 200
      })
    } else {
      instance.viewPort(undefined)
    }
    instance.width(100)
    instance.height(100)
    instance.backgroundColor(Color.Grey)
  }
}

@Observed
export class MyPointModifier3 implements AttributeModifier<ShapeAttribute> {
  private meshArray: Array<double> = [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360]
  public isValue: boolean = true

  applyNormalAttribute(instance: ShapeAttribute): void {
    instance.mesh(this.meshArray, this.isValue ? 2 : undefined, 2)
    instance.backgroundColor(Color.Grey)
    instance.width(100)
    instance.height(100)
  }
}

@Observed
export class MyPointModifier4 implements AttributeModifier<ShapeAttribute> {
  private meshArray: Array<double> = [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360]
  public isValue: boolean = true

  applyNormalAttribute(instance: ShapeAttribute): void {
    instance.mesh(this.meshArray, 2, this.isValue ? 2 : undefined)
    instance.backgroundColor(Color.Grey)
    instance.width(100)
    instance.height(100)
  }
}

@Entry
@Component
struct ShapeEventPage {
  private context: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(200, 200)
  private meshArray: Array<double> = [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360]
  @State pixelMap: image.PixelMap | undefined = undefined
  @State isShow: boolean = true;
  @State modifier: MyPointModifier = new MyPointModifier()
  @State modifier2: MyPointModifier2 = new MyPointModifier2()
  @State modifier3: MyPointModifier3 = new MyPointModifier3()
  @State modifier4: MyPointModifier4 = new MyPointModifier4()

  aboutToAppear(): void {
    let img: ImageBitmap = new ImageBitmap('resources/base/media/startIcon.png')
    this.context.drawImage(img, 0, 0, 200, 200)
    this.pixelMap = this.context.getPixelMap(0, 0, 200, 200)
  }

  viewPort: ViewportRect = {
    x: 1,
    y: -2,
    width: 100,
    height: 200
  } as ViewportRect;

  build() {
    Column({space:5} as ColumnOptions) {
      Row() {
        Button('isStroke : ' + this.modifier.isStroke)
          .id('ShapeM_stroke')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isStroke = !this.modifier.isStroke;
          })
        Button('isAntiAlias : ' + this.modifier.isAntiAlias)
          .id('ShapeM_antiAlias')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isAntiAlias = !this.modifier.isAntiAlias;
          })
      }

      Row() {
        Button('isStrokeDashOffset : ' + this.modifier.isStrokeDashOffset)
          .id('ShapeM_strokeDashOffset')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isStrokeDashOffset = !this.modifier.isStrokeDashOffset;
          })
        Button('isStrokeWidth : ' + this.modifier.isStrokeWidth)
          .id('ShapeM_strokeWidth')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isStrokeWidth = !this.modifier.isStrokeWidth;
          })
      }

      Row() {
        Button('isStrokeMiterLimit : ' + this.modifier.isStrokeMiterLimit)
          .id('ShapeM_strokeMiterLimit')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isStrokeMiterLimit = !this.modifier.isStrokeMiterLimit;
          })
        Button('isStrokeLineCap : ' + this.modifier.isStrokeLineCap)
          .id('ShapeM_strokeLineCap')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isStrokeLineCap = !this.modifier.isStrokeLineCap;
          })
      }

      Row() {
        Button('isStrokeDashArray : ' + this.modifier.isStrokeDashArray)
          .id('ShapeM_strokeDashArray')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isStrokeDashArray = !this.modifier.isStrokeDashArray;
          })
        Button('isStrokeOpacity : ' + this.modifier.isStrokeOpacity)
          .id('ShapeM_strokeOpacity')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isStrokeOpacity = !this.modifier.isStrokeOpacity;
          })
      }

      Row() {
        Button('isStrokeLineJoin : ' + this.modifier.isStrokeLineJoin)
          .id('ShapeM_strokeLineJoin')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isStrokeLineJoin = !this.modifier.isStrokeLineJoin;
          })
        Button('isFill : ' + this.modifier.isFill)
          .id('ShapeM_fill')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isFill = !this.modifier.isFill;
          })
      }

      Row() {
        Button('isFillOpacity : ' + this.modifier.isFillOpacity)
          .id('ShapeM_fillOpacity')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier.isFillOpacity = !this.modifier.isFillOpacity;
          })
        Button('isValue: ' + this.modifier3.isValue)
          .id('ShapeM3_mesh')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier3.isValue = !this.modifier3.isValue
          })
        Button('isValue: ' + this.modifier4.isValue)
          .id('ShapeM4_mesh')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier4.isValue = !this.modifier4.isValue
          })
      }

      Row() {
        Button('isViewPort: ' + this.modifier2.isViewPort)
          .id('ShapeM_viewPort')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.modifier2.isViewPort = !this.modifier2.isViewPort
          })
        Button('isShow: ' + this.isShow) //是否创建组件
          .id('ShapeM_show')
          .height(15)
          .onClick((e: ClickEvent) => {
            this.isShow = !this.isShow
          })
      }
      Shape() {
        Path().width(200).height(30).commands('M0 0 L400 0 L400 150 Z')
      }
      .id('ShapeM')
      .attributeModifier(this.modifier)

      if (this.isShow) {
        Shape() {
          Rect().width('100%').height('100%').fill('#BDDB69')
          Circle({ width: 75, height: 75 }).fill('#E87361')
        }
        .id('ShapeM2')
        .attributeModifier(this.modifier2)
        .width('5%')
        .height('5%')
        .backgroundColor('#F5DC62')
      }

      Row() {
        Shape(this.pixelMap)
          .id('ShapeM3')
          .backgroundColor(Color.Grey)
          .width('5%')
          .height('5%')
          .attributeModifier(this.modifier3)
      }

      Row() {
        Shape(this.pixelMap)
          .id('ShapeM4')
          .backgroundColor(Color.Grey)
          .width('5%')
          .height('5%')
          .attributeModifier(this.modifier4)
      }


    }.width('100%').height('100%')
  }
}