'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, AttributeModifier, ShapeAttribute, Shape, Text, Path, Column, Color, LineJoinStyle, LineCapStyle,
  ColumnOptions, Margin, Rect, Ellipse, Position } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class ShapeModifier1 implements AttributeModifier<ShapeAttribute>{
  applyNormalAttribute(instance: ShapeAttribute): void {

    instance.viewPort({ x: 1, y: -2, width: 100, height: 200 })

      .stroke(Color.Pink)

      // .fill(0x317AF7)

      .strokeDashOffset(15)

      .strokeDashArray([30])

      .strokeLineJoin(LineJoinStyle.Round)

      .strokeLineCap(LineCapStyle.Round)

      .strokeOpacity(0.5)

      .strokeMiterLimit(5)

      .mesh([10], 1, 1)

      .strokeWidth("20px")

      .fillOpacity(2)

      .antiAlias(true)
  }
}

@Entry
@Component
struct ShapeExample {
  @State shapeModifier: ShapeModifier1 = new ShapeModifier1()
  build() {
    Column({ space: 10 } as ColumnOptions) {
      // Text('basic').fontSize(11).fontColor(0xCCCCCC).width(320)
      // 在Shape的(-2, -2)点绘制一个 300 * 50 带边框的矩形,颜色0x317AF7,边框颜色黑色,边框宽度4,边框间隙20,向左偏移10,线条两端样式为半圆,拐角样式圆角,抗锯齿(默认开启)
      // 在Shape的(-2, 58)点绘制一个 300 * 50 带边框的椭圆,颜色0x317AF7,边框颜色黑色,边框宽度4,边框间隙20,向左偏移10,线条两端样式为半圆,拐角样式圆角,抗锯齿(默认开启)
      // 在Shape的(-2, 118)点绘制一个 300 * 10 直线路径,颜色0x317AF7,边框颜色黑色,宽度4,间隙20,向左偏移10,线条两端样式为半圆,拐角样式圆角,抗锯齿(默认开启)
      Shape() {
        Rect().width(300).height(50)
        Ellipse().width(300).height(50).offset({ x: 0, y: 60 } as Position)
        Path().width(300).height(10).commands('M0 0 L900 0').offset({ x: 0, y: 120 } as Position)
      }
      .width(350)
        .key("ShapeKey1")
        .attributeModifier(this.shapeModifier)
      // 分别在Shape的(0, 0)、(-5, -5)点绘制一个 300 * 50 带边框的矩形,可以看出之所以将视口的起始位置坐标设为负值是因为绘制的起点默认为线宽的中点位置，因此要让边框完全显示则需要让视口偏移半个线宽
      Shape() {
        Rect().width(300).height(50)
      }
      .width(350)
        .height(80)
        .viewPort({ x: 0, y: 0, width: 320, height: 70 })
        // .fill(0x317AF7)
        .stroke(Color.Black)
        .strokeWidth(10)

      Shape() {
        Rect().width(300).height(50)
      }
      .width(350)
        .height(80)
        .viewPort({ x: -5, y: -5, width: 320, height: 70 })
        // .fill(0x317AF7)
        .stroke(Color.Black)
        .strokeWidth(10)

      // Text('path').fontSize(11).fontColor(0xCCCCCC).width(320)
      // 在Shape的(0, -5)点绘制一条直线路径,颜色0xEE8443,线条宽度10,线条间隙20
      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .width(350)
        .height(20)
        .viewPort({ x: 0, y: -5, width: 300, height: 20 })
        // .stroke(0xEE8443)
        .strokeWidth(10)
        .strokeDashArray([20])
      // 在Shape的(0, -5)点绘制一条直线路径,颜色0xEE8443,线条宽度10,线条间隙20,向左偏移10
      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .width(350)
        .height(20)
        .viewPort({ x: 0, y: -5, width: 300, height: 20 })
        // .stroke(0xEE8443)
        .strokeWidth(10)
        .strokeDashArray([20])
        .strokeDashOffset(10)
      // 在Shape的(0, -5)点绘制一条直线路径,颜色0xEE8443,线条宽度10,透明度0.5
      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .width(350)
        .height(20)
        .viewPort({ x: 0, y: -5, width: 300, height: 20 })
        // .stroke(0xEE8443)
        .strokeWidth(10)
        .strokeOpacity(0.5)
      // 在Shape的(0, -5)点绘制一条直线路径,颜色0xEE8443,线条宽度10,线条间隙20,线条两端样式为半圆
      Shape() {
        Path().width(300).height(10).commands('M0 0 L900 0')
      }
      .width(350)
        .height(20)
        .viewPort({ x: 0, y: -5, width: 300, height: 20 })
        // .stroke(0xEE8443)
        .strokeWidth(10)
        .strokeDashArray([20])
        .strokeLineCap(LineCapStyle.Round)
      // 在Shape的(-80, -5)点绘制一个封闭路径,颜色0x317AF7,线条宽度10,边框颜色0xEE8443,拐角样式锐角（默认值）
      Shape() {
        Path().width(200).height(60).commands('M0 0 L400 0 L400 150 Z')
      }
      .width(300)
        .height(200)
        .viewPort({ x: -20, y: -5, width: 310, height: 90 })
        // .fill(0x317AF7)
        // .stroke(0xEE8443)
        .strokeWidth(10)
        .strokeLineJoin(LineJoinStyle.Miter)
        .strokeMiterLimit(5)
    }.width('100%').margin({ top: 15 } as Margin)
  }
}
