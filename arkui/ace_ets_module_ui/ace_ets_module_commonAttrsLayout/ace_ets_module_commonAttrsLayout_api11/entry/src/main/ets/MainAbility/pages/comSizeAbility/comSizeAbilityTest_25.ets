/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import matrix4 from '@ohos.matrix4'

let matrix = matrix4.init([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0])

@Entry
@Component
struct comSizeAbilityTest_25 {
  build() {
    Scroll() {
      Column({ space: 20 }) {
        Column() {
          Text() {
            ImageSpan($r('app.media.icon'))
              .size({ width: 100, height: 100 })
              .translate({ x: 1, y: 1, z: 1 })
              .scale({
                x: 1,
                y: 1,
                z: 1,
                centerX: 1,
                centerY: 1
              })
              .rotate({
                x: 1,
                y: 1,
                z: 1,
                angle: 0,
                centerX: 1,
                centerY: 1
              })
              .transform(matrix)
              .key("ImageSpan_Size")
              .objectFit(ImageFit.Fill)
              .verticalAlign(ImageSpanAlignment.CENTER)
            Span('I am LineThrough-span')
              .decoration({ type: TextDecorationType.LineThrough, color: Color.Red }).fontSize(25)
          }.key('ImageSpan_Father')
        }
      }.width('100%')
    }.height('100%')
  }
}


