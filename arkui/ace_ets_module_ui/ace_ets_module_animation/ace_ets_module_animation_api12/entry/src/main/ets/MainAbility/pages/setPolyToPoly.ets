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
import matrix4 from '@ohos.matrix4'

@Entry
@Component
struct setPolyToPoly {
  private matrix1 = matrix4.identity()
    .setPolyToPoly({ src: [{ x: 0, y: 0 }, { x: 200, y: 0 }, { x: 0, y: 200 }, { x: 200, y: 200 }],
      dst: [{ x: 150, y: 0 }, { x: 250, y: 0 }, { x: 0, y: 200 }, { x: 200, y: 200 }], pointCount: 4 })

  build() {
    Column() {
      Image($r("app.media.icon"))
        .id('ImageSetPoly')
        .transform(this.matrix1)
        .width(150)
        .height(150)
    }
    .width('100%')
    .height('100%')
  }
}