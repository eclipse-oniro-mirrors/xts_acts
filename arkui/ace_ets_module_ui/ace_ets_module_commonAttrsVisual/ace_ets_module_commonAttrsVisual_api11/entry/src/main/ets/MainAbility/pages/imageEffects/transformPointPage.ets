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

AppStorage.setOrCreate('transformPointPage_transformPoint0', -1)
AppStorage.setOrCreate('transformPointPage_transformPoint1', -1)

@Entry
@Component
struct Test {
  private originPoint: number[] = [50, 50]
  private matrix_1 = matrix4.identity().translate({ x: 150, y: -50 })
  private transformPoint = this.matrix_1.transformPoint([this.originPoint[0], this.originPoint[1]])
  private matrix_2 = matrix4.identity().translate({ x: this.transformPoint[0], y: this.transformPoint[1] })

  build() {
    Column() {
      Button('getNum').onClick(()=>{
        AppStorage.setOrCreate('transformPointPage_transformPoint0', this.transformPoint[0])
        AppStorage.setOrCreate('transformPointPage_transformPoint1', this.transformPoint[1])
        console.info('1111')
      }).id('transformPointPage_btn')

      Text(`矩阵变换前的坐标：[${this.originPoint}]`)
        .fontSize(16)
      Image($r('app.media.icon'))
        .width('600px')
        .height('300px')
        .margin({ top: 50 })
      Text(`矩阵变换后的坐标：[${this.transformPoint}]`)
        .fontSize(16)
        .margin({ top: 100 })
      Image($r('app.media.icon'))
        .width('600px')
        .height('300px')
        .margin({ top: 50 })
        .transform(this.matrix_2)
    }.width('100%').padding(50)
  }
}