/**
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
import { matrix4 } from '@kit.ArkUI';

@Entry
@Component
struct rotatePage {
  private matrix1 = matrix4.identity()
    .rotate({
      x: 0,
      y: 0,
      z: 1,
      angle: 45
    })

  build() {
    Column() {
      Image($r('app.media.icon')).transform(this.matrix1)
        .width('40%')
        .height(100)
        .id('rotatePage_image')
    }.width('100%').margin({ top: 50 })
  }
}