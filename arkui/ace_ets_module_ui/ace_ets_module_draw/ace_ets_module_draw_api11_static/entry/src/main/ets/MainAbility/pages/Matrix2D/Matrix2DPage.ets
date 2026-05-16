'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  RenderingContextSettings,
  CanvasRenderingContext2D,
  CanvasRenderingContext2D,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Canvas,
  Flex,
  Matrix2D
} from '@ohos.arkui.component';

@Entry
@Component
struct Matrix2DMultiplyRotate {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      // Multiply
      Canvas(this.context)
        .width('200vp')
        .height('100vp')
        .backgroundColor('#ffff00')
        .onReady(() => {
          let matrix: Matrix2D = new Matrix2D()
          matrix.scaleX = 1
          matrix.scaleY = 1
          matrix.rotateX = 0.1
          matrix.rotateY = 0.8
          matrix.translateX = 2
          matrix.translateY = 2
          this.context.setTransform(matrix)
          this.context.fillRect(10, 10, 20, 20)

          let other: Matrix2D = new Matrix2D()
          other.scaleX = 2
          other.scaleY = 2
          other.rotateX = 0.2
          other.rotateY = 0.4
          other.translateX = 10
          other.translateY = 10


          this.context.fillRect(50, 10, 20, 20)


          this.context.fillRect(90, 10, 20, 20)
        })
        .id('Matrix2DMultiplyCanvas')

      // Rotate
      Canvas(this.context2)
        .width('200vp')
        .height('100vp')
        .backgroundColor('#ffff00')
        .onReady(() => {
          this.context2.fillRect(50, 50, 20, 20)

          let matrix: Matrix2D = new Matrix2D()
          matrix.scaleX = 1
          matrix.scaleY = 1
          matrix.rotateX = -0.5
          matrix.rotateY = 0.5
          matrix.translateX = 10
          matrix.translateY = 10
          matrix.rotate(5, 5)
          this.context2.setTransform(matrix)
          this.context2.fillRect(100, 100, 20, 20)
        })
        .id('Matrix2DRotateCanvas')
    }
    .width('100%')
    .height('100%')
  }
}

