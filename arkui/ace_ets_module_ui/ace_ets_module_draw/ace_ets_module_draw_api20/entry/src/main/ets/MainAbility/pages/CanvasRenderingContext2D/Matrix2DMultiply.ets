/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

@Entry
@Component
struct Matrix2DMultiply {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Column() {
      Canvas(this.context)
        .id('CanvasMatrix2DMultiply1')
        .width(100)
        .height(100)
        .backgroundColor('#ffff00')
        .onReady(() => {
          let other: Matrix2D = new Matrix2D()
          other.scaleX = 2
          other.scaleY = 2
          other.rotateX = 0
          other.rotateY = 0
          other.translateX = 10
          other.translateY = 10
          other.multiply(other)
        })
    }
    .width('100%')

  }
}