/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import matrix4 from '@ohos.matrix4';

@Entry
@Component
struct ImageMatrixPage {
  private matrix2 = matrix4.identity()
    .translate({ x: 10, y: 10 })
    .scale({ x: 5, y: 5 })
    .rotate({
      x: 2,
      y: 0.5,
      z: 3,
      centerX: 10,
      centerY: 10,
      angle: 30
    })
  @State image: (ResourceStr)[] = [$r('app.media.icon')]
  @State imageIndex: number = 0;

  build() {
    Row() {
      Column() {
        Button('图片资源多类型确认')
          .width('100%')
          .margin(10)
          .fontSize(20)
          .onClick(() => {
            this.imageIndex = (this.imageIndex + 1) % this.image.length
          })
          .id('button1')
        Image(this.image[this.imageIndex])
          .objectFit(ImageFit.MATRIX)
          .imageMatrix(this.matrix2)
          .border({ width: 10, color: Color.Blue })
          .width(300)
          .height(300)
          .key('imageMatrix')
      }
    }
  }
}