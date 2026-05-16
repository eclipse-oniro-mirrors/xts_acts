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
import { CircleShape } from '@kit.ArkUI';

@Entry
@Component
struct BaseShapeWidthHeightNullUndefined {
  build() {
    Column() {
      Text('BaseShape Width/Height Null/Undefined Test')
        .fontSize(20)
        .height('3%')

      Column() {
        Text('width: null')
          .fontSize(14)
      }
      .id('BaseShapeWidthHeightNullUndefined_Column_WidthNull')
      .height('3%')
      .backgroundColor(Color.Blue)
      .clipShape(new CircleShape().width(null))

      Column() {
        Text('width: undefined')
          .fontSize(14)
      }
      .id('BaseShapeWidthHeightNullUndefined_Column_WidthUndefined')
      .height('3%')
      .backgroundColor(Color.Green)
      .clipShape(new CircleShape().width(undefined))

      Column() {
        Text('width: empty string')
          .fontSize(14)
      }
      .id('BaseShapeWidthHeightNullUndefined_Column_WidthEmpty')
      .height('3%')
      .backgroundColor(Color.Yellow)
      .clipShape(new CircleShape().width(''))

      Column() {
        Text('height: null')
          .fontSize(14)
      }
      .id('BaseShapeWidthHeightNullUndefined_Column_HeightNull')
      .backgroundColor(Color.Red)
      .clipShape(new CircleShape().height(null))

      Column() {
        Text('height: undefined')
          .fontSize(14)
      }
      .id('BaseShapeWidthHeightNullUndefined_Column_HeightUndefined')
      .backgroundColor(Color.Pink)
      .clipShape(new CircleShape().height(undefined))

      Column() {
        Text('height: empty string')
          .fontSize(14)
      }
      .id('BaseShapeWidthHeightNullUndefined_Column_HeightEmpty')
      .backgroundColor(Color.Orange)
      .clipShape(new CircleShape().height(''))
    }
    .width('100%')
    .height('100%')
  }
}
