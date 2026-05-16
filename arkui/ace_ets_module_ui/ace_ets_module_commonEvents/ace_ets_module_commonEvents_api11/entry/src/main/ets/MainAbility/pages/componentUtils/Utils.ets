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

import { matrix4 } from '@kit.ArkUI';
@Entry
@Component
struct Utils {
  @State x: number = 120;
  @State y: number = 10;
  @State z: number = 100;
  @State value: string = '';
  private matrix1 = matrix4.identity().translate({ x: this.x, y: this.y, z: this.z });

  build() {
    Column() {
      Image($r("app.media.icon"))
        .transform(this.matrix1)
        .translate({ x: 20, y: 20, z: 20 })
        .scale({
          x: 0.5,
          y: 0.5,
          centerX: 150,
          centerY: 50,
          z: 1
        })
        .rotate({
          x: 1,
          y: 1,
          z: 1,
          centerX: 150,
          centerY: 50,
          angle: 300
        })
        .width('30%')
        .height('10%')
        .key("image_01")
      Button('getRectangleById')
        .onClick(() => {
          this.value = JSON.stringify(this.getUIContext()
            .getComponentUtils()
            .getRectangleById("image_01"))
        }).margin(10).id('onClick')
      Text(this.value)
        .margin(20)
        .width('80%')
        .height('50%')
        .borderWidth(2)
        .id('text')
    }.width('100%')
    .height('100%')
  }
}