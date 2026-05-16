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
struct ShapeNullUndefined4Test {
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
      // ========== strokeDashArray tests ==========
      Row() {
        // Valid parameters (对照)
        Shape() {
          Path().width(80).height(40).commands('M0 20 L80 20')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeDashArray([10, 5])
          .id('shape_strokeDashArray_valid')

        // strokeDashArray with null
        Shape() {
          Path().width(80).height(40).commands('M0 20 L80 20')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeDashArray(null)
          .id('shape_strokeDashArray_null')

        // strokeDashArray with undefined
        Shape() {
          Path().width(80).height(40).commands('M0 20 L80 20')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeDashArray(undefined)
          .id('shape_strokeDashArray_undefined')

        // strokeDashArray with empty array
        Shape() {
          Path().width(80).height(40).commands('M0 20 L80 20')
        }
          .width(80)
          .height(40)
          .viewPort({ x: 0, y: 0, width: 80, height: 40 })
          .stroke(Color.Green)
          .strokeWidth(2)
          .strokeDashArray([])
          .id('shape_strokeDashArray_empty')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== viewPort tests ==========
      Row() {
        // Valid parameters (对照)
        Shape() {
          Rect().width(80).height(80)
        }
          .width(80)
          .height(80)
          .viewPort({ x: 0, y: 0, width: 80, height: 80 })
          .fill(Color.Red)
          .id('shape_viewPort_valid')

        // viewPort with null
        Shape() {
          Rect().width(80).height(80)
        }
          .width(80)
          .height(80)
          .viewPort(null)
          .fill(Color.Red)
          .id('shape_viewPort_null')

        // viewPort with undefined
        Shape() {
          Rect().width(80).height(80)
        }
          .width(80)
          .height(80)
          .viewPort(undefined)
          .fill(Color.Red)
          .id('shape_viewPort_undefined')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 5, right: 5, top: 5, bottom: 5 })
  }
}
