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
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Shape,
  Margin,
  Rect,
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
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import image from '@ohos.multimedia.image'

@Entry
@Component
struct ShapeEventPage {
  private context: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(200, 200)
  private meshArray: Array<double> = [0, 0, 50, 0, 410, 0, 0, 180, 50, 180, 410, 180, 0, 360, 50, 360, 410, 360]
  @State pixelMap: image.PixelMap | undefined = undefined
  @State isValue: boolean = true
  @State isStroke: boolean = true;
  @State isAntiAlias: boolean = true;
  @State isStrokeDashOffset: boolean = true;
  @State isStrokeWidth: boolean = true;
  @State isStrokeMiterLimit: boolean = true;
  @State isStrokeLineCap: boolean = true;
  @State isStrokeDashArray: Array<Length> | undefined = undefined;
  @State isStrokeOpacity: boolean = true;
  @State isStrokeLineJoin: boolean = true;
  @State isFill: boolean = true;
  @State isFillOpacity: boolean = true;
  @State isViewPort: boolean = true;
  @State isShow: boolean = true;

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
    Column({space:3} as ColumnOptions) {
      Row() {
        Button('isStroke : ' + this.isStroke)
          .id('Shape_stroke')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isStroke = !this.isStroke;
          })
        Button('isAntiAlias : ' + this.isAntiAlias)
          .id('Shape_antiAlias')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isAntiAlias = !this.isAntiAlias;
          })
      }

      Row() {
        Button('isStrokeDashOffset : ' + this.isStrokeDashOffset)
          .id('Shape_strokeDashOffset')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isStrokeDashOffset = !this.isStrokeDashOffset;
          })
        Button('isStrokeWidth : ' + this.isStrokeWidth)
          .id('Shape_strokeWidth')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isStrokeWidth = !this.isStrokeWidth;
          })
      }

      Row() {
        Button('isStrokeMiterLimit : ' + this.isStrokeMiterLimit)
          .id('Shape_strokeMiterLimit')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isStrokeMiterLimit = !this.isStrokeMiterLimit;
          })
        Button('isStrokeLineCap : ' + this.isStrokeLineCap)
          .id('Shape_strokeLineCap')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isStrokeLineCap = !this.isStrokeLineCap;
          })
      }

      Row() {
        Button('isStrokeDashArray : ' + this.isStrokeDashArray)
          .id('Shape_strokeDashArray')
          .height(10)
          .onClick((e: ClickEvent) => {
            if (this.isStrokeDashArray == undefined) {
              this.isStrokeDashArray = [20];
            } else {
              this.isStrokeDashArray = undefined;
            }
          })
        Button('isStrokeOpacity : ' + this.isStrokeOpacity)
          .id('Shape_strokeOpacity')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isStrokeOpacity = !this.isStrokeOpacity;
          })
      }

      Row() {
        Button('isStrokeLineJoin : ' + this.isStrokeLineJoin)
          .id('Shape_strokeLineJoin')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isStrokeLineJoin = !this.isStrokeLineJoin;
          })
        Button('isFill : ' + this.isFill)
          .id('Shape_fill')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isFill = !this.isFill;
          })
      }

      Row() {
        Button('isFillOpacity : ' + this.isFillOpacity)
          .id('Shape_fillOpacity')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isFillOpacity = !this.isFillOpacity;
          })
        Button('isValue: ' + this.isValue)
          .id('Shape_mesh')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isValue = !this.isValue
          })
      }

      Row() {
        Button('isViewPort: ' + this.isViewPort)
          .id('Shape_viewPort')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isViewPort = !this.isViewPort
          })
        Button('isShow: ' + this.isShow)
          .id('Shape_show')
          .height(10)
          .onClick((e: ClickEvent) => {
            this.isShow = !this.isShow
          })
      }
      Shape() {
        Path().width(200).height(30).commands('M0 0 L400 0 L400 150 Z')
      }
      .id('Shape')
      .stroke(this.isStroke ? '#2787D9' : undefined)
      .antiAlias(this.isAntiAlias ? false : undefined)
      .strokeDashOffset(this.isStrokeDashOffset ? 100.0 : undefined)
      .strokeWidth(this.isStrokeWidth ? '8px' : undefined)
      .strokeMiterLimit(this.isStrokeMiterLimit ? 14.0 : undefined)
      .strokeLineCap(this.isStrokeLineCap ? LineCapStyle.Round : undefined)
      .strokeDashArray(this.isStrokeDashArray)
      .strokeOpacity(this.isStrokeOpacity ? 0.1 : undefined)
      .strokeLineJoin(this.isStrokeLineJoin ? LineJoinStyle.Round : undefined)
      .fill(this.isFill ? '#ffbbf17f' : undefined)
      .fillOpacity(this.isFillOpacity ? 0.1 : undefined)

      if (this.isShow) {
        Shape() {
          Rect().width('100%').height('100%').fill('#BDDB69')
          Circle({ width: 75, height: 75 }).fill('#E87361')
        }
        .id('Shape2')
        .viewPort(this.isViewPort ? this.viewPort : undefined)
        .width('5%')
        .height('5%')
        .backgroundColor('#F5DC62')
      }

      Row() {
        Shape(this.pixelMap)
          .id('Shape3')
          .backgroundColor(Color.Grey)
          .width('5%')
          .height('5%')
          .mesh(this.meshArray, this.isValue ? 2 : undefined, 2)
      }

      Row() {
        Shape(this.pixelMap)
          .id('Shape4')
          .backgroundColor(Color.Grey)
          .width('5%')
          .height('5%')
          .mesh(this.meshArray, 2, this.isValue ? 2 : undefined)
      }

    }.width('100%').height('100%')
  }
}