/**
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

import { image } from '@kit.ImageKit';

@Entry
@Component
struct ShapeNullUndefined5Test {
  private context: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(200, 200)
  @State pixelMap: image.PixelMap | undefined = undefined
  private meshArray: Array<number> = [0, 0, 100, 0, 200, 0, 0, 100, 100, 100, 200, 100, 0, 200, 100, 200, 200, 200]

  aboutToAppear(): void {
    let img: ImageBitmap = new ImageBitmap('resources/base/media/icon.png')
    this.context.drawImage(img, 0, 0, 200, 200)
    this.pixelMap = this.context.getPixelMap(0, 0, 200, 200)
  }

  build() {
    Column() {
      // ========== mesh tests ==========
      Row() {
        // Valid parameters (对照)
        Shape(this.pixelMap)
          .width(50)
          .height(50)
          .backgroundColor(Color.Grey)
          .mesh(this.meshArray, 2, 2)
          .id('shape_mesh_valid_1')

        // mesh with null
        Shape(this.pixelMap)
          .width(50)
          .height(50)
          .backgroundColor(Color.Grey)
          .mesh(null, 2, 2)
          .id('shape_mesh_null_1')

        // mesh with undefined
        Shape(this.pixelMap)
          .width(50)
          .height(50)
          .backgroundColor(Color.Grey)
          .mesh(undefined, 2, 2)
          .id('shape_mesh_undefined_1')

        // mesh with empty array
        Shape(this.pixelMap)
          .width(50)
          .height(50)
          .backgroundColor(Color.Grey)
          .mesh([], 2, 2)
          .id('shape_mesh_empty_1')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row() {
        // mesh with null
        Shape(this.pixelMap)
          .width(50)
          .height(50)
          .backgroundColor(Color.Grey)
          .mesh(this.meshArray, null, 2)
          .id('shape_mesh_null_2')

        // mesh with undefined
        Shape(this.pixelMap)
          .width(50)
          .height(50)
          .backgroundColor(Color.Grey)
          .mesh(this.meshArray, undefined, 2)
          .id('shape_mesh_undefined_2')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row() {
        // mesh with null
        Shape(this.pixelMap)
          .width(50)
          .height(50)
          .backgroundColor(Color.Grey)
          .mesh(this.meshArray, 2, null)
          .id('shape_mesh_null_3')

        // mesh with undefined
        Shape(this.pixelMap)
          .width(50)
          .height(50)
          .backgroundColor(Color.Grey)
          .mesh(this.meshArray, 2, undefined)
          .id('shape_mesh_undefined_3')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 2, right: 2, top: 2, bottom: 2 })
  }
}
